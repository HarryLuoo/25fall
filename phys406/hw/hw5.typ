#set math.equation(numbering: "(1)")
#set text(
font: "Palatino Linotype",size: 11pt)
#set page(margin: (x: 1cm, y: 1cm), numbering: "1/1")
#import "@preview/physica:0.9.6": *
#import "@preview/mitex:0.2.5": *
#place(top + right, rect(inset: 3pt)[Phys406 hw5| Harry luo
])

= 1
#align(
  left,
  rect(inset: 8pt)[#image("assets/2025-10-26-15-44-01.png")]
)
Consider azimuthal symmetry, the membrane is described by $ 
 1/r partial_r (r partial_r u) = 1/v^2 partial_(t t) u
$ 
Taking separation $u = F(r) T(t), $
$ 
1/(F(r)) 1/r (dif )/(dif r) (r (dif F)/(dif r) )= 1/(v^2 T(t)) (dif^2  T)/(dif t^2 )equiv -lambda^2   
$ 
we get two ODEs: $ 
T'' +(lambda v^2 ) T = 0; quad r^2  F'' + r F' + (lambda r)^2 F = 0 
$ 
which carry general solutions $ 
T(t) = c_1 cos(lambda v t)+ c_2 sin(lambda v t); \ F(r) = c_3 J_0(lambda r)+ c_4 Y_0(lambda r) 
$ 
Desplacement finiteness at center requires $c_4 = 0$. The boundary condition at edge $r = R$ requires $F(R) = 0.$ So $ 
c_3 J_0 (lambda R) = 0 quad => J_0(lambda R) = 0 
$ 
This is an eigenvalue equation. Let $mu_n$ be the n-th root of $J_0 (x) =0$, then $ 
lambda_n R = mu_n quad => lambda_n = mu_n/R, n = 1, 2 dots  
$ 
  
The total solution is the superposition of all eigenmodes: $ 
u(r, t) = sum_(n=1)^(infinity) F_n (r) T_n (t) = sum_(n=1)^(infinity) J_0(frac(mu_0 r , R) )[A_n cos(frac(mu_n v t ,R ))+ B_n sin(frac( mu_n v t, R ) )]   
$ 
Initial condition reqires: 
1. $ partial_t u(r,t)|_(t=0) = 0$ , so $ 
evaluated( (diff u)/(diff t) )_(t=0) = sum_(n) B_n mu_n v / R med  J_0 (mu_n r / R) = 0  
$ This implies all $B_n = 0$.
2. $u_(t=0) = A J_0(frac(mu_k r ,R ) )$ so $ 
mu(r,0) = sum_(n) A_n J_0((mu_n r )/ R)  = A J_0 (frac(mu_k r , R) ) quad => A_n = A delta_(n k)
$ 
Collecting results, we have $ 
mu(r, phi, t) = A J_0(frac(mu_k r ,R ) ) cos(frac(v mu_k t , R) ) 
$ 


#pagebreak()
= 2 #align(
  left,
  rect(inset: 8pt)[#image("assets/2025-10-26-18-48-54.png")]
)

#mitext(
`

Let the thermal diffusivity be denoted by $\alpha$. With axial and azimuthal symmetry the heat equation reduces to
$$
\partial_t u=\alpha\,\frac1r\partial_r\!\left(r\,\partial_r u\right), \qquad 0\le r<R,\ t>0,
$$
with boundary: $u(R,t)=T_0$, and $u$ finite at $r=0$,
initial data: $u(r,0)=0$.

At steady state the solution is constant, $u_\infty(r)\equiv T_0$. Homogenize the boundary by
$$
w(r,t):=T_0-u(r,t).
$$
Then
$$
\partial_t w=\alpha\,\frac1r\partial_r\!\left(r\,\partial_r w\right),\quad
w(R,t)=0,\quad w(r,0)=T_0,\quad w\ \text{finite at }r=0.
$$


Seek $w(r,t)=F(r)T(t)$:
$$
\frac{1}{F}\frac1r\frac{d}{dr}\!\left(r\,\frac{dF}{dr}\right)=\frac{1}{\alpha T}\frac{dT}{dt}=-\lambda^2.
$$
Hence
$$
T'(t)=-\alpha \lambda^2 T(t)\ \Rightarrow\ T(t)=C\,e^{-\alpha\lambda^2 t},
$$
$$
\frac1r\frac{d}{dr}\!\left(r\,\frac{dF}{dr}\right)+\lambda^2 F=0
\ \Leftrightarrow\ 
F''+\frac1rF'+\lambda^2 F=0.
$$
Let $x=\lambda r$ and $F(r)=y(x)$. Then $y$ solves the Bessel equation of order $0$:
$$
y''+\frac1x y'+y=0 \quad\Rightarrow\quad y=A J_0(x)+B Y_0(x).
$$
Finiteness at $r=0$ forces $B=0$. The boundary condition $w(R,t)=0$ requires
$$
F(R)=J_0(\lambda R)=0.
$$
Thus $\lambda=\lambda_n:=\mu_n/R$, where $\mu_n$ is the $n$-th positive root of $J_0$.
The eigenfunctions are
$$
F_n(r)=J_0\!\left(\frac{\mu_n r}{R}\right),\qquad
T_n(t)=e^{-\alpha (\mu_n/R)^2 t}.
$$



Expand $w$:
$$
w(r,t)=\sum_{n=1}^\infty A_n\,J_0\!\left(\frac{\mu_n r}{R}\right)e^{-\alpha \mu_n^2 t/R^2}.
$$
Determine $A_n$ from $w(r,0)=T_0$. Use orthogonality (weight $r$):
$$
\int_0^R r\,J_0\!\left(\frac{\mu_m r}{R}\right)J_0\!\left(\frac{\mu_n r}{R}\right)dr
=\frac{R^2}{2}\,[J_1(\mu_n)]^2\,\delta_{mn}.
$$
Hence
$$
A_n=\frac{2}{R^2[J_1(\mu_n)]^2}\int_0^R r\,T_0\,J_0\!\left(\frac{\mu_n r}{R}\right)dr.
$$
Evaluate the integral using $d[xJ_1(x)]/dx=xJ_0(x)$ and $x=\mu_n r/R$:
$$
\int_0^R r\,J_0\!\left(\frac{\mu_n r}{R}\right)dr
=\frac{R^2}{\mu_n}J_1(\mu_n).
$$
Therefore
$$
A_n=\frac{2T_0}{\mu_n J_1(\mu_n)}.
$$



Since $u=T_0-w$,
$$
\boxed{\displaystyle
u(r,t)=T_0\left[1-\sum_{n=1}^\infty
\frac{2}{\mu_n J_1(\mu_n)}J_0\!\left(\dfrac{\mu_n r}{R}\right)
\exp\!\left(-\alpha\frac{\mu_n^2}{R^2}\,t\right)
\right].
}
$$
`
)


#pagebreak()

= 3
#align(
  left,
  rect(inset: 8pt)[#image("assets/2025-10-26-19-12-33.png")]
)


#mitext(
  `
Solve Laplace’s equation in the shell \(1<r<2\):
$$
\nabla^2 u=0,\qquad
u(1,\theta,\phi)=3\sin^2\theta\,\sin(2\phi),\quad
u(2,\theta,\phi)=3\cos\theta.
$$

In spherical coordinates,
$$
\nabla^2 u=\frac1{r^2}\partial_r(r^2 u_r)+\frac1{r^2\sin\theta}\partial_\theta(\sin\theta\,u_\theta)+\frac1{r^2\sin^2\theta}\,u_{\phi\phi}.
$$


Let \(u=R(r)\Theta(\theta)\Phi(\phi)\). Then
$$
\frac1R\frac{d}{dr}(r^2 R')+\frac1\Theta\frac1{\sin\theta}\frac{d}{d\theta}(\sin\theta\,\Theta')
+\frac1\Phi\frac{1}{\sin^2\theta}\Phi''=0.
$$
Set \(\Phi''+m^2\Phi=0 \Rightarrow \Phi=\cos m\phi\) or \(\Phi=\sin m\phi\) with \(m\in\mathbb{Z}_{\ge0}\).
The polar equation becomes the associated Legendre ODE
$$
\frac1{\sin\theta}\frac{d}{d\theta}(\sin\theta\,\Theta')-\frac{m^2}{\sin^2\theta}\Theta+\ell(\ell+1)\Theta=0,
$$
whose regular solutions are \(\Theta(\theta)=P_\ell^m(\cos\theta)\) with \(\ell\ge m\).
The radial equation is
$$
r^2 R''+2rR'-\ell(\ell+1)R=0
\quad\Rightarrow\quad
R_\ell(r)=A_{\ell m} r^\ell+B_{\ell m} r^{-(\ell+1)}.
$$

Thus the relevant real expansion is
$$
u(r,\theta,\phi)=\sum_{\ell,m}\big(A_{\ell m} r^\ell+B_{\ell m} r^{-(\ell+1)}\big)P_\ell^m(\cos\theta)
\begin{cases}
\cos m\phi\\
\sin m\phi
\end{cases}.
$$



Use the Legendre polynomial expressions:
$$
P_1(\cos\theta)=\cos\theta,\qquad P_2^2(\cos\theta)=3(1-\cos^2\theta)=3\sin^2\theta.
$$
Hence \(3\cos\theta \implies (\ell,m)=(1,0)\), and \(3\sin^2\theta\sin(2\phi)=P_2^2(\cos\theta)\sin(2\phi)\implies (\ell,m)=(2,2)\).

Therefore
$$
u=(Ar+Br^{-2})P_1(\cos\theta)+\big(Cr^2+Dr^{-3}\big)P_2^2(\cos\theta)\sin(2\phi).
$$
Matching the boundary conditions: 

At \(r=1\):
$$
(A+B)P_1 + (C+D)P_2^2\sin(2\phi)=P_2^2\sin(2\phi)
\ \Rightarrow\
A+B=0,\quad C+D=1.
$$
At \(r=2\):
$$
\big(2A+\tfrac14 B\big)P_1+\big(4C+\tfrac18 D\big)P_2^2\sin(2\phi)=3P_1
\ \Rightarrow\
2A+\tfrac14 B=3,\quad 4C+\tfrac18 D=0.
$$
Solving these linear equations gives
$$
A=\frac{12}{7},\quad B=-\frac{12}{7},\qquad
C=-\frac{1}{31},\quad D=\frac{32}{31}.
$$

We thus arrive at 
$$
\boxed{\displaystyle
u(r,\theta,\phi)=\frac{12}{7}\Big(r-\frac{1}{r^{2}}\Big)\cos\theta
+\frac{1}{31}\Big(\frac{96}{r^{3}}-3r^{2}\Big)\sin^{2}\theta\,\sin(2\phi),\quad 1<r<2.
}
$$

`
)

#pagebreak()
= 4 
#align(
  left,
  rect(inset: 8pt)[#image("assets/2025-10-26-19-33-48.png")]
)

#mitext(
  `


This problem involves a linear operator $\partial_x^2$ with homogeneous Dirichlet boundary conditions ($u(0,t)=u(l,t)=0$). This suggests an expansion in the corresponding eigenfunctions, which are $\sin(n\pi x/l)$.

We seek a solution in the form of a sine series where the coefficients depend on time:
$$
u(x,t) = \sum_{n=1}^{\infty} g_n(t) \sin\left(\frac{n\pi x}{l}\right)
$$
We also expand the distributed force $f(x,t)$ in the same basis:
$$
f(x,t) = \sum_{n=1}^{\infty} f_n(t) \sin\left(\frac{n\pi x}{l}\right)
$$
where the Fourier coefficients $f_n(t)$ are given by the standard projection formula:
$$
f_n(t) = \frac{2}{l} \int_0^l f(x,t) \sin\left(\frac{n\pi x}{l}\right) dx
$$



Substitute the series for $u(x,t)$ and $f(x,t)$ into the governing wave equation $\partial_t^2 u = s^2 \partial_x^2 u + f(x,t)$.
$$
\sum_{n=1}^{\infty} g_n''(t) \sin\left(\frac{n\pi x}{l}\right) = s^2 \sum_{n=1}^{\infty} g_n(t) \left[ -\left(\frac{n\pi}{l}\right)^2 \sin\left(\frac{n\pi x}{l}\right) \right] + \sum_{n=1}^{\infty} f_n(t) \sin\left(\frac{n\pi x}{l}\right)
$$
Combine terms under a single summation:
$$
\sum_{n=1}^{\infty} \left[ g_n''(t) + \left(\frac{sn\pi}{l}\right)^2 g_n(t) - f_n(t) \right] \sin\left(\frac{n\pi x}{l}\right) = 0
$$
Due to the orthogonality of the sine functions on $[0, l]$, this equation can only hold if the coefficient of each sine term is individually zero. This yields an independent ODE for each mode $n$. 

Defining the natural frequencies $\omega_n = sn\pi / l$, we have:
$$
g_n''(t) + \omega_n^2 g_n(t) = f_n(t)
$$
Its general solution is the sum of the homogeneous solution and a particular solution found using Green's function : 
$$
g_n(t) = \underbrace{A_n \cos(\omega_n t) + B_n \sin(\omega_n t)}_{\text{Homogeneous Sol.}} + \underbrace{\int_0^t \frac{\sin[\omega_n(t-\tau)]}{\omega_n} f_n(\tau) d\tau}_{\text{Particular Sol.}}
$$
The constants $A_n$ and $B_n$ are determined by the initial conditions.

We expand the initial conditions $u_0(x)$ and $u_1(x)$ in the same sine series basis:
$$
u(x,0) = u_0(x) = \sum_{n=1}^{\infty} u_{0n} \sin\left(\frac{n\pi x}{l}\right) \implies u_{0n} = \frac{2}{l} \int_0^l u_0(x) \sin\left(\frac{n\pi x}{l}\right) dx
$$
$$
\partial_t u(x,0) = u_1(x) = \sum_{n=1}^{\infty} u_{1n} \sin\left(\frac{n\pi x}{l}\right) \implies u_{1n} = \frac{2}{l} \int_0^l u_1(x) \sin\left(\frac{n\pi x}{l}\right) dx
$$
From our series solution for $u(x,t)$, we have $u(x,0) = \sum g_n(0) \sin(\dots)$ and $\partial_t u(x,0) = \sum g_n'(0) \sin(\dots)$. By comparing coefficients, we must have $g_n(0) = u_{0n}$ and $g_n'(0) = u_{1n}$.

1.  At $t=0$, the integral in the solution for $g_n(t)$ vanishes, giving:
    $$g_n(0) = A_n \cos(0) + B_n \sin(0) = A_n.$$ Thus, $A_n = u_{0n}$.

2.  Differentiating $g_n(t)$ (using the Leibniz rule for the integral) gives:
    $$g_n'(t) = -\omega_n A_n \sin(\omega_n t) + \omega_n B_n \cos(\omega_n t) + \int_0^t \cos[\omega_n(t-\tau)] f_n(\tau) d\tau.$$
    At $t=0$, this simplifies to $g_n'(0) = \omega_n B_n$. Thus, $\omega_n B_n = u_{1n}$, which means $B_n = u_{1n}/\omega_n$.


Assembling the pieces gives the complete solution

$$
\boxed{\displaystyle
u(x,t) = \sum_{n=1}^{\infty} \sin\left(\frac{n\pi x}{l}\right) \left[ A_n \cos(\omega_n t) + \frac{B_n}{\omega_n} \sin(\omega_n t) + \int_0^t \frac{\sin[\omega_n(t-\tau)]}{\omega_n} f_n(\tau) d\tau \right]
}
$$
where $\omega_n = \frac{sn\pi}{l}$ and the coefficients are the following Fourier integrals:
$$
A_n = \frac{2}{l} \int_0^l u_0(x') \sin\left(\frac{n\pi x'}{l}\right) dx'
$$
$$
B_n = \frac{2}{l} \int_0^l u_1(x') \sin\left(\frac{n\pi x'}{l}\right) dx'
$$
$$
f_n(\tau) = \frac{2}{l} \int_0^l f(x', \tau) \sin\left(\frac{n\pi x'}{l}\right) dx'
$$

  `
)


#pagebreak()
= 5
#align(
  left,
  rect(inset: 8pt)[#image("assets/2025-10-26-20-26-10.png")]
)

#mitext(
`

We solve the PDE for bending oscillations of a solid rod, given by
\begin{equation}
    \frac{\partial^2 y}{\partial t^2} + a^2 \frac{\partial^4 y}{\partial x^4} = 0.
\end{equation}
We assume a separable solution of the form $y(x,t) = X(x)T(t)$. Substituting this into the PDE yields
\[
    X(x)T''(t) + a^2 X^{(4)}(x)T(t) = 0.
\]
Dividing by $a^2X(x)T(t)$ allows us to separate the variables. We introduce a separation constant $-\lambda^4$ for convenience, ensuring oscillatory solutions in time.
\begin{equation}
    \frac{T''(t)}{a^2 T(t)} = - \frac{X^{(4)}(x)}{X(x)} = -\lambda^4.
\end{equation}
This results in two ordinary differential equations:
\begin{align}
     \quad & T''(t) + (a\lambda^2)^2 T(t) = 0 \\
     \quad & X^{(4)}(x) - \lambda^4 X(x) = 0
\end{align}

The general solution to the spatial ODE is
\[
    X(x) = C_1 \cos(\lambda x) + C_2 \sin(\lambda x) + C_3 \cosh(\lambda x) + C_4 \sinh(\lambda x).
\]
The boundary conditions at the clamped end ($x=0$) are $X(0)=0$ and $X'(0)=0$.
\begin{align*}
    X(0)=0 &\implies C_1 + C_3 = 0 \implies C_3 = -C_1 \\
    X'(0)=0 &\implies \lambda(C_2 + C_4) = 0 \implies C_4 = -C_2
\end{align*}
The solution simplifies to
\[
    X(x) = C_1(\cos(\lambda x) - \cosh(\lambda x)) + C_2(\sin(\lambda x) - \sinh(\lambda x)).
\]
The boundary conditions at the free end ($x=l$) are $X''(l)=0$ and $X'''(l)=0$. This gives a homogeneous system for $C_1$ and $C_2$:
\begin{align*}
    C_1(\cos(\lambda l) + \cosh(\lambda l)) + C_2(\sin(\lambda l) + \sinh(\lambda l)) &= 0 \\
    C_1(\sin(\lambda l) - \sinh(\lambda l)) - C_2(\cos(\lambda l) + \cosh(\lambda l)) &= 0
\end{align*}

For a non-trivial solution, the determinant of the coefficient matrix must be zero.
\[
    \det \begin{pmatrix} \cos(\lambda l) + \cosh(\lambda l) & \sin(\lambda l) + \sinh(\lambda l) \\ \sin(\lambda l) - \sinh(\lambda l) & -(\cos(\lambda l) + \cosh(\lambda l)) \end{pmatrix} = 0
\]
This yields the transcendental eigenvalue equation, whose roots define the eigenvalues $\lambda_n$:
\begin{equation}
    \boxed{\cos(\lambda_n l)\cosh(\lambda_n l) = -1}
\end{equation}
For each eigenvalue $\lambda_n$ that satisfies this equation, the coefficients $C_1$ and $C_2$ are linearly dependent. We can find their ratio from the first homogeneous equation:
\[
    \frac{C_2}{C_1} = - \frac{\cos(\lambda_n l) + \cosh(\lambda_n l)}{\sin(\lambda_n l) + \sinh(\lambda_n l)}.
\]
The corresponding eigenfunction $X_n(x)$ is unique up to a normalization constant. By setting this constant to 1, we obtain the explicit form:
\begin{equation}
    \boxed{
    X_n(x) = (\cos(\lambda_n x) - \cosh(\lambda_n x)) - \left(\frac{\cos(\lambda_n l) + \cosh(\lambda_n l)}{\sin(\lambda_n l) + \sinh(\lambda_n l)}\right) (\sin(\lambda_n x) - \sinh(\lambda_n x))
    }
\end{equation}

\section{The General Solution}
The solution to the temporal ODE is $T_n(t) = C_n \cos(\omega_n t) + D_n \sin(\omega_n t)$, where the angular frequencies are $\omega_n = a\lambda_n^2$. The general solution for $y(x,t)$ is a superposition of all modes:
\begin{equation}
    y(x,t) = \sum_{n=1}^{\infty} X_n(x) \left[ C_n \cos(\omega_n t) + D_n \sin(\omega_n t) \right].
\end{equation}
The coefficients are determined from the initial conditions, $y(x,0) = f(x)$ and $\partial_t y(x,0) = g(x)$, using the orthogonality of the eigenfunctions $X_n(x)$.
\begin{align}
    y(x,0) = f(x) &= \sum_{n=1}^{\infty} C_n X_n(x) \\
    \partial_t y(x,0) = g(x) &= \sum_{n=1}^{\infty} \omega_n D_n X_n(x)
\end{align}
Projecting onto the basis functions gives the coefficients:
\begin{equation}
    C_n = \frac{\int_0^l f(x) X_n(x) dx}{\int_0^l X_n^2(x) dx}
\end{equation}
\begin{equation}
    D_n = \frac{1}{\omega_n} \frac{\int_0^l g(x) X_n(x) dx}{\int_0^l X_n^2(x) dx}
\end{equation}

`
)
