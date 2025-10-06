#set math.equation(numbering: "(1)")
#set page(margin: (x: 1cm, y: 1cm))
#import "@preview/physica:0.9.6": *
#place(top + right, rect(inset: 3pt)[Phys406 HW3 Harry LUo
])

= P1 
#align(
  left,
  rect(
    inset: 8pt,
  )[Extramize the functional that describes defects in crystals $
      cal(F)[theta(x)] = integral_(-infinity)^(infinity) [ kappa /2 ( (dif theta)/(dif x) )^2 + V (1-cos theta(x))] dif x
    $
    subject to boudnary conditions $theta(-infinity) = 0, theta(infinity) = 2pi.$ Further, find the energy cost $E = cal(F)[Theta]$ for $Theta$ that extramizes $F$.
  ],
)
We read off the functional$
  F(theta, theta') = kappa / 2 theta'^2 + V(1-cos theta).
$ 
To use Euler-Lagrange equation, we first prepare $
  (diff F)/(diff theta) = v sin theta; quad (diff F)/(diff theta') = kappa theta'.
$ Then E-L gives $
  (dif )/(dif x) (kappa theta') - V sin theta = 0 \ 
  => theta'' = 1/xi^2 sin theta, quad xi = sqrt(kappa / V).
$ 
This non-linear ODE can be solved indirectly had we noticed that $F$ is independent of $x,$ and so Beltrami identity applies: $
  F - theta' (dif F)/(dif theta') = C \ 
  => kappa / 2 theta'^2 - V(1-cos theta) = C
$ Boundary conditions give $x-> plus.minus infinity => theta'=0, cos theta=1 ==> C= 0.$ 
Thus we solve $
  kappa/2 theta'^2 = V(1-cos theta) => theta'^2 = 4/xi^2 sin^2 (theta/2)
$ to get$
  frac(dif theta, 2 sin(theta/2)) = frac(dif x, xi)\ => 1/2 csc (theta/2) dif theta = 1/xi dif x.
$ 
Since $ integral csc u dif u = ln (tan (u/2)),$ we take integration on both sides over an arbidrary range $[x_0,x]$. this yields $
  #rect(inset: 8pt)[
    $ display(theta = arctan[exp(x-x_0)/xi] equiv Theta.)$
  ]
$ 
The corresponding functional is thus (with $kappa/2 Theta'^2 = V(1-cos Theta) $ ) $
  F(Theta,Theta') = 4V sin^2 (theta/2) = 4V sech^2 ((x-x_0)/xi).
$ The energy cost is therefore $
  E = integral_(-infinity)^(infinity) F dif x = 4V integral_(-infinity)^(infinity) sech^2 ((x-x_0)/xi) dif x = 8V xi = 
  #rect(inset: 8pt)[
    $ display(8 sqrt(kappa V).)$
  ]
$ 

#pagebreak()
= P2
#align(
  left,
  rect(
    inset: 8pt,
  )[Apply calculus of variations to find coupled equations for $psi$ and $ bold(A)$ that extramize $cal(F)$, where $cal(F)$ is the free energy functional of a superconductor:$
      cal(F)[psi(bold(r)), bold(A(r))] = integral_V (- |psi|^2 + 1/2 |psi|^4 + abs((-i/kappa nabla - bold(A)) med psi)^2 + med bold(H)^2 ) dif V
    $
  ],
)
Let $D_i = -i/kappa partial_i - A_i, H_i = epsilon_(i j k) partial_j A_k,$ and define $
  F(psi, psi^*, bold(A), partial_i psi, partial_i psi^*, partial_i A_j) = - |psi|^2 + 1/2 |psi|^4 + abs(D_i med psi)^2 + med H_i^2.
$ Here we use a genralized Euler Lagrange equation for $F(phi_j, partial_i phi_j)$: $
  (diff F)/(diff phi_j) - partial_i ( (diff F)/(diff (partial_i phi_j)) ) = 0.
$ 
We will deal with $phi_j = psi^*$ and $phi_j = A_j$ separately.
For $phi_j = psi^*,$ we have$
  (diff F)/(diff psi^*) = - psi + abs(psi)^2 psi - A_i D_i psi, \ (diff F)/(diff (partial_i psi^*)) = (diff )/(diff (partial_i psi^*)) (- i/kappa partial_i psi - A_i psi) (i/kappa partial_ i psi^* - A_i psi^*) = i/kappa D_i psi.
$ 
Then EL reads $
  (diff F)/(diff psi^*) - partial_i ( (diff F)/(diff (partial_i psi^*)) ) = 0 \ => 
  - psi + abs(psi)^2 psi - A_i D_i psi - i/kappa partial_i D_i psi = 0 \ =>
  #rect(inset: 8pt)[
    $ display(- psi + abs(psi)^2 psi + D_i D_i psi = 0.)$
  ]
$ 
On the other hand, for $phi_j = A_j,$ defining $D^dagger_i = (i/kappa partial_i - A_i) $ we have $
  (diff F)/(diff A_j) = -[psi D_j^dagger psi^* + psi^* D_j psi], \ (diff F)/(diff (partial_i A_j)) = 2 H_k (diff H_k)/(diff ( partial_i A_j)) = 2 H_k epsilon_(k i j)\ => partial_i ( (diff F)/(diff (partial_i A_j)) ) = 2 epsilon_(k i j) partial_i H_k = -2(nabla times bold(H))_j.
$ 
The EL equation thus reads $
  -[psi D_j^dagger psi^* + psi^* D_j psi] + 2 (nabla times bold(H))_j &= 0 ==> #rect(inset: 8pt)[
    $ display(nabla times bold(H) = bold(J)),$
  ]

  \ "where"
  J_i                                                                 &= 1/2[psi D_i^dagger psi^* + psi^* D_i psi]= 1/2[i/kappa (psi partial_i psi^* - psi^* partial_i psi) - (psi A_i psi^* + psi^* A_i psi) \
    & = 1/2[i/kappa (-2i Im(psi^* partial_i psi)) - 2 A_i abs(psi)^2] = 1/kappa Im(psi^* partial_i psi) - A_i abs(psi)^2.
$ 
Collecting above, we arrive at $
  cases(
    - psi + abs(psi)^2 psi + D_i D_i psi = 0,
    nabla times bold(H) = bold(J),
    bold(J) = 1/kappa Im(psi^* nabla psi) - bold(A) abs(psi)^2,

  ).
$ 

#pagebreak()

= P3
#align(
  left,
  rect(
    inset: 8pt,
  )[Find the kink configuration $phi(x)$ and its energy cost for the functional $
      cal(F)[phi] = integral_(-infinity)^(infinity) [ kappa /2 ( (dif phi)/(dif x) )^2 + V/4 (phi^2 - phi_0^2)^2] dif x
    $
    subject to boundary conditions $phi(-infinity) = -phi_0, phi(infinity) = phi_0.$
  ],
)
We read off the functional$
  F(phi, phi') = kappa / 2 phi'^2 + V/4 (phi^2 - phi_0^2)^2.
$
Similar to P1, we notice that $F$ is independent of $x,$ and so Beltrami identity applies: $
  F - phi' (dif F)/(dif phi') = C \
  => -kappa / 2 phi'^2 + V/4 (phi^2 - phi_0^2)^2 = C
$
Boundary conditions give $x-> plus.minus infinity => phi'=0, phi^2 = phi_0^2 ==> C= 0.$
Thus we solve $ kappa/2 phi'^2 = V/4 (phi^2 - phi_0^2)^2 => phi' = sqrt(V/(2kappa)) (phi_0^2 - phi^2) $ to get$
  (dif phi)/(phi_0^2-phi^2) = sqrt(V/(2kappa)) dif x.
$
Since $integral (dif u)/(a^2-u^2) = 1/a "artanh"(u/a),$ we take integration on both sides over an arbitrary range $[x_0, x]$. this yields $ 1/phi_0 "artanh"(phi/phi_0) = sqrt(V/(2kappa)) (x-x_0). $
Defining a characteristic length $ xi = sqrt(kappa/(V phi_0^2)) ,$ the equation simplifies to $ "artanh"(phi/phi_0) = (x-x_0)/(sqrt(2)xi).$
$
  #rect(inset: 8pt)[
    $ display(phi = phi_0 tanh[(x-x_0)/(sqrt(2)xi)] equiv Phi.)$
  ]
$
The corresponding functional is thus (with $kappa/2 Phi'^2 = V/4(Phi^2-phi_0^2)^2 $)$ F(Phi,Phi') = kappa Phi'^2 = (kappa phi_0^2)/(2xi^2) sech^4((x-x_0)/(sqrt(2)xi)) = V/2 phi_0^4 sech^4((x-x_0)/(sqrt(2)xi)).$
The energy cost is therefore $ E = integral_(-infinity)^(infinity) F dif x = V/2 phi_0^4 integral_(-infinity)^(infinity) sech^4((x-x_0)/(sqrt(2)xi)) dif x$
Using the standard integral $ integral_(-infinity)^infinity sech^4(u) dif u = 4/3, $we get
$
  #rect(inset: 8pt)[
    $ display(E = (2sqrt(2))/3 phi_0^3 sqrt(kappa V).)$
  ]
$

#pagebreak()
= P4
#align(
  left,
  rect(
    inset: 8pt,
  )[Consider a functional of three functions $
      G[y_1, y_2, y_3] = integral_(x_0)^(x_1) F[x,y,y'] dif x, quad F[x,y,y']= 1/2 sum_(i,j=1)^(3) g_(i j)(y) y_i' y_j' - U(y),
    $
    where $g_(i j)$ is a symmetric matrix that depends on $y$. Derive the sytem's of Euler-Lagrange equations that extramize $G$. Use Chistoffel symbols to simplify your result.],
)
Using Einstein summation convention, and denote $ partial_k u = (diff u)/(diff y_k),$ we write $
  F = 1/2 g_(i j) y_i' y_j' - U(y).
$ 
And the Euler-Lagrange equation elements are found as follows $
  (diff F)/(diff y_k) = (diff )/(diff y_k) [1/2 g_(i j) y_i' y_j' - U(y)] = 1/2 (partial_k g_(i j)) y_i' y_j' - partial_k U, \ 
  (diff F)/(diff y'_k) = 1/2 g_(i j) partial_k (y_i' y_j') = 1/2 g_(i j) (delta_(i k) y_j' + y_i' delta_(j k)) = g_(k j) y_j'
$ 
 
$
  (dif )/(dif x) ( (diff F)/(diff y'_k) ) &= (dif )/(dif x) (g_(k j) y_j') = (dif g_(k j))/(dif x) y'_j + (dif )/(dif x)y'_j g_(k j) \ 
                                          & = (dif y_l)/(dif x) (diff )/(diff y_l) g_(k j) y'_j + y''_j g_(k j) = (partial_l g_(k j)) y'_l y'_j + g_(k j) y''_j.
$ 
E-L equation reads$
  1/2 (partial_k g_(i j)) y'_i y'_j - partial_k U - (partial_l g_(k j)) y'_l y'_j - g_(k j) y''_j = 0 \
$ 
Rearranging $
  g_(k j) y''_j + partial_l g_(k j) y'_l y'_j - 1/2 partial_k g_(i j) y'_i y'_j + partial_k U = 0.
$ 
We can use the identity $g_(m k) g_(k j)= delta(m j)$ to simplify: $
  y''_m + g_(m k) underbrace([ partial_l g_(k j) - 1/2 partial_k g_(i j)] y'_l y'_j, (*)) + g_(m k) partial_k U = 0.
$ 
Since $y'_l y'_j$ is symmetric in $l,j,$ we can symmetrize the term $
  partial_l g_(k j) y'_l y'j = 1/2 [ partial_l g_(k j) + partial_j g_(k l)] y'_l y'_j.
$ Then $(*)$ becomes $
  1/2[ partial_l g_(k j) + partial_j g_(k l) - partial_k g_(i j)] y'_l y'_j = Gamma_(l j)^k med y'_l y'_j,
$ 
and we arrive at a simplified form: $
  #rect(inset: 8pt)[
    $ display(y''_m + g_(m k) Gamma_(l j)^k med y'_l y'_j + g_(m k) partial_k U = 0.)$
  ]
$ 
 
= P5
#align(
  left,
  rect(
    inset: 8pt,
  )[
    Consider the Lagrangian density for a one-dimensional electron-phonon system:
    $ cal(L) = i/2(dot(psi)psi^* - psi dot(psi)^*) - 1/2 abs(partial_x psi)^2 + 1/2 (partial_t u)^2 - s^2/2(partial_x u)^2 + g(partial_x u)abs(psi)^2. $
    First, derive the equations of motion for the complex field $psi(x, t)$ and the real field $u(x,t)$. Then, find a traveling-wave solution (polaron) of the form $psi(x, t) = e^(i(a x - b t))phi(x - V t)$ and $u(x,t) = U(x-V t)$. Finally, calculate the total energy $E(V)$ of this solution and find the ground state energy $E_0$.
  ],
)

*1. Equations of Motion from Variational Principle*

The Lagrangian density is given by $cal(L) = cal(L)_psi + cal(L)_u + cal(L)_(psi u)$:
$ display(
  cal(L) = i/2(dot(psi)psi^* - psi dot(psi)^*) - 1/2 abs(partial_x psi)^2 + 1/2 (partial_t u)^2 - s^2/2(partial_x u)^2 + g(partial_x u)abs(psi)^2
) $
The equations of motion are derived from the Euler-Lagrange equations.

*Equation for $psi(x, t)$* \
We vary with respect to the independent field $psi^*$. The Euler-Lagrange equation is:
$ display(
  (diff cal(L))/(diff psi^*) - partial_t ((diff cal(L))/(diff dot(psi)^*)) - partial_x ((diff cal(L))/(diff (partial_x psi^*))) = 0
) $
The required partial derivatives are:
- $ (diff cal(L))/(diff psi^*) = i/2 dot(psi) + g(partial_x u)psi $
- $ (diff cal(L))/(diff dot(psi)^*) = -i/2 psi $
- $ (diff cal(L))/(diff (partial_x psi^*)) = -1/2(partial_x psi) $

Substituting these into the equation gives:
$ (i/2 dot(psi) + g(partial_x u)psi) - partial_t (-i/2 psi) - partial_x (-1/2 partial_x psi) = 0 $
$ => i/2 dot(psi) + g(partial_x u)psi + i/2 dot(psi) + 1/2 partial_x^2 psi = 0 $
This simplifies to the first equation of motion:
$
  #rect(inset: 8pt)[
    $ display(i partial_t psi = -1/2 partial_x^2 psi - g(partial_x u)psi)$
  ]
$

*Equation for $u(x,t)$* \
We vary with respect to the real field $u$:
$ display(
  (diff cal(L))/(diff u) - partial_t ((diff cal(L))/(diff (partial_t u))) - partial_x ((diff cal(L))/(diff (partial_x u))) = 0
) $
The partial derivatives are:
- $ (diff cal(L))/(diff u) = 0 $
- $ (diff cal(L))/(diff (partial_t u)) = partial_t u $
- $ (diff cal(L))/(diff (partial_x u)) = -s^2(partial_x u) + g abs(psi)^2 $

Substituting these yields:
$ 0 - partial_t (partial_t u) - partial_x (-s^2 partial_x u + g abs(psi)^2) = 0 $
This simplifies to the second equation of motion:
$
  #rect(inset: 8pt)[
    $ display(partial_t^2 u - s^2 partial_x^2 u + g partial_x (abs(psi)^2) = 0)$
  ]
$

*2. Traveling-Wave Solution*

We seek a solution where the electron and the string deformation propagate together at a velocity $V$. We introduce the co-moving coordinate $xi = x - V t$ and use the ansatz:
$ psi(x, t) = e^(i(a x - b t))phi(xi), quad u(x,t) = U(xi) $
where $phi(xi)$ is a real-valued profile function, and $a, b$ are constants. The derivatives transform as $partial_t = -V (dif)/(dif xi)$ and $partial_x = (dif)/(dif xi)$.

Applying these transformations to the ansatz (denoting $dif/(dif xi)$ with a prime):
- $ partial_t psi = e^(i(a x-b t))(-i b phi - V phi') $
- $ partial_x psi = e^(i(a x-b t))(i a phi + phi') $
- $ partial_x^2 psi = e^(i(a x-b t))(-a^2 phi + 2 i a phi' + phi'') $
- $ partial_t u = -V U', quad partial_t^2 u = V^2 U'' $
- $ partial_x u = U', quad partial_x^2 u = U'' $

Substituting these into the first equation of motion and canceling the phase factor $e^(i(a x-b t))$ gives:
$ i(-i b phi - V phi') = -1/2(-a^2 phi + 2 i a phi' + phi'') - g U' phi $
$ => b phi - i V phi' = a^2/2 phi - i a phi' - 1/2 phi'' - g U' phi $
Separating the real and imaginary parts:
- *Imaginary Part:* $ -V phi' = -a phi' ==> a=V. $ This aligns the phase velocity with the group velocity, a feature of Galilean invariance.
- *Real Part:* $ b phi = V^2/2 phi - 1/2 phi'' - g U' phi. $ Rearranging gives:
  $ display(-1/2 phi'' - g U' phi = (b - V^2/2)phi) $<eq.1>
  Define $mu := b - V^2/2$, which represents the energy of the electron in the co-moving frame. The equation becomes:
  $ display(-1/2 phi''(xi) - g U'(xi) phi(xi) = mu phi(xi)) $

Next, substituting the ansatz into the second equation of motion gives:
$ V^2 U'' - s^2 U'' + g (dif)/(dif xi)(phi^2) = 0 ==> (V^2-s^2)U'' + g(phi^2)' = 0 $<eq.2>

*Solving the Coupled ODEs* \
We integrate @eq.2 with respect to $xi$. For a localized polaron, we assume the fields vanish at infinity ($phi(xi) -> 0$ and $U'(xi) -> 0$ as $abs(xi) -> infinity$), which sets the integration constant to zero:
$ (V^2-s^2)U' + g phi^2 = 0 ==> U'(xi) = g/(s^2-V^2) phi^2(xi) $
For a localized "bright soliton" solution to exist, the induced self-interaction for the electron must be attractive. Substituting $U'$ into @eq.1:
$ -1/2 phi'' - g^2/(s^2-V^2) phi^3 = mu phi $
The nonlinear term $- g^2/(s^2-V^2) phi^3$ is attractive if the coefficient is negative, which requires $s^2 - V^2 > 0$, or $abs(V)<s$. The polaron must travel slower than the speed of sound in the medium. We also need $mu < 0$ for a bound state. Let $mu = -nu$ where $nu > 0$. The equation is:
$ phi'' = 2 nu phi - (2g^2)/(s^2-V^2) phi^3 $
This is a standard nonlinear Schrödinger (NLS) equation. The solution is of the form:
$ phi(xi) = A sech(alpha xi) $
Substituting this form back into the NLS equation gives the relations: $alpha^2 = 2nu$ and $A^2 = (2nu(s^2-V^2))/g^2 = (alpha^2(s^2-V^2))/g^2$.

We impose the normalization condition for a single electron, $integral_(-infinity)^(infinity) abs(psi)^2 dif x = integral_(-infinity)^(infinity) phi^2 dif xi = 1$:
$ integral_(-infinity)^(infinity) A^2 sech^2(alpha xi) dif xi = A^2 [1/alpha tanh(alpha xi)]_(-infinity)^(infinity) = (2A^2)/alpha = 1 $
Using $A^2 = (alpha^2(s^2-V^2))/g^2$, we get $2/alpha (alpha^2(s^2-V^2))/g^2 = 1$, which solves for $alpha$:
$ alpha = g^2/(2(s^2-V^2)) $
From this, we find the other parameters:
$ A^2 = alpha/2 = g^2/(4(s^2-V^2)), quad nu = alpha^2/2 = g^4/(8(s^2-V^2)^2) $

*3. System Energy $E(V)$*

The Hamiltonian (energy) density is derived from the Lagrangian density: $cal(H) = sum pi_i dot(phi)_i - cal(L)$.
$ pi_psi = (diff cal(L))/(diff dot(psi)) = i/2 psi^*, quad pi_u = (diff cal(L))/(diff dot(u)) = partial_t u $
$ cal(H) &= (i/2 psi^*)dot(psi) + (-i/2 psi)dot(psi)^* + (partial_t u)(partial_t u) - cal(L) \ 
       & = 1/2 abs(partial_x psi)^2 + 1/2 (partial_t u)^2 + s^2/2(partial_x u)^2 - g(partial_x u)abs(psi)^2
) $
The total energy is $E(V) = integral_(-infinity)^(infinity) cal(H) dif x$. We substitute the traveling wave solution into the terms of $cal(H)$:
- $ abs(partial_x psi)^2 = abs(e^(i(V x-b t))(phi' + i V phi))^2 = (phi')^2 + V^2 phi^2 $
- $ (partial_t u)^2 = (-V U')^2 = V^2 (U')^2 $
- $ (partial_x u)^2 = (U')^2 $
- Using $U' = g/(s^2-V^2) phi^2$, the terms involving $u$ become:
  $ 1/2(V^2+s^2)(U')^2 - g U' phi^2 = 1/2(V^2+s^2) g^2/((s^2-V^2)^2) phi^4 - g^2/(s^2-V^2) phi^4 = -(g^2(s^2-3V^2))/(2(s^2-V^2)^2) phi^4 $

The total energy integral is:
$ E(V) = integral_(-infinity)^(infinity) [ 1/2((phi')^2 + V^2 phi^2) - (g^2(s^2-3V^2))/(2(s^2-V^2)^2) phi^4 ] dif xi $
We evaluate the separate integrals using our solution for $phi$:
- $ integral 1/2 V^2 phi^2 dif xi = 1/2 V^2 quad integral phi^2 dif xi = 1/2 V^2 $ (from normalization).
- $ integral 1/2 (phi')^2 dif xi = integral 1/2 A^2 alpha^2 sech^2(alpha xi) tanh^2(alpha xi) dif xi = (A^2 alpha)/3 = ((alpha/2)alpha)/3 = alpha^2/6 = nu/3 = g^4/(24(s^2-V^2)^2) $.
- $ integral phi^4 dif xi = integral A^4 sech^4(alpha xi) dif xi = A^4 (4)/(3 alpha) = (alpha/2)^2 (4)/(3 alpha) = alpha/3 = g^2/(6(s^2-V^2)) $.

Combining these results:
$ E(V) &= 1/2 V^2 + g^4/(24(s^2-V^2)^2) - (g^2(s^2-3V^2))/(2(s^2-V^2)^2) (g^2/(6(s^2-V^2))) \
     &= 1/2 V^2 + g^4/(24(s^2-V^2)^3) [ (s^2-V^2) - 2(s^2-3V^2) ] \
     &= 1/2 V^2 + g^4/(24(s^2-V^2)^3) (5V^2 - s^2) $
This gives the final energy as a function of velocity for the subsonic polaron, valid for $abs(V)<s$:
$
  #rect(inset: 8pt)[
    $ display(E(V) = V^2/2 + (g^4(5V^2 - s^2))/(24(s^2-V^2)^3))$
  ]
$

*Ground State Energy $E_0$* \
The ground state energy is the energy of a static polaron, found by setting $V=0$.
$ E_0 = E(0) = 0/2 + (g^4(0 - s^2))/(24(s^2-0)^3) = 
#rect(inset: 8pt)[
  $ display((-g^4 s^2)/(24 s^6))$
] $

The negative energy confirms that the formation of a static polaron is energetically favorable, representing a stable bound state.
