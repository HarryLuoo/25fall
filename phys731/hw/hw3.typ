#set math.equation(numbering: "(1)")
#set page(margin: (x: 1cm, y: 1cm))
#import "@preview/physica:0.9.5": *
#set text(
  font: "Palatino Linotype",
  size: 11pt,
)
#import "@preview/wrap-it:0.1.1": wrap-content
#import "@preview/mitex:0.2.5":*
#place(top + right, rect(inset: 3pt)[Phys731 hw3 Harry Luo
])

= 1 
#align(
  left,
  rect(inset: 8pt)[For the finite square well $ 
      V = cases(0quad |x|<a, V_0quad |x| >a) , 
  $ 1. Determine the odd parity eigenfunctions and their associated energy eigenvalues for this potential, and discuss limiting behaviour as $V_0->0, V_0->infinity$.
2. FInd accurate numerical values for the boundstate energy eigenvalues of a particle in the aboe finite square well potential, in which the parameter $ 
    R equiv sqrt(frac(2m V_0 a^2  , hbar^2 ) ) =4. 
$ Find solutions graphically and numerically.

  ]
)
== 1. Odd parity 
Lable region $"I" : x<-a, "II": -a<x<a, "III": x>a.$ From lecture: $psi_"II" = a cos k x+ B sin k x,$ $psi_"I" = D e^(kappa x), psi_"III" = F e^(kappa x)$ , with $k = sqrt(2 m E)/hbar, kappa = sqrt(2 m (V_0-E)) / hbar .$

Imposing odd parity $psi(-x) = - psi(x)$ , we have $A=0, D= -F$.
Imposing boundary condition of continuity and smoothness at $x=a, $ we have $ 
    B sin k a = F e^(- kappa a), quad B cos k a = - kappa F e^(-kappa a).   
$ Dividing these and setting $eta = kappa a, xi = k a, $ we have 
$ 
    xi cot xi = - eta, quad xi^2 + eta^2 = R^2. 
$ 
Limiting behaviour: 
- as $V_0-> infinity,eta ->infinity$ and $cot xi -> -infinity$ satisfied at *$display(eta = n pi \, quad n in ZZ.)$*

- as $V_0 ->0, R->0, $ but as seen below (LEFT) that $xi cot xi = -eta (xi, eta >0)$ has solution only for $R>= pi/2,$ the limit of $V_0->0$ yields* no odd parity bound states. *)


#figure(
grid(
columns: 2,
gutter: 1mm,
image("assets/2025-10-03-09-23-03.png"),
image("assets/2025-10-03-12-58-02.png")
))
== 2. Numerical and graphical 

1. Graphically (ABOVE, RIGHT), The equations to solve are:
- Even States: $ xi tan( xi) =  eta$ (black)
- Odd States: $- xi cot( xi) =  eta$ (red)
- Constraint: $ xi^2 +  eta^2 = 16$ (Green)
From a graphical analysis, we find three bound states:

$(xi, eta)= (1.25235,3.7989), \ (xi, eta) = (2.47458,3.14269), \ (xi,eta)=(3.5953,1.75322)$ 

2. Numerically, we solve $ 
    cases(xi tan xi = sqrt(16 - xi^2 ), - xi cot xi = sqrt(16 - xi^2 ) )
$ and the solutions are identical as above: $ 
    xi_1 = 1.25235, xi_2 = 2.47458, xi_3 = 3.5953. 
$ 
and the energies are $ 
    E= V_0 (frac(xi^2  , 16) ) \ => E_1 = 0.09797, E_2 = 0.3829, E_3 = 0.8077
$ 



#pagebreak()
= 2 
#align(
  left,
  rect(inset: 8pt)[Show that for spinless particles moving in 1D, the energy spectrum of bound states is always non-degenrate. ]
)
Assume not: exists $psi_i (x), med (i = 1,2)$ s.t. $ 
    -hbar^2 /(2m) dv(psi_i,x,2) + V(x) psi_i = E psi_i, quad E = E_1 = E_2. 
$ 
In particular, $psi_1 (x), psi_2 (x)$ are linear independent. This would imply that their wronskian $ 
    W(x) = psi_1psi_2 ' - psi_2 psi_1 ' = 0 
$ 
However, we notice that $ 
    W'(x)= 2m/hbar^2  ( psi_1 (V-E)) psi_2- psi_2 (V-E)psi_1) = 0 
$ 
so $W(x) = "const."$ Further, since $psi_1, psi_2$ are bound states, $ 
    lim_(x->plus.minus infinity) psi_i (x) = 0 => W(plus.minus infinity) = 0 => W(x) = 0 quad forall x.
$ This contradicts the linear independence of $psi_1, psi_2.$ Thus, the energy spectrum of bound states is always non-degenerate. 

#pagebreak()
= 3
#align(
  left,
  rect(inset: 8pt)[Use the Hermite generating function $ 
      g(y,t) = e^(-t^2 + 2 t y) = sum_(n=0)^infinity H_n (y) t^n / n!

  $ 
1. To prove the following properties $ 
      H_n (y) = e^(y^2 /2) (y - d/d y)^n e^(-y^2 /2) , \
H'_n (y) = 2 n H_(n-1)(y) \ 
H_(n+1) (y) = 2 y H_n (y) - 2 n H_(n-1) (y).
  $ 
2. Then evaluate $ 
    integral_(-infinity)^(infinity)  dif y med  e^(-y^2 )H_n (y) H_(n') (y)  
$ 
  ]
)

== 1 
=== a
Recall that $H_n (y) = evaluated(((diff )/(diff t))^n)_(t=0) g(y,t) $. Let $u = t - y, partial u = partial t$. Then $g = e^(-u^2 ) e^y^2 .$ Then from definition, $ 
    H_n (y) = evaluated(((diff )/(diff u))^n (e^(-u^2 ) e^(y^2 ) ))_(u = -y)=e^(y^2 ) ( (diff  )/(diff u) )^n evaluated(e^(-u^2 ))_(u = -y) = (-1)^n e^(y^2 ) ( (diff  )/(diff y)  )^n e^(-y^2 )  
$ 
Notice the identity$ 
    (dif )/(dif y) (e^(-y^2 slash 2) g)=- e^(-y^2  slash 2) (y - (dif )/(dif y) ) g,  
$ we have $ 
    ( (dif )/(dif y) )^n (e^(-y^2 ) )= ( (dif )/(dif y) )^n (e^(-y^2 slash 2)e^(-y^2  slash 2)  ) = - e^(- y^2  slash 2) (y - (dif )/(dif y) )^n e^(-y^2  slash 2).
$ 
 And so $ 
     H_n (y)= (-1)^n e^(y^2 ) ( (dif )/(dif y) )^n e^(-y^2 ) = (-1)^(2n) e^(y^2 slash 2) (y - dif/(dif y) )^n e^(- y^2  slash 2 ) = 
#rect(inset: 8pt)[
$ display(     e^(y^2 slash 2) (y - dif/(dif y) )^n e^(- y^2  slash 2))$
]
,
 $ 
 as wanted.
=== b 
Notice that $ 
    (diff g)/(diff t) = 2 t g(y,t) = sum_(n=0)^(infinity)) frac(2 t^(n+1)  ,n! ) H_n (y) = sum_(n=0)^(infinity)underbrace( 2(n+1) frac(t^(n+1)  , (n+1)! ) H_(n) (y),*)
    = sum_(n=0)^(infinity) H'_n (y) ^(t^n) / n! .    
$ 
 
But (\*) is also $ 
    2n H_(n-1) (y) frac(t^n  , n! ) .
$ 
Therefore $ 
    H'_n (y) = 2 n H_(n-1) (y).
  $ as wanted.
=== c
$ 
    partial_t g &= (2 y - 2t) g = sum_(n=0)^(infinity) (2 y H_n (y) frac(t^n , n!) - 2 H_n (y)frac(t^(n+1) , n!)  )\ &=_(n:= n-1)   sum_(n=0)^(infinity) (2 y H_n (y) frac(t^n , n!) - 2 n H_(n-1) (y)frac(t^n , n!)) \
$ 
But $partial_t g$ is also $ 
    sum_(n=0)^(infinity) frac(t^(n-1)  , (n-1)!) H_n (y)= sum_(n=0)^(infinity) frac(t^n , n!) H_(n+1) (y),      
$ 
and so $ 
    H_(n+1) (y) = 2 y H_n (y) - 2 n H_(n-1) (y). 
$ 

== 2. 
#mitext(` 


Consider 

$$
\int_{-\infty}^{\infty} e^{-y^2} g(y,t) g(y,s) \, dy = e^{-(t^2 + s^2)} \int_{-\infty}^{\infty} e^{-y^2 + 2(t + s)y} \, dy.
$$
Complete the square in the exponent of the integrand: \(-y^2 + 2(t + s)y = -(y - (t + s))^2 + (t + s)^2\). Thus,
$$
\int_{-\infty}^{\infty} e^{-(y - (t + s))^2 + (t + s)^2} \, dy = e^{(t + s)^2} \int_{-\infty}^{\infty} e^{-u^2} \, du = e^{(t + s)^2} \sqrt{\pi},
$$
where \(u = y - (t + s)\). Substituting back,
$$
\int_{-\infty}^{\infty} e^{-y^2} g(y,t) g(y,s) \, dy = e^{-(t^2 + s^2)} e^{(t + s)^2} \sqrt{\pi} = e^{-(t^2 + s^2) + t^2 + s^2 + 2ts} \sqrt{\pi} = e^{2ts} \sqrt{\pi}.
$$
On the other hand, expanding the generating functions gives
$$
g(y,t) g(y,s) = \sum_{m=0}^{\infty} \sum_{l=0}^{\infty} \frac{t^m}{m!} \frac{s^l}{l!} H_m(y) H_l(y),
$$
so
$$
\int_{-\infty}^{\infty} e^{-y^2} g(y,t) g(y,s) \, dy = \sum_{m=0}^{\infty} \sum_{l=0}^{\infty} \frac{t^m s^l}{m! l!} \int_{-\infty}^{\infty} e^{-y^2} H_m(y) H_l(y) \, dy.
$$
Equating the two expressions yields
$$
\sum_{m=0}^{\infty} \sum_{l=0}^{\infty} \frac{t^m s^l}{m! l!} \int_{-\infty}^{\infty} e^{-y^2} H_m(y) H_l(y) \, dy = \sqrt{\pi} \, e^{2ts}.
$$
The Taylor expansion of the right-hand side is
$$
e^{2ts} = \sum_{n=0}^{\infty} \frac{(2ts)^n}{n!} = \sum_{n=0}^{\infty} \frac{2^n t^n s^n}{n!}.
$$
For the left-hand side to match, the double sum must reproduce this only when \(m = l = n\), implying that the integral vanishes unless \(m = l\). Specifically, the coefficient of \(\frac{t^m s^l}{m! l!}\) on the right is \(\sqrt{\pi} \, 2^m \frac{m!}{m!} \delta_{ml}\) (zero otherwise), so
$$
\int_{-\infty}^{\infty} e^{-y^2} H_m(y) H_l(y) \, dy = \sqrt{\pi} \, 2^m m! \, \delta_{ml}.
$$
`
)

#pagebreak()
= 4
#align(
  left,
  rect(inset: 8pt)[Using wavefunctions, compute $braket(n',p,n)$for the eigenstates of the 1d SHO to show that $ 
      braket(n',p,n) = i sqrt(frac(m omega hbar , 2) )(sqrt(n+1) delta_(n',n+1) - sqrt(n) delta_(n',n-1) )
  $ 
   ]
)

== 1

#mitext(
  `
In the position representation, the momentum operator is $\hat{p} = -i\hbar \frac{d}{dx}$. The matrix element is therefore given by the integral:
$$
\langle n'|p|n\rangle = \int_{-\infty}^{\infty} \psi_{n'}^*(x) \left(-i\hbar \frac{d}{dx}\right) \psi_n(x) \, dx
\label{eq.pos}
$$
The normalized energy eigenfunctions are (from lecture)
$$
\psi_n(x) = C_n H_n(y) e^{-y^2/2} \quad \text{with} \quad y = \frac{x}{b} = x\sqrt{\frac{m\omega}{\hbar}}
$$
where $C_n = (m\omega/\pi\hbar)^{1/4} (2^n n!)^{-1/2} = (b \sqrt{\pi}2^k k!)^{-1/2}$ is the normalization constant.

First, consider:
$$
\frac{d\psi_n(x)}{dx} = \frac{C_n}{b} \frac{d}{dy} \left( H_n(y) e^{-y^2/2} \right) = \frac{C_n}{b} \left( H_n'(y)e^{-y^2/2} - y H_n(y)e^{-y^2/2} \right)
$$
Using P3:
1.  $H_n'(y) = 2n H_{n-1}(y)$
2.  $2yH_n(y) = H_{n+1}(y) + 2n H_{n-1}(y) \implies yH_n(y) = \frac{1}{2}H_{n+1}(y) + nH_{n-1}(y)$
Then we have
$$
\frac{d\psi_n(x)}{dx} = \frac{C_n}{b} e^{-y^2/2} \left( 2nH_{n-1}(y) - \left[\frac{1}{2}H_{n+1}(y) + nH_{n-1}(y)\right] \right) = \frac{C_n}{b} e^{-y^2/2} \left( nH_{n-1}(y) - \frac{1}{2}H_{n+1}(y) \right)
$$
Now $\langle n'|p|n\rangle$, with  $y$ ($dx = b\,dy$) becomes:
$$
\langle n'|p|n\rangle = -i\hbar \int_{-\infty}^{\infty} \left(C_{n'} H_{n'}(y) e^{-y^2/2}\right) \left(\frac{C_n}{b} e^{-y^2/2} \left[ nH_{n-1}(y) - \frac{1}{2}H_{n+1}(y) \right]\right) (b\,dy)
$$
$$
= -i\hbar C_{n'} C_n \int_{-\infty}^{\infty} e^{-y^2} H_{n'}(y) \left[ nH_{n-1}(y) - \frac{1}{2}H_{n+1}(y) \right] dy
$$
The integral splits into two terms. We use the orthogonality relation for Hermite polynomials, $\int_{-\infty}^{\infty} e^{-y^2} H_m(y) H_l(y) \, dy = \sqrt{\pi} \, 2^l l! \, \delta_{ml}$:
1.  The first term is non-zero only if $n' = n-1$:
    $$
    n \int_{-\infty}^{\infty} e^{-y^2} H_{n-1}(y) H_{n-1}(y) \, dy = n \sqrt{\pi} 2^{n-1} (n-1)! = \frac{\sqrt{\pi}}{2} 2^n n!
    $$
2.  The second term is non-zero only if $n' = n+1$:
    $$
    -\frac{1}{2} \int_{-\infty}^{\infty} e^{-y^2} H_{n+1}(y) H_{n+1}(y) \, dy = -\frac{1}{2} \sqrt{\pi} 2^{n+1} (n+1)!
    $$
The matrix element is non-zero only for $n' = n \pm 1$.

- Case 1: $n' = n-1$
    $$
    \langle n-1|p|n\rangle = -i\hbar C_{n-1} C_n \left( \frac{\sqrt{\pi}}{2} 2^n n! \right) $$
    $$    = -i\hbar \frac{1}{b\sqrt{\pi}\sqrt{2^{n-1}(n-1)! 2^n n!}} \left( \frac{\sqrt{\pi}}{2} 2^n n! \right) = -i\hbar \frac{\sqrt{2^n n!}}{b\sqrt{2 \cdot 2^{n-1}(n-1)!}} = -i\hbar \frac{\sqrt{n}}{b\sqrt{2}}
    $$
    Using $b=\sqrt{\hbar/m\omega}$, we get $\langle n-1|p|n\rangle = -i\sqrt{\frac{m\omega\hbar}{2}}\sqrt{n}$.

- Case 2: $n' = n+1$,
    $$
    \langle n+1|p|n\rangle = -i\hbar C_{n+1} C_n \left( -\frac{1}{2} \sqrt{\pi} 2^{n+1} (n+1)! \right)
    $$
    $$
    = i\hbar \frac{1}{b\sqrt{\pi}\sqrt{2^{n+1}(n+1)! 2^n n!}} \left( \frac{\sqrt{\pi}}{2} 2^{n+1} (n+1)! \right) = i\hbar \frac{\sqrt{2^{n+1}(n+1)!}}{b\sqrt{2 \cdot 2^n n!}} = i\hbar \frac{\sqrt{2(n+1)}}{b\sqrt{2}}
    $$
    Using $b=\sqrt{\hbar/m\omega}$, we get $\langle n+1|p|n\rangle = i\sqrt{\frac{m\omega\hbar}{2}}\sqrt{n+1}$.

Combining these results using the Kronecker delta gives the final expression:
$$
\boxed{
\langle n'|p|n\rangle = i\sqrt{\frac{m\omega\hbar}{2}} \left( \sqrt{n+1}\delta_{n',n+1} - \sqrt{n}\delta_{n',n-1} \right)
}
$$
`
)
== 2
#mitext(
`
In the momentum representation,
$$
\langle n'|p|n\rangle = \int_{-\infty}^{\infty} \phi_{n'}^*(p) \, p \, \phi_n(p) \, dp
$$
The momentum-space eigenfunctions are (from lecture)
$$
\phi_n(p) = (-i)^n D_n H_n(q) e^{-q^2/2} \quad \text{with} \quad q = \frac{p}{\sqrt{m\omega\hbar}}
$$
where $D_n = (1/m\omega\pi\hbar)^{1/4} (2^n n!)^{-1/2}$ is the normalization constant.

Similar to calculation of the position matrix element $\langle n'|x|n\rangle$ in position space. 
$$
\langle n'|p|n\rangle = \int_{-\infty}^{\infty} \left( (-i)^{n'} D_{n'} H_{n'}(q) e^{-q^2/2} \right)^* \cdot p \cdot \left( (-i)^n D_n H_n(q) e^{-q^2/2} \right) \, dp
$$
$$
= (i)^{n'} (-i)^n D_{n'} D_n \int_{-\infty}^{\infty} e^{-q^2} H_{n'}(q) H_n(q) \, p \, dp
$$
Changing variables $p = q\sqrt{m\omega\hbar}$ and $dp = dq\sqrt{m\omega\hbar}$:
$$
= (i)^{n'} (-i)^n D_{n'} D_n (m\omega\hbar) \int_{-\infty}^{\infty} e^{-q^2} H_{n'}(q) \left(q H_n(q)\right) dq
$$
Using $qH_n(q) = \frac{1}{2}H_{n+1}(q) + nH_{n-1}(q)$ and the orthogonality relation, we again find that the integral is non-zero only for $n' = n \pm 1$.

- Case 1: $n' = n-1$ ,   The phase factor is $(i)^{n-1}(-i)^n = i^{-1} = -i$. The integral gives $n\sqrt{\pi}2^{n-1}(n-1)!$.
    $$
    \langle n-1|p|n\rangle = (-i) D_{n-1} D_n (m\omega\hbar) \left( n\sqrt{\pi}2^{n-1}(n-1)! \right)
    $$
    The calculation for the constants is analogous to the position-space case, with the parameter $\sqrt{m\omega\hbar}$ replacing $1/b$.
    $$
    \langle n-1|p|n\rangle = (-i) \sqrt{\frac{m\omega\hbar}{2}} \sqrt{n}
    $$

- Case 2: $n' = n+1$,    The phase factor is $(i)^{n+1}(-i)^n = i$. The integral gives $\frac{1}{2}\sqrt{\pi}2^{n+1}(n+1)!$.
    $$
    \langle n+1|p|n\rangle = (i) D_{n+1} D_n (m\omega\hbar) \left( \frac{1}{2}\sqrt{\pi}2^{n+1}(n+1)! \right)
    $$
    $$
    \langle n+1|p|n\rangle = (i) \sqrt{\frac{m\omega\hbar}{2}} \sqrt{n+1}
    $$

Combining these gives the same final result
$$
\boxed{
\langle n'|p|n\rangle = i\sqrt{\frac{m\omega\hbar}{2}} \left( \sqrt{n+1}\delta_{n',n+1} - \sqrt{n}\delta_{n',n-1} \right)
}
$$
`
)

#pagebreak()
= 5
#align(
  left,
  rect(inset: 8pt)[For 1. The ground state, and 2. The first excited state, calculate the probability that a particle of mass $m$ in the 1d SHO with freq $omega$ is farther from the origin than the classical turning points where $E = V.$   ]
)

#mitext(`
- Let $b \equiv \sqrt{\hbar/(m\omega)}$ and $y \equiv x/b$.
- SHO energies: $E_n=(n+\tfrac12)\hbar\omega$.
- Classical turning points solve $E_n=\tfrac12 m\omega^2 x_t^2$, hence
$$
x_t(n)=b\sqrt{2n+1},\qquad y_t(n)=\sqrt{2n+1}.
$$
- Normalized SHO wavefunctions (in $y$):
$$
\psi_n(x)=\frac{1}{\sqrt{b}}\frac{1}{\pi^{1/4}\sqrt{2^n n!}}\,H_n(y)\,e^{-y^2/2},
$$
so
$$
|\psi_n(x)|^2=\frac{1}{\sqrt{\pi}\,b}\,\frac{H_n(y)^2}{2^n n!}\,e^{-y^2}.
$$
- “Tunneling” probability outside the classical region:
$$
P_n \equiv 2\int_{x_t(n)}^\infty |\psi_n(x)|^2\,dx
= 2\int_{y_t(n)}^\infty \frac{1}{\sqrt{\pi}}\frac{H_n(y)^2}{2^n n!}e^{-y^2}\,dy.
$$

- Ground state n=0
 Here $H_0(y)=1$, $y_t=\sqrt{1}=1$:
$$
P_0= \frac{2}{\sqrt{\pi}}\int_{1}^{\infty}e^{-y^2}\,dy
= \operatorname{erfc}(1) \approx 0.157299.
$$


- First excited state n=1

- Here $H_1(y)=2y$, $y_t=\sqrt{3}$, and
$$
P_1=\frac{2}{\sqrt{\pi}}\int_{\sqrt{3}}^{\infty}\frac{(2y)^2}{2}\,e^{-y^2}\,dy
=\frac{4}{\sqrt{\pi}}\int_{\sqrt{3}}^{\infty} y^{2}e^{-y^2}\,dy.
$$
- Use
$$
\int y^{2}e^{-y^{2}}\,dy
= -\frac{y}{2}e^{-y^{2}}+\frac{\sqrt{\pi}}{4}\operatorname{erf}(y),
$$
to obtain for $a>0$,
$$
\int_{a}^{\infty} y^{2}e^{-y^{2}}\,dy
=\frac{\sqrt{\pi}}{4}\operatorname{erfc}(a)+\frac{a}{2}e^{-a^{2}}.
$$
- With $a=\sqrt{3}$:
$$
P_1=\frac{4}{\sqrt{\pi}}
\left[\frac{\sqrt{\pi}}{4}\operatorname{erfc}(\sqrt{3})
+\frac{\sqrt{3}}{2}e^{-3}\right]
= \operatorname{erfc}(\sqrt{3})+\frac{2\sqrt{3}}{\sqrt{\pi}}e^{-3}.
$$

$$
\boxed{\,P_1=\operatorname{erfc}(\sqrt{3})+\dfrac{2\sqrt{3}}{\sqrt{\pi}}e^{-3}  \approx 0.11\,}
$$
`)

= 6 
#align(
  left,
  rect(inset: 8pt)[Show that for the 1d SHO ( $x$ being the position operator, )$ 
      braket(0,e^(i k x),0 ) = exp[- k^2  braket(0,x^2 ,0) slash 2] 
  $ 
  ]
)
Start from creation and annihilation oprators: $ 
    x = sqrt(frac(hbar , 2 m omega) )(a + a^dagger ) => quad e^(i k x) = e^(i lambda (a + a^dagger )), quad (lambda= k sqrt(hbar /(2 m omega)) ).  
$ 
Since $
[i lambda a, i lambda a^dagger ] = i^2 lambda^2 (a a^dagger - a^dagger a) = lambda^2  (a^dagger a- a a^dagger ) = lambda^2 [a^dagger ,a] = -lambda^2 ,
$ we can use 
the BCH formula to write $ 
    e^(i lambda (a + a^dagger )) = e^(i lambda a) e^(i lambda a^dagger ) e^(lambda^2 /2) .
$ 
Then $ 
    braket(0, e^(i k x),0) &= e^(lambda^2 /2) underbrace(braket(0,e^(i lambda a) e^(i lambda a^dagger ),0),*)   .
$ 
Expanding $ 
    e^(i lambda a) = sum_(m=0)^(infinity) frac((i lambda a)^m , m!) , quad e^(i lambda a^dagger ) = sum_(n=0)^(infinity) frac((i lambda a^dagger )^n , n!) ,
$ we have (\*) to be   $ 
     braket(0, sum_(m) sum_(n)  frac((i lambda)^(m+n)  ,m! n! )a^(m) (a^dagger)^n ,0    )= sum_(m) sum_(n)  frac((i lambda)^(m+n)  ,m! n! ) underbrace(braket(0, a^(m) (a^dagger)^n ,0 ),**) .
$ 

Since $(a^dagger )^n ket(0) = sqrt(n!) ket(n),$ (\*\*) becomes$ 
     sqrt(n!) braket(0, a^(m) , n) = sqrt(n!) sqrt(n (n-1) ... (n-m+1)) braket(0, n-m) = sqrt(n!) sqrt(n (n-1) ... (n-m+1)) delta_(m,n) = n! delta_(m,n). 
$ So for $n=m,$$ 
    (*) = sum_(n=0)^(infinity) frac((i lambda)^(2n) ,n! )= sum_(n) (-lambda^2 )^n / n! = e^(-lambda^2 ) .
$ 
Then $ 
    braket(0, e^(i k x),0) = e^(lambda^2 /2) e^(-lambda^2 ) = e^(-lambda^2 /2)  . 
$ 

On the other hand, since $ 
    braket(0,x^2 ,0) = braket(0, frac(hbar , 2 m omega) ( a^2  + a a^dagger + a^dagger  a + a^(dagger 2) ) )= frac(hbar , 2 m omega) braket(0, a^dagger  a + 1, 0)=frac(hbar , 2 m omega),   
$ 
we have $ 
    k^2 /2 braket(0,x^2 ,0) = k^2 /2 frac(hbar , 2 m omega) = lambda^2 /2, 
$ 
and so $ 
    braket(0, e^(i k x),0) = e^(- k^2  braket(0,x^2 ,0) slash 2) ,
$ as desired.
