# -*- coding: utf-8 -*-
"""
Main panel: One-shot logical X-coherence curves for a square-lattice GKP qubit
under pure loss followed by Petz (transpose) recovery.

Pipeline per point (nmax, x):
  Build finite-energy |0>,|1>  → form |+>  → LOSS(eta=e^{-x})  → PETZ  → Decode
  → ⟨X_L⟩_cond(x) and diagnostics.

We parallelize across nmax (each process builds codewords once and sweeps x).
JSON output contains all important data; plotting can be done separately.

Notes:
- Petz completion (K_extra) is enabled; on on-support inputs it does not alter the result,
  but it guarantees CPTP numerics and robust TP residuals.
- Conditional expectation equals leakage-aware for the Petz curve (w≈1), but we still record w.
- For the no-EC baseline, conditional can hide leakage; we record w_noEC explicitly.
"""

from __future__ import annotations
from dataclasses import dataclass, asdict
from typing import List, Tuple, Dict, Optional
import json
import traceback
import numpy as np
from concurrent.futures import ProcessPoolExecutor, as_completed

from qutip import (
    Qobj, coherent, destroy, fock, identity, ket2dm, num, qzero, expect
)

# -------------------------
# 0) CONFIG
# -------------------------

@dataclass
class ObsXConfig:
    # Energies (mean photon targets per codeword)
    nmax_list: List[float]

    # Loss depths x = -ln(eta); choose e.g. np.linspace(0, 0.5, 11).tolist()
    x_list: List[float]

    # Petz options
    petz_eps: float = 1e-9
    add_completion: bool = True

    # Numerics
    use_loewdin: bool = True
    gkp_overlap_warn: float = 5e-2
    numeric_tol: float = 1e-12

    # Baseline
    run_noec: bool = True

    # Parallelization
    num_workers: int = 4  # processes over nmax

    # Output
    output_json: str = "gkp_one_shot_X_coherence.json"


# -------------------------
# 1) GKP code construction (square lattice, finite energy)
# -------------------------

def gkps_code_states(Delta: float, Ncut: int, n_sum: int) -> Tuple[Qobj, Qobj]:
    """Finite-energy square-lattice GKP |0>,|1> via Gaussian-weighted coherent-state lattice sum."""
    psi0 = fock(Ncut, 0) * 0.0
    psi1 = fock(Ncut, 0) * 0.0

    sqrt_pi_over_2 = np.sqrt(np.pi / 2.0)
    env_pref = - (np.pi / 2.0) * (Delta ** 2)
    phase_pref = -1j * np.pi

    thresh = 1e-14
    for n1 in range(-n_sum, n_sum + 1):
        for n2 in range(-n_sum, n_sum + 1):
            # μ=0
            mu0 = 0
            alpha0 = sqrt_pi_over_2 * ((2 * n1 + mu0) + 1j * n2)
            w0 = np.exp(env_pref * ((2 * n1 + mu0) ** 2 + n2 ** 2))
            if abs(w0) > thresh:
                ph0 = np.exp(phase_pref * (n1 + mu0 / 2.0) * n2)
                psi0 += w0 * ph0 * coherent(Ncut, alpha0)
            # μ=1
            mu1 = 1
            alpha1 = sqrt_pi_over_2 * ((2 * n1 + mu1) + 1j * n2)
            w1 = np.exp(env_pref * ((2 * n1 + mu1) ** 2 + n2 ** 2))
            if abs(w1) > thresh:
                ph1 = np.exp(phase_pref * (n1 + mu1 / 2.0) * n2)
                psi1 += w1 * ph1 * coherent(Ncut, alpha1)

    ket0 = psi0.unit() if psi0.norm() > 1e-14 else qzero(Ncut)
    ket1 = psi1.unit() if psi1.norm() > 1e-14 else qzero(Ncut)
    return ket0, ket1


def mean_photon_number(ket0: Qobj, ket1: Qobj, Ncut: int) -> float:
    N = num(Ncut)
    return 0.5 * (expect(N, ket0) + expect(N, ket1))


def choose_lattice_sum(Delta: float, eps_lat: float = 1e-10) -> int:
    """Tail bound: exp(-(π/2) Δ^2 R^2) < eps_lat, farthest corner ≈ √5 · n_sum."""
    R_target = np.sqrt(2.0 * np.log(1.0/eps_lat) / (np.pi * Delta**2))
    n_sum = int(np.ceil(R_target / np.sqrt(5.0))) + 1
    return max(10, n_sum)


def choose_ncut(n_max: float) -> int:
    """Adaptive Fock cutoff; simple heuristic."""
    return int(np.ceil(12.0 * n_max + 20.0))


def choose_delta_for_nmax(n_max: float, Ncut: int, target_tol: float = 0.05) -> Tuple[float, int, float]:
    """
    Search Δ so that mean photon is close to n_max without exceeding by > target_tol.
    Returns (Delta, n_sum(Delta), nbar_pre_loewdin).
    """
    grid = np.geomspace(0.12, 0.9, 36)   # small Δ → high energy; large Δ → low energy
    best_ok = None
    best_gap_ok = np.inf
    best_any = None
    best_gap_any = np.inf

    for Delta in grid[::-1]:
        n_sum = choose_lattice_sum(Delta, eps_lat=1e-10)
        k0, k1 = gkps_code_states(Delta, Ncut, n_sum)
        nbar = mean_photon_number(k0, k1, Ncut)
        if np.isnan(nbar):
            continue
        gap = abs(nbar - n_max)
        if gap < best_gap_any:
            best_any = (float(Delta), int(n_sum), float(nbar))
            best_gap_any = gap
        if nbar <= n_max * (1.0 + target_tol) and gap < best_gap_ok:
            best_ok = (float(Delta), int(n_sum), float(nbar))
            best_gap_ok = gap

    return best_ok if best_ok is not None else best_any


def loewdin_orthonormalize(ket0: Qobj, ket1: Qobj) -> Tuple[Qobj, Qobj, float, float]:
    """
    Löwdin symmetric orthonormalization on span{|0>,|1>}.
    Returns (|0~>, |1~>, |<0|1>| before, ||S - I||_F).
    """
    g01 = complex(ket0.overlap(ket1))
    G = np.array([[1.0, g01], [np.conj(g01), 1.0]], dtype=complex)
    evals, U = np.linalg.eigh(G)
    invsqrt = U @ np.diag(1.0 / np.sqrt(np.maximum(evals, 1e-16))) @ U.conj().T
    S = invsqrt
    # Frobenius norm of deviation for diagnostics
    dev = np.linalg.norm(S - np.eye(2), ord='fro')
    ket0_t = (S[0, 0] * ket0) + (S[1, 0] * ket1)
    ket1_t = (S[0, 1] * ket0) + (S[1, 1] * ket1)
    return ket0_t.unit(), ket1_t.unit(), abs(g01), float(dev)


def make_codespace_projector(ket0: Qobj, ket1: Qobj) -> Qobj:
    return ket2dm(ket0) + ket2dm(ket1)


# -------------------------
# 2) Pure loss + TP diagnostics
# -------------------------

# def pure_loss_kraus(eta: float, Ncut: int) -> List[Qobj]:
#     """
#     Pure-loss channel Kraus at transmissivity η ∈ (0,1]:
#       N_ℓ = sqrt((1-η)^ℓ / ℓ!) · η^{n/2} · a^ℓ
#     """
#     if not (0.0 < eta <= 1.0):
#         raise ValueError("eta must be in (0,1].")
#     if np.isclose(eta, 1.0):
#         return [identity(Ncut)]

#     a = destroy(Ncut)
#     n_diag = np.arange(Ncut, dtype=float)
#     damp = Qobj(np.diag(eta ** (0.5 * n_diag)), dims=[[Ncut], [Ncut]])

#     ops = []
#     a_pow = identity(Ncut)
#     coeff = 1.0
#     l_max = Ncut - 1

#     for l in range(l_max + 1):
#         E_l = coeff * (damp * a_pow)
#         if E_l.norm('fro') < 1e-14:
#             break
#         ops.append(E_l)
#         a_pow = a_pow * a
#         if a_pow.norm('max') < 1e-16:
#             break
#         coeff *= np.sqrt((1.0 - eta) / (l + 1.0))

#     return ops

def pure_loss_kraus(eta: float, Ncut: int, tol: float = 1e-14) -> List[Qobj]:
    """
    Pure-loss channel Kraus at transmissivity η ∈ (0,1]:
      E_0 = η^{n/2}
      E_{ℓ+1} = sqrt((1-η)/((ℓ+1)η)) · a · E_ℓ
    This recurrence is algebraically identical to the closed form
      E_ℓ = sqrt((1-η)^ℓ / ℓ!) · η^{n/2} · a^ℓ
    but avoids overflow from explicitly forming a^ℓ.
    """
    if not (0.0 < eta <= 1.0):
        raise ValueError("eta must be in (0,1].")
    if np.isclose(eta, 1.0):
        return [identity(Ncut)]

    a = destroy(Ncut)

    # damp = η^{n/2} (diagonal)
    n_diag = np.arange(Ncut, dtype=float)
    damp = Qobj(np.diag(eta ** (0.5 * n_diag)), dims=[[Ncut], [Ncut]])

    ops: List[Qobj] = []
    E = damp  # E_0
    ops.append(E)

    # Fixed factor outside the 1/sqrt(ℓ+1)
    fac = np.sqrt((1.0 - eta) / eta)

    ell = 0
    while True:
        ell_next = ell + 1
        coeff = fac / np.sqrt(ell_next)         # sqrt((1-η)/((ℓ+1)η))
        E = coeff * (a * E)                     # E_{ℓ+1}

        # Termination: negligible contribution or nilpotency of a
        if E.norm('fro') < tol:
            break
        ops.append(E)

        if ell_next >= Ncut - 1:                # last nonzero a^{Ncut-1}
            break
        ell = ell_next

    return ops


# def kraus_tp_residual(ops: List[Qobj]) -> Tuple[float, float, int]:
#     N = ops[0].dims[0][0]
#     acc = qzero(N)
#     for E in ops:
#         acc += E.dag() * E
#     acc = 0.5 * (acc + acc.dag())
#     resid = acc - identity(N)
#     fro = resid.norm('fro')
#     spec = float(np.max(np.abs(np.linalg.eigvalsh(resid.full()))))
#     return fro, spec, len(ops)

def kraus_tp_residual(ops: List[Qobj]) -> Tuple[float, Optional[float], int]:
    N = ops[0].dims[0][0]
    acc = qzero(N)
    for E in ops:
        acc += E.dag() * E
    acc = 0.5 * (acc + acc.dag())
    resid = acc - identity(N)

    fro = resid.norm('fro')
    A = resid.full()
    A = 0.5 * (A + A.conj().T)  # enforce Hermitian in ndarray too

    if not np.isfinite(A).all():
        # non-finite numbers: report Frobenius but avoid NaN in JSON
        return fro, None, len(ops)

    try:
        spec = float(np.max(np.abs(np.linalg.eigvalsh(A))))
    except np.linalg.LinAlgError:
        # Safe upper bound using induced norms (valid JSON, no NaN)
        spec = float(min(np.linalg.norm(A, 1), np.linalg.norm(A, np.inf)))
    return fro, spec, len(ops)


def apply_kraus(rho: Qobj, ops: List[Qobj]) -> Qobj:
    acc = qzero(rho.dims[0][0])
    for E in ops:
        acc += E * rho * E.dag()
    return acc


# -------------------------
# 3) Petz (transpose) recovery
# -------------------------
def petz_recovery_ops(kraus: List[Qobj], P_L: Qobj, eps: float = 1e-9,
                      add_completion: bool = True, tol: float = 1e-12
                      ) -> Tuple[List[Qobj], Dict[str, float]]:
    dim = P_L.dims[0][0]

    # N(P_L) and inverse sqrt on its support
    NPL = qzero(dim)
    for E in kraus:
        NPL += E * P_L * E.dag()
    NPL = 0.5 * (NPL + NPL.dag())

    M = (NPL + eps * P_L).full()
    evals_M, V_M = np.linalg.eigh(M)
    tau = max(eps, 1e-14)
    invsqrt_vals = np.zeros_like(evals_M)
    supp_mask = evals_M > tau
    invsqrt_vals[supp_mask] = 1.0 / np.sqrt(evals_M[supp_mask])
    NP_inv_sqrt = Qobj(V_M @ np.diag(invsqrt_vals) @ V_M.conj().T, dims=P_L.dims)

    # Raw Petz Kraus
    K_ops = [P_L * E.dag() * NP_inv_sqrt for E in kraus]

    # T = Σ K†K and scale if needed
    T = qzero(dim)
    for K in K_ops:
        T += K.dag() * K
    T = 0.5 * (T + T.dag())

    evals_T = np.linalg.eigvalsh(T.full())
    lammax_before = float(np.max(evals_T))
    if lammax_before > 1.0 + tol:
        scale = 1.0 / np.sqrt(lammax_before)
        K_ops = [scale * K for K in K_ops]
        T = scale**2 * T
        lammax_after_scale = 1.0
    else:
        lammax_after_scale = lammax_before

    res_fro = res_op = lammax_after_completion = None
    if add_completion:
        Res = identity(dim) - T
        Res = 0.5 * (Res + Res.dag())

        # Diagonalize Res (not M!)
        evals_R, V_R = np.linalg.eigh(Res.full())
        evals_R_clip = np.clip(evals_R.real, a_min=0.0, a_max=None)
        if evals_R_clip.size > 0 and np.any(evals_R_clip > 0.0):
            sqrt_res = Qobj(V_R @ np.diag(np.sqrt(evals_R_clip)) @ V_R.conj().T, dims=P_L.dims)
            if sqrt_res.norm('fro') > 1e-14:
                K_ops.append(sqrt_res)
                T = T + sqrt_res.dag() * sqrt_res

        Diff = T - identity(dim)
        res_fro = Diff.norm('fro')
        res_op = float(np.max(np.abs(np.linalg.eigvalsh(Diff.full()))))
        lammax_after_completion = float(np.max(np.linalg.eigvalsh(T.full())))

    metrics = dict(
        eigNPL_min=float(np.min(evals_M)),
        eigNPL_max=float(np.max(evals_M)),
        lammax_T_before=float(lammax_before),
        lammax_T_after_scale=float(lammax_after_scale),
        lammax_T_after_completion=(None if lammax_after_completion is None else float(lammax_after_completion)),
        petz_residual_to_I_fro=(None if res_fro is None else float(res_fro)),
        petz_residual_to_I_op=(None if res_op is None else float(res_op)),
    )
    return K_ops, metrics



# -------------------------
# 4) Decode and observable
# -------------------------

def decode_to_logical_unscaled(rho_phys: Qobj, ket0: Qobj, ket1: Qobj) -> Tuple[np.ndarray, float]:
    """
    Project physical density matrix ρ onto the unnormalized logical 2×2 block
    in the {|0>,|1>} basis defined by ket0, ket1.
    Returns (rho_L, w) where rho_L is a 2×2 ndarray and w = Tr(rho_L).
    """
    # Direct matrix elements: r_ab = <a|ρ|b>
    r00 = rho_phys.matrix_element(ket0.dag(), ket0)
    r01 = rho_phys.matrix_element(ket0.dag(), ket1)
    r10 = rho_phys.matrix_element(ket1.dag(), ket0)
    r11 = rho_phys.matrix_element(ket1.dag(), ket1)

    rho_L = np.array([[r00, r01],
                      [r10, r11]], dtype=complex)
    # Enforce Hermiticity numerically
    rho_L = 0.5 * (rho_L + rho_L.conj().T)
    w = float(np.real_if_close(np.trace(rho_L)))
    return rho_L, w


def logical_plus_density(ket0: Qobj, ket1: Qobj) -> Qobj:
    """ρ_+ = |+><+| with |+> = (|0>+|1>)/√2 in the current logical basis."""
    return 0.5 * (ket2dm(ket0) + ket2dm(ket1) + (ket0 * ket1.dag()) + (ket1 * ket0.dag()))


# -------------------------
# 5) One nmax worker: build code and sweep x
# -------------------------

def run_one_nmax(nmax: float, x_list: List[float], cfg: ObsXConfig) -> Dict:
    TOL = cfg.numeric_tol
    # Cutoffs and codewords
    Ncut = choose_ncut(nmax)
    Delta, n_sum, nbar_pre = choose_delta_for_nmax(nmax, Ncut)
    ket0_raw, ket1_raw = gkps_code_states(Delta, Ncut, n_sum)

    if cfg.use_loewdin:
        ket0, ket1, ov_before, loewdin_dev = loewdin_orthonormalize(ket0_raw, ket1_raw)
    else:
        ket0, ket1 = ket0_raw, ket1_raw
        ov_before, loewdin_dev = abs(ket0_raw.overlap(ket1_raw)), 0.0

    nbar_post = mean_photon_number(ket0, ket1, Ncut)
    ov_after = abs(ket0.overlap(ket1))

    if ov_after > cfg.gkp_overlap_warn:
        print(f"[warn] |<0|1>|={ov_after:.2e} > {cfg.gkp_overlap_warn:.1e} at nmax={nmax:.1f}. "
              f"Consider larger Ncut or smaller Delta (or enable Löwdin).")

    P_L = make_codespace_projector(ket0, ket1)
    rho_plus = logical_plus_density(ket0, ket1)

    # Logical X (in this basis)
    X = np.array([[0.0, 1.0], [1.0, 0.0]], dtype=complex)

    # Sweep x
    records = []
    for x in x_list:
        eta = float(np.exp(-x))
        # Loss Kraus + TP check
        K_loss = pure_loss_kraus(eta, Ncut)
        tp_fro, tp_2, lcount = kraus_tp_residual(K_loss)

        # Evolve |+>
        rho_after_loss = apply_kraus(rho_plus, K_loss)

        # No-EC baseline (optional)
        if cfg.run_noec:
            rhoL_noec, w_noec = decode_to_logical_unscaled(rho_after_loss, ket0, ket1)
            X_leak_noec = float(np.real_if_close(np.trace(X @ rhoL_noec)))
            X_cond_noec = (X_leak_noec / w_noec) if w_noec > 1e-14 else 0.0
        else:
            w_noec = X_leak_noec = X_cond_noec = None

        # Petz
        R_ops, petz_metrics = petz_recovery_ops(
            K_loss, P_L, eps=cfg.petz_eps, add_completion=cfg.add_completion, tol=TOL
        )
        rho_after_petz = apply_kraus(rho_after_loss, R_ops)

        # Decode and measure
        rhoL_petz, w_petz = decode_to_logical_unscaled(rho_after_petz, ket0, ket1)
        X_leak_petz = float(np.real_if_close(np.trace(X @ rhoL_petz)))
        X_cond_petz = (X_leak_petz / w_petz) if w_petz > 1e-14 else 0.0

        # Invariants
        if not (-TOL <= X_leak_petz <= w_petz + TOL and w_petz <= 1.0 + TOL):
            print(f"[warn] Physical invariant issue at nmax={nmax}, x={x}: "
                  f"X_leak_petz={X_leak_petz}, w_petz={w_petz}")

        rec = dict(
            nmax=float(nmax), Ncut=int(Ncut), n_sum=int(n_sum),
            Delta=float(Delta), nbar_pre=float(nbar_pre), nbar_post=float(nbar_post),
            overlap_pre=float(ov_before), overlap_post=float(ov_after), loewdin_dev=float(loewdin_dev),
            x=float(x), eta=float(eta),
            len_Kloss=int(lcount),
            loss_residual_fro=float(tp_fro), loss_residual_op=float(tp_2),
            eigNPL_min=petz_metrics['eigNPL_min'],
            eigNPL_max=petz_metrics['eigNPL_max'],
            lammax_T_before=petz_metrics['lammax_T_before'],
            lammax_T_after_scale=petz_metrics['lammax_T_after_scale'],
            lammax_T_after_completion=petz_metrics['lammax_T_after_completion'],
            petz_residual_to_I_fro=petz_metrics['petz_residual_to_I_fro'],
            petz_residual_to_I_op=petz_metrics['petz_residual_to_I_op'],
            X_cond_petz=float(X_cond_petz), X_leak_petz=float(X_leak_petz), w_petz=float(w_petz),
            X_cond_noec=(None if X_cond_noec is None else float(X_cond_noec)),
            X_leak_noec=(None if X_leak_noec is None else float(X_leak_noec)),
            w_noec=(None if w_noec is None else float(w_noec)),
        )
        records.append(rec)

    # Sort by x (just in case)
    records.sort(key=lambda r: r["x"])
    return dict(
        nmax=float(nmax),
        Ncut=int(Ncut),
        Delta=float(Delta),
        n_sum=int(n_sum),
        nbar_pre=float(nbar_pre),
        nbar_post=float(nbar_post),
        overlap_pre=float(ov_before),
        overlap_post=float(ov_after),
        loewdin_dev=float(loewdin_dev),
        x_list=[float(x) for x in x_list],
        data=records,
    )


# -------------------------
# 6) Driver
# -------------------------

# def run_one_shot_X_coherence(cfg: ObsXConfig) -> Dict:
#     top = dict(config=asdict(cfg), results=[])
#     # Parallelize across nmax
#     with ProcessPoolExecutor(max_workers=cfg.num_workers) as ex:
#         futures = {ex.submit(run_one_nmax, nmax, cfg.x_list, cfg): nmax for nmax in cfg.nmax_list}
#         for fut in as_completed(futures):
#             n = futures[fut]
#             try:
#                 res = fut.result()
#                 top["results"].append(res)
#                 print(f"[done] nmax={n:.1f} completed.")
#             except Exception as e:
#                 print(f"[error] nmax={n:.1f} failed with: {e}")

#     # sort by nmax
#     top["results"].sort(key=lambda d: d["nmax"])
#     return top




def run_one_shot_X_coherence(cfg: ObsXConfig) -> Dict:
    top = dict(config=asdict(cfg), results=[], errors=[])
    with ProcessPoolExecutor(max_workers=cfg.num_workers) as ex:
        futures = {ex.submit(run_one_nmax, nmax, cfg.x_list, cfg): nmax for nmax in cfg.nmax_list}
        for fut in as_completed(futures):
            n = futures[fut]
            try:
                res = fut.result()
                top["results"].append(res)
                print(f"[done] nmax={n:.1f} completed.")
            except Exception as e:
                tb = traceback.format_exc()
                print(f"[error] nmax={n:.1f} failed:\n{tb}")
                top["errors"].append({"nmax": float(n), "error": str(e), "traceback": tb})
    top["results"].sort(key=lambda d: d["nmax"])
    return top


# -------------------------
# 7) Main
# -------------------------
if __name__ == "__main__":
    nmax_list = [float(n) for n in np.linspace(1, 30, 20)]
    spacing = (max(nmax_list) - min(nmax_list)) / (len(nmax_list) - 1)
    output_name = f"sim_petz_X_nmax{int(min(nmax_list))}_{int(max(nmax_list))}_spacing{int(spacing)}.json"


    cfg = ObsXConfig(
        nmax_list=nmax_list,
        x_list=[0.2,0.4], #[float(x) for x in np.linspace(0, 0.6, 10)]
        petz_eps=1e-9,
        add_completion=True,
        use_loewdin=True,
        run_noec=True,
        num_workers=5,
        output_json=output_name,
    )

    out = run_one_shot_X_coherence(cfg)

    with open(cfg.output_json, "w") as f:
        json.dump(out, f, indent=2)
    print(f"\nSaved results to {cfg.output_json}")
