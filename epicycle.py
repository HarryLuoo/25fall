#!/usr/bin/env python3
"""
Epicycle GUI (Tkinter)
----------------------
A simple, single‑file GUI for generating Fourier epicycle drawings from regular images.

What's new (v3):
- **Tooltips everywhere** — hover any label or input to see concise explanations.
- **Modes**
  1) *Contour (largest)* — original silhouette workflow (good for single closed shapes).
  2) *PointCloud (TSP)* — QEDcat/Mathologer‑style: binarize → (optional) skeletonize to 1‑px lines →
     collect all black pixels → build a single long path by a greedy Traveling Salesman tour → resample → FFT.
     This faithfully follows **line drawings**, not just the outer edge.
- **Max points** (for PointCloud mode): decimate point set before the tour for speed.
- **Otsu threshold** + optional invert.

Dependencies
    pip install numpy opencv-python matplotlib pillow
    # for line‑drawing faithfulness (PointCloud mode):
    pip install scikit-image  # skeletonize

Run
    python EpicycleGUI.py

Notes
- PointCloud mode is closest to the Homer notebook: it orders *all* stroke pixels into one curve
  before taking the DFT. If scikit‑image is not present, it will fall back to edge pixels (still works, but less ideal).
- For large drawings, keep Max points in the 1–5k range to stay responsive.

(c) 2025. MIT License.
"""
from __future__ import annotations

import os
import math
from dataclasses import dataclass
from typing import Optional, Tuple

import numpy as np
import cv2
import tkinter as tk
from tkinter import ttk, filedialog, messagebox

from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
from matplotlib.figure import Figure
from matplotlib import animation

# Optional skeletonization
_HAS_SK = True
try:
    from skimage.morphology import skeletonize
except Exception:
    _HAS_SK = False

# --------------------------------- Tooltips ----------------------------------- #

class Tooltip:
    """Lightweight tooltip for Tk/ttk widgets (hover to show)."""
    def __init__(self, widget: tk.Widget, text: str, delay: int = 500, wraplength: int = 380):
        self.widget = widget
        self.text = text
        self.delay = delay
        self.wraplength = wraplength
        self._id = None
        self._tip: Optional[tk.Toplevel] = None
        widget.bind("<Enter>", self._enter, add=True)
        widget.bind("<Leave>", self._leave, add=True)
        widget.bind("<ButtonPress>", self._leave, add=True)

    def _enter(self, _):
        self._schedule()

    def _leave(self, _):
        self._unschedule()
        self._hide()

    def _schedule(self):
        self._unschedule()
        self._id = self.widget.after(self.delay, self._show)

    def _unschedule(self):
        if self._id is not None:
            try:
                self.widget.after_cancel(self._id)
            except Exception:
                pass
            self._id = None

    def _show(self):
        if self._tip is not None:
            return
        x = self.widget.winfo_pointerx() + 14
        y = self.widget.winfo_pointery() + 12
        tip = tk.Toplevel(self.widget)
        tip.wm_overrideredirect(True)
        try:
            tip.wm_attributes("-topmost", True)
        except Exception:
            pass
        lbl = tk.Label(
            tip,
            text=self.text,
            justify=tk.LEFT,
            background="#ffffe0",
            relief=tk.SOLID,
            borderwidth=1,
            wraplength=self.wraplength,
            font=("TkDefaultFont", 9),
            padx=8,
            pady=6,
        )
        lbl.pack()
        tip.wm_geometry(f"+{x}+{y}")
        self._tip = tip

    def _hide(self):
        if self._tip is not None:
            try:
                self._tip.destroy()
            except Exception:
                pass
            self._tip = None

# --------------------------- Image → curve utilities --------------------------- #

def auto_canny(gray: np.ndarray, sigma: float = 0.33) -> np.ndarray:
    """Auto‑tuned Canny thresholds based on image median."""
    v = float(np.median(gray))
    lower = int(max(0, (1.0 - sigma) * v))
    upper = int(min(255, (1.0 + sigma) * v))
    return cv2.Canny(gray, lower, upper)

def otsu_binarize(gray: np.ndarray) -> np.ndarray:
    """Otsu threshold to binary (foreground=1 for dark ink on light bg)."""
    g = cv2.normalize(gray, None, 0, 255, cv2.NORM_MINMAX)
    _, bw = cv2.threshold(g, 0, 255, cv2.THRESH_BINARY_INV + cv2.THRESH_OTSU)
    return (bw > 0).astype(np.uint8)

def largest_external_contour(binary_edges: np.ndarray) -> np.ndarray:
    """Return Nx2 array of the largest external contour points (float64)."""
    cnts, _ = cv2.findContours(binary_edges, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_NONE)
    if not cnts:
        raise RuntimeError("No contours found. Try adjusting blur/sigma/morph or invert.")
    lengths = [cv2.arcLength(c, True) for c in cnts]
    cnt = cnts[int(np.argmax(lengths))]
    cnt = cnt[:, 0, :].astype(np.float64)
    return cnt

def resample_closed_polyline(pts: np.ndarray, N: int) -> np.ndarray:
    """Uniformly resample a closed polyline (Nx2) to N points by arclength."""
    if not np.array_equal(pts[0], pts[-1]):
        pts = np.vstack([pts, pts[0]])
    seg = np.diff(pts, axis=0)
    d = np.hypot(seg[:, 0], seg[:, 1])
    s = np.concatenate([[0.0], np.cumsum(d)])
    total = s[-1]
    if total <= 0:
        raise RuntimeError("Degenerate contour: zero length.")
    s_target = np.linspace(0, total, N, endpoint=False)
    x = np.interp(s_target, s, pts[:, 0])
    y = np.interp(s_target, s, pts[:, 1])
    return np.column_stack([x, y]).astype(np.float64)

# ----------------------------- PointCloud (TSP) -------------------------------- #

def skeleton_points(gray: np.ndarray, morph_close: int = 0) -> np.ndarray:
    """Return coordinates (N,2) of skeleton pixels from a grayscale image.
    If scikit-image is unavailable, fall back to Canny edges (thinned-ish)."""
    bw = otsu_binarize(gray)  # bool 0/1 (ink=1)
    if morph_close and morph_close > 0:
        k = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (morph_close, morph_close))
        bw = cv2.morphologyEx(bw, cv2.MORPH_CLOSE, k, iterations=1)
    if _HAS_SK:
        from skimage.morphology import skeletonize  # local import ensures optional dep
        skel = skeletonize(bw.astype(bool))
        yy, xx = np.nonzero(skel)
    else:
        edges = auto_canny(gray)
        yy, xx = np.nonzero(edges)
    pts = np.column_stack([xx.astype(np.float64), yy.astype(np.float64)])
    return pts

def decimate_points(pts: np.ndarray, max_points: int) -> np.ndarray:
    """Subsample points uniformly at random if too many."""
    n = len(pts)
    if max_points and n > max_points:
        idx = np.random.default_rng(12345).choice(n, size=max_points, replace=False)
        return pts[idx]
    return pts

def greedy_tour(points: np.ndarray) -> np.ndarray:
    """Simple O(N^2) nearest‑neighbor tour through 2D points. Returns index order."""
    n = len(points)
    if n == 0:
        return np.empty(0, dtype=int)
    diffs = points - points.mean(axis=0)
    start = int(np.argmin(np.einsum('ij,ij->i', diffs, diffs)))
    order = np.empty(n, dtype=int)
    order[0] = start
    used = np.zeros(n, dtype=bool)
    used[start] = True
    for i in range(1, n):
        cur = order[i - 1]
        mask = ~used
        cand_idx = np.where(mask)[0]
        d = np.sum((points[cand_idx] - points[cur]) ** 2, axis=1)
        jlocal = int(np.argmin(d))
        j = cand_idx[jlocal]
        order[i] = j
        used[j] = True
    return order

def pointcloud_to_curve_ordered(gray: np.ndarray, max_points: int, morph_close: int, invert_gray: bool) -> np.ndarray:
    """Build an ordered 2D point path from an image's line art.
    Steps: binarize → (optional) skeletonize → decimate → greedy TSP order.
    Returns (N,2) float points in image coords."""
    g = gray.copy()
    if invert_gray:
        g = 255 - g
    pts = skeleton_points(g, morph_close=morph_close)
    if len(pts) < 10:
        raise RuntimeError("Too few stroke pixels detected. Try 'Invert', raise 'Morph close', or use a cleaner image.")
    pts = decimate_points(pts, max_points=max_points)
    order = greedy_tour(pts)
    return pts[order]

# ------------------------------- Fourier / FFT -------------------------------- #

def fourier_coeffs(z: np.ndarray) -> Tuple[np.ndarray, np.ndarray]:
    N = len(z)
    C = np.fft.fft(z) / N
    k = np.fft.fftfreq(N, d=1.0 / N).astype(int)
    return k, C

def select_terms(k: np.ndarray, C: np.ndarray, M: int, order: str = "amp") -> Tuple[np.ndarray, np.ndarray]:
    N = len(C)
    M = min(M, N)
    if order == "amp":
        idx = np.argsort(np.abs(C))[::-1]
        dc_idx = np.where(k == 0)[0]
        if dc_idx.size:
            idx = np.concatenate([dc_idx, idx[idx != dc_idx[0]]])
        idx = idx[:M]
    elif order == "freq":
        order_list = [0]
        i = 1
        while len(order_list) < M:
            order_list.extend([i, -i])
            i += 1
        k_to_idx = {int(kk): ii for ii, kk in enumerate(k)}
        idx = [k_to_idx[kk] for kk in order_list if kk in k_to_idx][:M]
        idx = np.array(idx, dtype=int)
    else:
        raise ValueError("order must be 'amp' or 'freq'")
    return k[idx], C[idx]

def reconstruct_points(k_sel: np.ndarray, C_sel: np.ndarray, T: int) -> np.ndarray:
    t = np.linspace(0.0, 1.0, T, endpoint=False)
    Z = np.zeros(T, dtype=np.complex128)
    for kk, cc in zip(k_sel, C_sel):
        Z += cc * np.exp(2j * np.pi * kk * t)
    return Z

# ---------------------------------- GUI App ----------------------------------- #

@dataclass
class ImageParams:
    path: str
    samples: int
    blur: int
    sigma: float
    morph: int
    invert: bool
    mode: str
    max_points: int

class EpicycleApp(tk.Tk):
    def __init__(self):
        super().__init__()
        self.title("Epicycle Drawer (Fourier Circles)")
        self.geometry("1180x780")

        # State
        self.z: Optional[np.ndarray] = None
        self.k: Optional[np.ndarray] = None
        self.C: Optional[np.ndarray] = None
        self.cached_params: Optional[ImageParams] = None
        self.anim: Optional[animation.FuncAnimation] = None
        self._tooltips = []  # keep refs

        # Widgets
        self._build_widgets()

    # ------------------------------- UI layout -------------------------------- #
    def _build_widgets(self):
        root = self

        # Left: controls
        ctrl = ttk.Frame(root, padding=10)
        ctrl.pack(side=tk.LEFT, fill=tk.Y)

        # File selection
        file_frame = ttk.LabelFrame(ctrl, text="Image")
        file_frame.pack(fill=tk.X, pady=(0, 10))
        self.path_var = tk.StringVar()
        btn_open = ttk.Button(file_frame, text="Open…", command=self.on_open)
        btn_open.pack(side=tk.LEFT)
        ent_path = ttk.Entry(file_frame, textvariable=self.path_var, width=48)
        ent_path.pack(side=tk.LEFT, padx=6)
        self.add_tip(btn_open, "Load an input image (PNG/JPG/TIFF). High‑contrast line art works best.")
        self.add_tip(ent_path, "Selected image path.")

        # Parameters (image → curve)
        imgp = ttk.LabelFrame(ctrl, text="Edge & Sampling")
        imgp.pack(fill=tk.X, pady=(0, 10))

        self.mode_var = tk.StringVar(value="PointCloud (TSP)")
        lab_mode, cb_mode = self._row_combo(imgp, "Mode", self.mode_var, ("PointCloud (TSP)", "Contour (largest)"))
        self.add_tip(lab_mode, "Choose how to build the curve through your drawing.")
        self.add_tip(cb_mode, "PointCloud: binarize→skeletonize→tour (keeps interior lines).Contour: outer boundary only.")

        self.samples_var = tk.IntVar(value=2048)
        lab_samples, ent_samples = self._row(imgp, "Samples", self.samples_var)
        self.add_tip(lab_samples, "Number of points N sampled along the curve before the FFT.")
        self.add_tip(ent_samples, "Typical 1024–4096. Higher = sharper, slower.")

        self.blur_var = tk.IntVar(value=5)
        lab_blur, ent_blur = self._row(imgp, "Blur (px)", self.blur_var)
        self.add_tip(lab_blur, "Gaussian blur before detection (denoise / close gaps).")
        self.add_tip(ent_blur, "Try 3–7. Too high may merge strokes.")

        self.sigma_var = tk.DoubleVar(value=0.33)
        lab_sigma, ent_sigma = self._row(imgp, "Sigma (Canny)", self.sigma_var)
        self.add_tip(lab_sigma, "Auto‑Canny sensitivity (mainly for Contour mode / fallbacks).")
        self.add_tip(ent_sigma, "Larger sigma → fewer edges. Default 0.33.")

        self.morph_var = tk.IntVar(value=3)
        lab_morph, ent_morph = self._row(imgp, "Morph close (px)", self.morph_var)
        self.add_tip(lab_morph, "Morphological closing radius to seal tiny breaks in ink.")
        self.add_tip(ent_morph, "Use 3–7 for scans. 0 disables it.")

        self.maxpoints_var = tk.IntVar(value=3000)
        lab_maxp, ent_maxp = self._row(imgp, "Max points (TSP)", self.maxpoints_var)
        self.add_tip(lab_maxp, "Cap on stroke pixels kept before building the tour (PointCloud mode).")
        self.add_tip(ent_maxp, "Higher = more faithful, slower. Start 2000–5000.")

        self.invert_var = tk.BooleanVar(value=False)
        cb_invert = ttk.Checkbutton(imgp, text="Invert grayscale", variable=self.invert_var)
        cb_invert.pack(anchor=tk.W, pady=2)
        self.add_tip(cb_invert, "Treat light ink on dark background as dark ink on light (flip grayscale).")

        # Fourier terms
        four = ttk.LabelFrame(ctrl, text="Epicycles")
        four.pack(fill=tk.X, pady=(0, 10))
        self.terms_var = tk.IntVar(value=150)
        lab_terms, ent_terms = self._row(four, "Terms", self.terms_var)
        self.add_tip(lab_terms, "Number of Fourier terms M (circles).")
        self.add_tip(ent_terms, "More terms = sharper corners and small features. 120–300 typical.")

        self.order_var = tk.StringVar(value="amp")
        lab_order, cb_order = self._row_combo(four, "Order", self.order_var, ("amp", "freq"))
        self.add_tip(lab_order, "Which sequence to draw circles in.")
        self.add_tip(cb_order, "amp: largest magnitudes first.freq: 0, ±1, ±2, … classical ordering.")

        self.maxcircles_var = tk.StringVar(value="")  # optional cap for preview
        lab_mc, ent_mc = self._row(four, "Max circles (opt)", self.maxcircles_var)
        self.add_tip(lab_mc, "Limit how many circles are rendered in the preview.")
        self.add_tip(ent_mc, "Only affects visualization speed; not the reconstructed path.")

        # Animation
        animf = ttk.LabelFrame(ctrl, text="Animation")
        animf.pack(fill=tk.X, pady=(0, 10))
        self.duration_var = tk.DoubleVar(value=8.0)
        lab_dur, ent_dur = self._row(animf, "Duration (s)", self.duration_var)
        self.add_tip(lab_dur, "Total animation time in seconds.")
        self.add_tip(ent_dur, "Longer = slower tracing; doesn’t change geometry.")

        self.fps_var = tk.IntVar(value=60)
        lab_fps, ent_fps = self._row(animf, "FPS", self.fps_var)
        self.add_tip(lab_fps, "Frames per second.")
        self.add_tip(ent_fps, "Higher = smoother & larger files.")

        # Actions
        btns = ttk.Frame(ctrl)
        btns.pack(fill=tk.X, pady=(6, 6))
        btn_trace = ttk.Button(btns, text="Preview Trace", command=self.on_preview_trace)
        btn_anim = ttk.Button(btns, text="Preview Animation", command=self.on_preview_anim)
        btn_stop = ttk.Button(btns, text="Stop Animation", command=self.on_stop_anim)
        btn_trace.pack(fill=tk.X, pady=2)
        btn_anim.pack(fill=tk.X, pady=2)
        btn_stop.pack(fill=tk.X, pady=2)
        self.add_tip(btn_trace, "Quick static preview of the reconstructed path.")
        self.add_tip(btn_anim, "Play the rotating‑circles animation in the window.")
        self.add_tip(btn_stop, "Halt the current preview animation.")

        ttk.Separator(ctrl, orient=tk.HORIZONTAL).pack(fill=tk.X, pady=8)
        btn_save_png = ttk.Button(ctrl, text="Save Trace PNG…", command=self.on_save_trace)
        btn_save_anim = ttk.Button(ctrl, text="Save Animation GIF/MP4…", command=self.on_save_anim)
        btn_save_png.pack(fill=tk.X, pady=2)
        btn_save_anim.pack(fill=tk.X, pady=2)
        self.add_tip(btn_save_png, "Export the path only (no circles) as a high‑resolution PNG.")
        self.add_tip(btn_save_anim, "Render the full animation to GIF or MP4 (MP4 requires ffmpeg).")

        # Right: canvas (matplotlib)
        right = ttk.Frame(root)
        right.pack(side=tk.RIGHT, fill=tk.BOTH, expand=True)

        self.fig = Figure(figsize=(6.8, 6.8), dpi=100)
        self.ax = self.fig.add_subplot(111)
        self.ax.set_aspect("equal", adjustable="box")
        self.ax.axis("off")
        self.canvas = FigureCanvasTkAgg(self.fig, master=right)
        self.canvas.get_tk_widget().pack(fill=tk.BOTH, expand=True)

        # Status
        self.status_var = tk.StringVar(value="Hover any control for help. Use PointCloud (TSP) for line drawings.")
        ttk.Label(root, textvariable=self.status_var, anchor=tk.W).pack(side=tk.BOTTOM, fill=tk.X)

    def _row(self, parent, label, var):
        row = ttk.Frame(parent)
        row.pack(fill=tk.X, pady=2)
        lab = ttk.Label(row, text=label, width=18)
        lab.pack(side=tk.LEFT)
        entry = ttk.Entry(row, textvariable=var, width=12)
        entry.pack(side=tk.LEFT)
        return lab, entry

    def _row_combo(self, parent, label, var, values):
        row = ttk.Frame(parent)
        row.pack(fill=tk.X, pady=2)
        lab = ttk.Label(row, text=label, width=18)
        lab.pack(side=tk.LEFT)
        cb = ttk.Combobox(row, textvariable=var, values=values, state="readonly", width=18)
        cb.pack(side=tk.LEFT)
        return lab, cb

    def add_tip(self, widget: tk.Widget, text: str):
        self._tooltips.append(Tooltip(widget, text))

    # ------------------------------ Event handlers ------------------------------ #

    def on_open(self):
        path = filedialog.askopenfilename(title="Open image",
                                          filetypes=[("Images", "*.png;*.jpg;*.jpeg;*.bmp;*.tif;*.tiff"),
                                                     ("All files", "*.*")])
        if not path:
            return
        self.path_var.set(path)
        self.status(f"Loaded image: {os.path.basename(path)}")
        self.cached_params = None
        self.z = self.k = self.C = None
        self.clear_axes()

    def on_preview_trace(self):
        try:
            k_sel, C_sel = self.ensure_coeffs()
        except Exception as e:
            self.error(str(e))
            return
        self.clear_axes()
        T = max(2048, int(self.samples_var.get()))
        z = reconstruct_points(k_sel, C_sel, T)
        r = 1.1 * (np.max(np.abs(z)) if np.max(np.abs(z)) > 0 else 1.0)
        self.ax.set_xlim(-r, r); self.ax.set_ylim(-r, r)
        self.ax.plot(z.real, z.imag, lw=2)
        self.canvas.draw_idle()
        self.status("Trace preview ready.")

    def on_preview_anim(self):
        try:
            k_sel, C_sel = self.ensure_coeffs()
        except Exception as e:
            self.error(str(e))
            return
        self.clear_axes()
        duration = float(self.duration_var.get())
        fps = int(self.fps_var.get())
        frames = max(30, int(duration * fps))
        t = np.linspace(0.0, 1.0, frames, endpoint=False)
        trace = reconstruct_points(k_sel, C_sel, frames)
        r = 1.1 * (np.max(np.abs(trace)) if np.max(np.abs(trace)) > 0 else 1.0)
        self.ax.set_xlim(-r, r); self.ax.set_ylim(-r, r)
        self.ax.axis("off")

        path_line, = self.ax.plot([], [], lw=2)
        circles = []
        arms = []

        max_circles = self.parse_optional_int(self.maxcircles_var.get())
        if max_circles is None:
            max_circles = len(C_sel)

        def frame(i):
            for c in circles: c.remove()
            for a in arms: a.remove()
            circles.clear(); arms.clear()
            ti = t[i]
            tip = 0 + 0j
            drawn = 0
            for kk, cc in zip(k_sel, C_sel):
                if drawn >= max_circles:
                    break
                center = tip
                tip = tip + cc * np.exp(2j * np.pi * kk * ti)
                rad = abs(cc)
                circ = self.ax.add_patch(plt_circle(center.real, center.imag, rad))
                arm, = self.ax.plot([center.real, tip.real], [center.imag, tip.imag], lw=1.1)
                circles.append(circ); arms.append(arm)
                drawn += 1
            path_line.set_data(trace[: i + 1].real, trace[: i + 1].imag)
            return [path_line] + circles + arms

        self.anim = animation.FuncAnimation(self.fig, frame, frames=frames, interval=1000 / fps, blit=False)
        self.canvas.draw_idle()
        self.status("Animating… (use 'Stop Animation' to halt)")

    def on_stop_anim(self):
        if self.anim is not None and hasattr(self.anim, 'event_source') and self.anim.event_source:
            self.anim.event_source.stop()
        self.anim = None
        self.status("Animation stopped.")

    def on_save_trace(self):
        try:
            k_sel, C_sel = self.ensure_coeffs()
        except Exception as e:
            self.error(str(e))
            return
        path = filedialog.asksaveasfilename(title="Save trace PNG",
                                            defaultextension=".png",
                                            filetypes=[("PNG", "*.png")])
        if not path:
            return
        T = max(4096, int(self.samples_var.get()))
        z = reconstruct_points(k_sel, C_sel, T)
        r = 1.1 * (np.max(np.abs(z)) if np.max(np.abs(z)) > 0 else 1.0)
        fig = Figure(figsize=(6, 6), dpi=300)
        ax = fig.add_subplot(111)
        ax.set_aspect("equal", adjustable="box")
        ax.axis("off")
        ax.set_xlim(-r, r); ax.set_ylim(-r, r)
        ax.plot(z.real, z.imag, lw=2)
        fig.savefig(path, bbox_inches='tight', pad_inches=0)
        self.status(f"Saved trace PNG → {os.path.basename(path)}")

    def on_save_anim(self):
        try:
            k_sel, C_sel = self.ensure_coeffs()
        except Exception as e:
            self.error(str(e))
            return
        path = filedialog.asksaveasfilename(title="Save animation",
                                            defaultextension=".gif",
                                            filetypes=[("GIF", "*.gif"), ("MP4", "*.mp4")])
        if not path:
            return
        duration = float(self.duration_var.get())
        fps = int(self.fps_var.get())
        frames = max(30, int(duration * fps))
        t = np.linspace(0.0, 1.0, frames, endpoint=False)
        trace = reconstruct_points(k_sel, C_sel, frames)
        r = 1.1 * (np.max(np.abs(trace)) if np.max(np.abs(trace)) > 0 else 1.0)

        fig = Figure(figsize=(6, 6), dpi=150)
        ax = fig.add_subplot(111)
        ax.set_aspect("equal", adjustable="box")
        ax.axis("off")
        ax.set_xlim(-r, r); ax.set_ylim(-r, r)

        path_line, = ax.plot([], [], lw=2)
        circles = []
        arms = []
        max_circles = self.parse_optional_int(self.maxcircles_var.get())
        if max_circles is None:
            max_circles = len(C_sel)

        def frame(i):
            for c in circles: c.remove()
            for a in arms: a.remove()
            circles.clear(); arms.clear()
            ti = t[i]
            tip = 0 + 0j
            for kk, cc in zip(k_sel, C_sel):
                if len(circles) >= max_circles:
                    break
                center = tip
                tip = tip + cc * np.exp(2j * np.pi * kk * ti)
                rad = abs(cc)
                circ = ax.add_patch(plt_circle(center.real, center.imag, rad))
                arm, = ax.plot([center.real, tip.real], [center.imag, tip.imag], lw=1.1)
                circles.append(circ); arms.append(arm)
            path_line.set_data(trace[: i + 1].real, trace[: i + 1].imag)
            return [path_line] + circles + arms

        anim = animation.FuncAnimation(fig, frame, frames=frames, interval=1000 / fps, blit=False)

        ext = os.path.splitext(path)[1].lower()
        try:
            if ext == ".gif":
                writer = animation.PillowWriter(fps=fps)
                anim.save(path, writer=writer)
            elif ext == ".mp4":
                if not animation.writers.is_available('ffmpeg'):
                    raise RuntimeError("ffmpeg is not available. Install it or save as GIF.")
                Writer = animation.writers['ffmpeg']
                writer = Writer(fps=fps, bitrate=1800)
                anim.save(path, writer=writer)
            else:
                raise RuntimeError("Unsupported extension. Use .gif or .mp4")
        except Exception as e:
            self.error(str(e))
            return
        self.status(f"Saved animation → {os.path.basename(path)}")

    # --------------------------------- Helpers --------------------------------- #

    def ensure_coeffs(self) -> Tuple[np.ndarray, np.ndarray]:
        path = self.path_var.get().strip()
        if not path:
            raise RuntimeError("Please open an image first.")
        try:
            samples = int(self.samples_var.get())
            blur = int(self.blur_var.get())
            sigma = float(self.sigma_var.get())
            morph = int(self.morph_var.get())
            invert = bool(self.invert_var.get())
            terms = int(self.terms_var.get())
            order = self.order_var.get().strip()
            mode = self.mode_var.get().strip()
            max_points = int(self.maxpoints_var.get())
        except Exception:
            raise RuntimeError("Invalid parameter values.")

        imgp = ImageParams(path, samples, blur, sigma, morph, invert, mode, max_points)
        if self.cached_params != imgp or self.z is None:
            self.status("Building polyline and computing FFT…")
            gray = cv2.imread(path, cv2.IMREAD_GRAYSCALE)
            if gray is None:
                raise FileNotFoundError(f"Cannot read image: {path}")

            if mode.startswith("PointCloud"):
                if invert:
                    gray = 255 - gray
                if blur > 0:
                    k = max(3, blur | 1)
                    grayb = cv2.GaussianBlur(gray, (k, k), 0)
                else:
                    grayb = gray
                pts = pointcloud_to_curve_ordered(grayb, max_points=max_points, morph_close=morph, invert_gray=False)
                x = pts[:, 0].astype(np.float64)
                y = -pts[:, 1].astype(np.float64)
                x -= x.mean(); y -= y.mean()
                scale = max(np.ptp(x), np.ptp(y)) or 1.0
                x /= scale; y /= scale
                pts_res = resample_closed_polyline(np.column_stack([x, y]), samples)
                self.z = pts_res[:, 0] + 1j * pts_res[:, 1]
            else:  # Contour (largest)
                if invert:
                    gray = 255 - gray
                if blur > 0:
                    k = max(3, blur | 1)
                    grayb = cv2.GaussianBlur(gray, (k, k), 0)
                else:
                    grayb = gray
                edges = auto_canny(grayb, sigma=sigma)
                if morph and morph > 0:
                    mk = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (morph, morph))
                    edges = cv2.morphologyEx(edges, cv2.MORPH_CLOSE, mk, iterations=1)
                cnt = largest_external_contour(edges)
                pts_res = resample_closed_polyline(cnt.astype(np.float64), samples)
                x = pts_res[:, 0]
                y = -pts_res[:, 1]
                x -= x.mean(); y -= y.mean()
                scale = max(np.ptp(x), np.ptp(y)) or 1.0
                self.z = (x / scale) + 1j * (y / scale)

            self.k, self.C = fourier_coeffs(self.z)
            self.cached_params = imgp

        if self.k is None or self.C is None:
            raise RuntimeError("Internal error: coefficients not ready.")

        k_sel, C_sel = select_terms(self.k, self.C, terms, order=order)
        return k_sel, C_sel

    def parse_optional_int(self, s: str) -> Optional[int]:
        s = (s or "").strip()
        if not s:
            return None
        try:
            v = int(s)
            return v if v > 0 else None
        except Exception:
            return None

    def clear_axes(self):
        self.ax.cla()
        self.ax.set_aspect("equal", adjustable="box")
        self.ax.axis("off")
        self.canvas.draw_idle()

    def status(self, msg: str):
        self.status_var.set(msg)
        self.update_idletasks()

    def error(self, msg: str):
        messagebox.showerror("Error", msg)
        self.status(msg)

# ------------------------------- small helpers -------------------------------- #

def plt_circle(x: float, y: float, r: float):
    import matplotlib.patches as mpatches
    return mpatches.Circle((x, y), r, fill=False, lw=1.0, alpha=0.35)

# ----------------------------------- main ------------------------------------- #

if __name__ == "__main__":
    app = EpicycleApp()
    app.mainloop()
