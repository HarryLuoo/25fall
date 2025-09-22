#set math.equation(numbering: "(1)")
#set page(margin: (x: 1cm, y: 1cm))
#import "@preview/physica:0.9.5": *
#place(top + right, rect(inset: 3pt)[PHYSICS406|HW1| Harry Luo])

= P1
 They are all governed by the diffusion equation: $ 
     partial_t phi( bold(r), t) = D nabla^2 phi( bold(r), t)\
     => [D] =  frac([L]^2 , [T]).
 $ 
 
=== 1. Penetration of viscous flow into medium 
For a viscous fluid, we consider the following properties and dimensions:
- Dynamic viscosity $mu$, which relates shear stress to the rate of strain. :$ 
    [mu] = frac(["force"] , ["area"]) ["time"] = frac([M] [L] [T]^(-2) , [L]^2) [T]  = [M] [L]^(-1) [T]^(-1).
$ 
- Density $rho$ : $ 
    [rho] = [M] [L]^(-3)
$
 We then relate the diffusion constant $D$ (in this context, the kinematic viscosity) to these properties: $ 
     D prop mu^gamma rho^beta \ 
     => frac([L]^2  , [T]) =  ([M] [L]^(-1) [T]^(-1))^gamma ([M] [L]^(-3))^beta \
=> gamma = 1, beta = -1,
 $ and from which we have $ 
#rect(inset: 8pt)[
$ display(     D prop mu rho^(-1). )$
]

 $ 
Now, considering a characteristic length scale $l,$ it must be related to both $D$ and a time scale $tau$ as$ 
    [l] = [D]^a [tau]^b = ([L]^2 [T]^(-1) )^a ([T])^b \ => a = 1/2, b = 1/2,
 $ and thus $ 
#rect(inset: 8pt)[
$ display(    l prop sqrt(D tau) prop sqrt( frac(mu tau, rho)))$
]
.
$ 


=== 2. Thermal propagation into medium 
For a thermal conductive medium, we consider the following properties and dimensions: 
- Thermal conductivity $k$, which relates heat flux to the temperature gradient. :$ 
    [k] = frac(["power"] , ["length"]["temp"]) = frac([L]^2 [M] [T]^(-3) , [L] [Theta])  = [M] [L] [T]^(-3) [Theta]^(-1).
$ 
- Density $rho$ : $ 
    [rho] = [M] [L]^(-3)
$
- Spcific heat capacity $c_p$: The amount of heat energy required to raise the temperature of a unit mass of a substance by one degree.$ 
    [c_p] = frac(["energy"] , ["mass"]["temp"]) = frac([M] [L]^2 [T]^(-2) , [M] [Theta]) = [L]^2 [T]^(-2)  [Theta]^(-1).
$ 
 We then relate diffusion constant $D$ to these properties: $ 
     D prop k^gamma rho^beta c_p^alpha \ 
     => frac([L]^2  , [T]) =  ([M] [L] [T]^(-3) [Theta]^(-1))^gamma ([M] [L]^(-3))^beta ([M] [Theta]) [L]^2 [T]^(-2)  [Theta]^(-1))^alpha \
=> alpha = beta = -1, gamma = -beta = 1,
 $ and from which we have $ 
#rect(inset: 8pt)[
$ display(     D prop k rho^(-1) c_p^(-1). )$
]

 $ 
Now, considering a characteristic length scale $l,$ it must be related to both $D$ and a time scale $tau$ as$ 
    [l] = [D]^a [tau]^b = ([L]^2 [T]^(-1) )^a ([T])^b \ => a = 1/2, b = 1/2,
 $ and thus $ 
#rect(inset: 8pt)[
$ display(    l prop sqrt(D tau) prop sqrt( frac(k tau,rho c_p)))$
]
.
$ 
   
 
=== 3. Penetration of EM wave in a conducting medium
For an electrically conducting medium, we consider the following properties and dimensions:
- Magnetic permeability $mu$, which describes the material's response to a magnetic field. :$ 
    [mu] = frac(["force"] , ["current"]^2) = frac([M] [L] [T]^(-2) , [I]^2) = [M] [L] [T]^(-2) [I]^(-2).
$ 
- Electrical conductivity $sigma$, which relates current density to the electric field. : $ 
    [sigma] = frac(["current"]^2 ["time"]^3 , ["mass"] ["length"]^3) = [M]^(-1) [L]^(-3) [T]^3 [I]^2.
$
 We then relate the diffusion constant $D$ (in this context, the magnetic diffusivity) to these properties: $ 
     D prop mu^gamma sigma^beta \ 
     => frac([L]^2  , [T]) =  ([M] [L] [T]^(-2) [I]^(-2))^gamma ([M]^(-1) [L]^(-3) [T]^3 [I]^2)^beta \
=> gamma = -1, beta = -1,
 $ and from which we have $ 
#rect(inset: 8pt)[
$ display(     D prop (mu sigma)^(-1). )$
]

 $ 
Now, considering a characteristic length scale $l,$ it must be related to both $D$ and a time scale $tau$ as$ 
    [l] = [D]^a [tau]^b = ([L]^2 [T]^(-1) )^a ([T])^b \ => a = 1/2, b = 1/2,
 $ and thus $ 
#rect(inset: 8pt)[
$ display(    l prop sqrt(D tau) prop sqrt( frac(tau, mu sigma)))$
]
.
$ 

#pagebreak()
= P2
Cross setction has dimension of area, $[sigma_T]=[L]^2. $ We are interested in expressing $sigma_T$ in terms of the potential and parameters of collision. Note that the problem with divergent integral $ 
    integral_(0)^(infinity) b dif b -> infinity 
$ is that, at large $b$ (i.e. far away from potential source), the deflection is small, but never zero. Quantum mechanics fix this by introducing the wave nature of particles, with non-local particles negligibly affected by the potential at large distance, i.e. setting a classical limit $b_max$ beyond which the particle is unaffected by the potential.

- All that word is to motivate the introduction of Planck constant $h,$ with $[h]=[M][L]^2 [T]^(-1)$.

- The potential function $V(r) = A slash r^n$ gives $[A] = [E] [L]^(n) =  [M] [L]^(n+2) [T]^(-2).$ 
  
- A collision is characterized by the impact velocity $v$.

With ${A, v, h},$ we can estimate $sigma_T$ with: $ 
    [sigma_T] = A^a h^b v^c \ 
    [L]^2 = ([M] [L]^(n+2) [T]^(-2))^a med ([M][L]^2 [T]^(-1))^b med([L] [T]^(-1))^c \
=> [L]^2 = [M]^(a+b) med [L]^(a(n+2)+2b+c) med [T]^(-2a-b-c) \
$ 
and from which: $ 
    cases(a + b = 0, (2+ n) a + b + c = 2, -2 a - b - c = 0) => cases(a = display(frac(2 , n-1)) ,b = display(frac(-2 , n-1)) ,c = display(frac(-2 , n-1)) )
$ 
Thus, $ 
    sigma_T prop A^(frac(2 , n-1)) h^(frac(-2 , n-1)) v^(frac(-2 , n-1))  \ =>
#rect(inset: 8pt)[
$ display( sigma_T prop   (frac(A , h v))^(display(frac(2 , n-1))).)$
]

$ 
 
#pagebreak()
= P3 
We treat the rod as an inverted pendulum, for which we know from classical mechanics that, the characteristic time for a pendulum scales as $ 
    t_c prop sqrt(l/g.)  
$<eq.lg>
But classical mechanics can't explain why the rod falls from unstable equilibrium. To this end we introduce quantum mechanical constant $h.$ To this end we also introduce relevant parameters of mass $m. $

Buckingham theorem tells us, that if we want to express $t$ in terms of ${h, g, l, m}$ having known @eq.lg a priori, we need to construct a dimensionless function $ f$ , so that $ 
    t prop sqrt(l/g) med f(m, h, l, g).
$ 
Since $f(m, h, l, g)$ is dimensionless, we let $ 
    1 = [h]^a [m]^b [l]^c [g]^d \ => 1 = ([M] [L]^2 [T]^(-1))^a med [M]^b [L]^c ([L] [T]^(-2))^d 
    $ 
from which, $ 
    cases(a+ b = 0, b + c + 2d = 0, -2c - d = 0.) quad ==>_(d equiv 1)  quad cases(a = -1, b = -3/2, c = -1/2).
$ 
So that $ 
    t prop sqrt(l/g) dot med display(f(frac(h , m l^(3 slash 2) sqrt(g) ))).
    $<eq.f>

Further, we know for a pendulum in unstable equilibrium, $ 
    dot.double(theta) approx omega^2  theta &=> theta approx theta_0 exp(omega t) equiv theta_0 exp(t slash t_c) \ 
    & => t ~ t_c ln(1/theta_0) = sqrt(l/g) ln(1/theta_0).
$ <eq.unstable>.

Comparing @eq.f and @eq.unstable, we can make an educated estimate that the quantum effect is encapsulated in the logarithmic term, i.e. $f(dot) = ln(dot)$ and so $ 
#rect(inset: 8pt)[
$ display(t prop sqrt(l/g) thick ln(frac(h, m l^(3 slash 2) sqrt(g) )).)$
]

$


#pagebreak()
= P4 
Chopers hover due to the lift caused by pressure difference created by the propeller. To this end, we consider the engine power $P$  to be related with air density $rho,$ propeller diameter $l,$ and weight of choper, $G$. Set $ 
     P prop rho^a l^b G^c \ => [M] [L]^2 [T]^(-3) = ([M] [L]^(-3) )^a med [L]^b med ([M][L][T]^(-2))^c \ => cases(a + c = 1, -3a + b +c  =2, -2c = -3) quad => cases(a = -1/2, b = -1, c = 3/2).
$ 

This gives $ P prop rho^(-1/2) l^(-1) G^(3/2).
$ We approximate a choper as a cubic box of side length $l.$ Then, for choper 1 with $l_1, G_1$, and choper 2 being twice as large in _volume_ : $ 
    V_2 = 2 V_1 => l_2^3 = 2 l_1^3 => l_2 = 2^(1/3) l_1,  
$ and $G_2 = 2 G_1.$ Then $ 
    P_2 = rho^(-1/2) l_2^(-1) G_2^(3/2) = rho^(-1/2) (2^(1/3) l_1)^(-1) (2 G_1)^(3/2) = rho^(1/2) dot 2^(7/6) (l_1^(-1) G_1^(3/2))= 
#rect(inset: 8pt)[
$ display(   2^(7 slash 6) P_1)$
]

$ 

#pagebreak()
= P5 
For the White Dwarf mass limit, we derive the scaling in two steps using dimensional analysis: first, the relativistic degenerate pressure $P$ from electron density $n_e$; second, balancing it against gravity for total mass $M$.

=== 1. Degenerate Pressure $P$ from $n_e$

Relevant parameters: $hbar$ ($[hbar] = [M] [L]^2 [T]^(-1)$), $c$ ($[c] = [L] [T]^(-1)$), $n_e$ ($[n_e] = [L]^(-3)$).

Seek $P$ ($[P] = [M] [L]^(-1) [T]^(-2)$): $ P prop hbar^a c^b n_e^d \
=> cases(a = 1, 2a  +b - 3d = -1, -a - b = -2) => cases(a=1, b=1, d=4/3). $

Thus, $ #rect(inset: 8pt)[
$ display( P prop hbar c n_e^(4/3) )$
]
$
=== 2. Gravitational Balance for $M$

Relevant parameters: $G$ ($[G] = [M]^(-1) [L]^3 [T]^(-2)$), $hbar$, $c$, $m_p$ ($[m_p] = [M]$).

Seek $M$ ($[M] = [M]^1$): $ M prop G^a hbar^b c^d m_p^e  \ 
=> cases(- a + b + e = 1, 3a + 2b + d = 0, -2a - b - d = 0)
=> cases(b = -a, d = -a, e = 1 + 2a).
$

To fix the free exponent $a$, use the pressure-gravity balance. The electron density $n_e prop rho / m_p$, with stellar density $rho prop M / R^3$, so $n_e prop M / (m_p R^3)$. From Step 1, $P prop hbar c n_e^(4/3) prop hbar c (M / (m_p R^3))^ (4/3)$.

Hydrostatic equilibrium scales as $P prop G M^2 / R^4$ (pressure gradient $P/R$ balances gravitational pull $G M / R^2$ times $M/R^2$).

Set them equal: $ hbar c (M / (m_p R^3))^ (4/3) prop G M^2 / R^4 \ => hbar c M^(4/3) / m_p^(4/3) prop G M^2 $

Solve for $M$: $M^(2 - 4/3) prop (hbar c / G) m_p^(4/3)$, so $M^(2/3) prop (hbar c / G) m_p^(4/3)$.

Thus, $M prop (hbar c / G)^(3/2) m_p^(-2)$, implying $a = -3/2$, $b=3/2$, $d=3/2$, $e=-2$.

$ #rect(inset: 8pt)[
$ display( M prop (frac(hbar c, G))^(3/2) m_p^(-2) )$
]
$
