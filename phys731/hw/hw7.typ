#set math.equation(numbering: "(1)")
#set text(font: "Palatino Linotype", size: 11pt)
#set page(margin: (x: 1cm, y: 1cm), numbering: "1/1")
#import "@preview/physica:0.9.7": *
#import "@preview/wrap-it:0.1.1": wrap-content

#place(top + right, rect(inset: 3pt)[phys731 HW7| Harry Luo
])

= 1
#align(left, rect(inset: 8pt)[#image("assets/2025-11-20-21-53-02.png")])




*Unitarity ($U^dagger U = 1$):* \
Let $
N = a_0 + i bold(sigma) dot bold(a), \ => a_0 - i bold(sigma) dot bold(a) = N^dagger, [N, N^dagger ] =0.
$ 
Then 
$
  U^dagger = (N (N^dagger)^(-1))^dagger = (N^dagger)^(-1 dagger) N^dagger = N^(-1) N^dagger
$
$
  U U^dagger = N (N^dagger)^(-1) N^(-1) N^dagger = N N^(-1) (N^dagger)^(-1) N^dagger = 1 dot 1 = 1
$ and is thus unitary.

*Unimodularity ($det U = 1$):* \
Using the identity $det(c I + bold(sigma) dot bold(v)) = c^2 + abs(bold(v))^2$ (where $abs(bold(v))^2 = bold(v) dot bold(v)$ for complex vectors, here just $a^2$):
$
  det U = frac(det(a_0 + i bold(sigma) dot bold(a)), det(a_0 - i bold(sigma) dot bold(a))) = frac(a_0^2 + abs(bold(a))^2, a_0^2 + abs(bold(a))^2) = 1.
$

== b. Axis $hat(n)$ and Angle $theta$
We seek $U$ in standard form $cos(theta/2) - i (bold(sigma) dot hat(n)) sin(theta/2)$. 

Multiply numerator and denominator by $N = a_0 + i bold(sigma) dot bold(a)$:
$
  U = frac((a_0 + i bold(sigma) dot bold(a))^2, a_0^2 + bold(a)^2) = frac(a_0^2 - bold(a)^2 + 2i a_0 (bold(sigma) dot bold(a)), a_0^2 + bold(a)^2)
$
Separating real and imaginary parts:
$
  U = underbracket(frac(a_0^2 - bold(a)^2, a_0^2 + bold(a)^2), cos(theta\/2)) + i (bold(sigma) dot bold(a)) frac(2 a_0, a_0^2 + bold(a)^2)
$
Matching terms with starndard form:
$
  hat(n) = - frac(bold(a), abs(bold(a))), \   cos(theta/2) = frac(a_0^2 -  bold(a)^2  ,a_0^2  +  bold(a)^2  ) => quad 
theta = 2 arccos(frac(a_0^2 - bold(a)^2, a_0^2 + bold(a)^2)).
$

#pagebreak()
= 2
#align(left, rect(inset: 8pt)[#image("assets/2025-11-20-22-01-23.png")])

Given the matrix $D^((1/2))(alpha, beta, gamma)$, we find the equivalent single rotation angle $theta$. The trace (character) of a rotation matrix is basis independent:
$
  chi(theta) = Tr(D) = 2 cos(theta/2)
$
Computing the trace of the given matrix:
$
  Tr(D) &= e^(-i(alpha+gamma)/2) cos(beta/2) + e^(i(alpha+gamma)/2) cos(beta/2) \
  &= cos(beta/2) (e^(-i(alpha+gamma)/2) + e^(i(alpha+gamma)/2)) \
  &= 2 cos(beta/2) cos(frac(alpha + gamma, 2))
$
Equating the traces yields:
$
  theta = 2 arccos(cos(beta/2) cos(frac(alpha+gamma, 2))).
$

#pagebreak()

= 3
#align(left, rect(inset: 8pt)[#image("assets/2025-11-20-23-10-41.png")])



*Proof:*
Let $U = e^(-i J_z phi \/ hbar) e^(-i J_y theta \/ hbar)$. We check if $U^dagger hat(O) U = J_z$.
$
  hat(O)_("rot") = U^dagger hat(O) U = e^(i J_y theta \/ hbar) ( e^(i J_z phi \/ hbar) hat(O) e^(-i J_z phi \/ hbar) ) e^(-i J_y theta \/ hbar)
$
1. *Rotation by $-phi$ about z:*
   $J_x -> J_x cos phi - J_y sin phi$, $J_y -> J_x sin phi + J_y cos phi$.
   Substituting into $hat(O)$, the $sin theta$ terms simplify:
   $
     sin theta (J_x (c_phi^2 + s_phi^2)) + J_z cos theta = J_x sin theta + J_z cos theta
   $
2. *Rotation by $-theta$ about y:*
   $J_x -> J_x cos theta - J_z sin theta$, $J_z -> J_z cos theta + J_x sin theta$.
   $
     hat(O)_("rot") &= (J_x cos theta - J_z sin theta) sin theta + (J_z cos theta + J_x sin theta) cos theta \
     &= J_x (sin theta cos theta - sin theta cos theta) + J_z (cos^2 theta + sin^2 theta) = J_z
   $
Since $U^dagger hat(O) U = J_z$, then $hat(O) U = U J_z$. Applying to eigenstate $ket(j\, m)$:
$
  hat(O) ket(psi) = hat(O) U ket(j\, m) = U J_z ket(j\, m) = m hbar U ket(j\, m) = m hbar ket(psi).
$

#pagebreak()
= 4
#align(left, rect(inset: 8pt)[#image("assets/2025-11-20-23-32-28.png")])


Let $cal(J) = bold(J)^((1)) dot hat(n) slash hbar$. The eigenvalues are $1, 0, -1$.

== a. Characteristic Equation
Since the eigenvalues are $lambda in {1, 0, -1}$, the operator satisfies:
$
  (cal(J) - 1)(cal(J) - 0)(cal(J) + 1) = cal(J)(cal(J)^2 - 1) = 0 =>cal(J)^3 = cal(J).
$

== b. Rotation Formula
The Taylor expansion of $D = e^(-i cal(J) phi)$:
$
  D = 1 - i cal(J) phi - frac(cal(J)^2 phi^2, 2!) + frac(i cal(J)^3 phi^3, 3!) + ...
$
Using $cal(J)^3 = cal(J)$ (and $cal(J)^4 = cal(J)^2$), we group terms:
$
  D = 1 - i cal(J) (phi - phi^3/3! + ...) - cal(J)^2 (phi^2/2! - phi^4/4! + ...) $ 
  Recognizing the expansion of sine and cosine, 
  $ 
  
  D = 1 - i cal(J) sin phi - cal(J)^2 (1 - cos phi)
$

== c. Matrix for $beta$ rotation ($hat(n) = hat(y)$)
IN the standard basis, $ cal(J)_y = frac(1, sqrt(2)) mat(0, -i, 0; i, 0, -i; 0, i, 0) =>
  cal(J)_y^2 = frac(1, 2) mat(1, 0, -1; 0, 2, 0; -1, 0, 1)
$
Substituting into the formula from (b) with $phi = beta$:
$
  d^((1))(beta) = I - i cal(J)_y sin beta - cal(J)_y^2 (1 - cos beta)
$
Calculating term by term yields:
$
  d^((1))(beta) = mat(
    frac(1+cos beta, 2), -frac(sin beta, sqrt(2)), frac(1-cos beta, 2);
    frac(sin beta, sqrt(2)), cos beta, -frac(sin beta, sqrt(2));
    frac(1-cos beta, 2), frac(sin beta, sqrt(2)), frac(1+cos beta, 2)
  )
$
#pagebreak()

= 5
#align(left, rect(inset: 8pt)[#image("assets/2025-11-20-23-47-47.png")])


*Objective:* Demonstrate that assuming half-integer orbital angular momentum leads to a contradiction in position space wavefunctions.

*Given:*
- Ladder operators: $L_(plus.minus) = hbar e^(plus.minus i phi) (plus.minus pdv(,theta) + i cot theta pdv(,phi))$.
- Top state assumption: $L_+ Y_(1/2, 1/2) (theta, phi) = 0 => Y_(1/2, 1/2) ~ e^(i phi/2) sqrt(sin theta)$.

== a. Construct $Y_(1/2, -1/2)$ by applying $L_-$
We apply the lowering operator to the top state $f(theta, phi) = e^(i phi/2) sqrt(sin theta)$.
$
  L_- f = hbar e^(-i phi) (- pdv(,theta) + i cot theta pdv(,phi)) (e^(i phi/2) sqrt(sin theta))
$
Calculate the derivatives:
1. $ pdv(,theta) sqrt(sin theta) = 1/2 (sin theta)^(-1/2) cos theta $
2. $ pdv(,phi) e^(i phi/2) = i/2 e^(i phi/2) $

Substitute back:
$
  L_- f &prop e^(-i phi) [ - frac(cos theta, 2 sqrt(sin theta)) + i cot theta (i/2) ] e^(i phi/2) sqrt(sin theta) \
  &= e^(-i phi/2) [ - frac(cos theta, 2 sqrt(sin theta)) - 1/2 frac(cos theta, sin theta) sqrt(sin theta) ] \
  &= e^(-i phi/2) [ - frac(cos theta, 2 sqrt(sin theta)) - frac(cos theta, 2 sqrt(sin theta)) ] = - e^(-i phi/2) frac(cos theta, sqrt(sin theta))
$
Thus, via lowering:
$
  Y_(1/2, -1/2)^((a)) prop e^(-i phi/2) frac(cos theta, sqrt(sin theta))
$

== b. Construct $Y_(1/2, -1/2)$ by using the annihilation condition
Since $m = -1/2$ is the bottom of the ladder for $j=1/2$, we must have $L_- Y_(1/2, -1/2) = 0$.
Let $g(theta, phi) = Theta(theta) e^(-i phi/2)$.
$
  L_- g = hbar e^(-i phi) (- pdv(,theta) + i cot theta pdv(,phi)) Theta(theta) e^(-i phi/2) = 0
$
$
  (- theta'(theta) + i cot theta (-i/2) Theta) = 0 => theta' + 1/2 cot theta Theta = 0
$
Rearranging $frac(d Theta, Theta) = 1/2 frac(cos theta, sin theta) d theta$, integrating gives $ln Theta = 1/2 ln(sin theta)$, so $Theta prop sqrt(sin theta)$.
Thus, via the bottom-rung condition:
$
  Y_(1/2, -1/2)^((b)) prop e^(-i phi/2) sqrt(sin theta)
$

*Conclusion:* The function from (a) diverges at poles $theta = 0, pi$, while (b) vanishes. Since $Y^((a)) eq.not Y^((b))$, half-integer OAM is inconsistent with single-valued position-space wavefunctions.
#pagebreak()

= 6
#align(left, rect(inset: 8pt)[#image("assets/2025-11-20-23-49-37.png")])

*Potential:* $V(r) = -V_0$ for $r < r_0$ and $V(r) = 0$ for $r > r_0$.

== a. Quantization Condition ($l=0$)
Let $u(r) = r R(r)$. The radial equation is $u'' + 2m/hbar^2 (E-V) u = 0$.
- *Region I ($r < r_0$):* $k = sqrt(2m(E+V_0))/hbar$. Solution $u_"in" ~ sin(k r)$.
- *Region II ($r > r_0$):* $kappa = sqrt(-2m E)/hbar$. Solution $u_"out" ~ e^(-kappa r)$.

Matching logarithmic derivative $u'/u$ at $r_0$:
$
  frac(k cos(k r_0), sin(k r_0)) = frac(-kappa e^(-kappa r_0), e^(-kappa r_0)) => k cot(k r_0) = -kappa
$
Inverting the cotangent:
$
  k/kappa = - tan(k r_0)
$

== b. No solutions for shallow wells
Let $xi = k r_0$ and $eta = kappa r_0$.
$
  xi^2 + eta^2 = frac(2m(E+V_0)r_0^2, hbar^2) - frac(2m E r_0^2, hbar^2) = frac(2m V_0 r_0^2, hbar^2) equiv gamma^2
$
The condition is $tan xi = - xi/eta = - xi / sqrt(gamma^2 - xi^2)$.
For a bound state ($E<0$), $kappa > 0$, so RHS is negative. $tan xi$ is negative first in $(pi/2, pi)$.
Threshold condition: The "circle" radius $gamma$ must extend to the asymptote $pi/2$.
$
  gamma >= pi/2 => frac(2m V_0 r_0^2, hbar^2) >= pi^2/4 => V_0 >= frac(pi^2 hbar^2, 8 m r_0^2).
$

== c. Numerical Value
Given $V_0 = frac(9 pi^2 hbar^2, 32 m r_0^2)$, we find $gamma = 3pi/4 approx 2.356$.
We solve $tan xi = -xi/sqrt(gamma^2 - xi^2)$. Using identity $sin^2 xi = tan^2 xi / (1+tan^2 xi) = xi^2/gamma^2$:
$
  sin xi = plus.minus xi/gamma = xi / (3pi\/4)
$
Solving $x = frac(3pi, 4) sin x$ numerically yields $xi approx 2.07$.
The requested value is $kappa r_0 = sqrt(gamma^2 - xi^2) = sqrt((2.356)^2 - (2.07)^2) approx 1.13$.

#pagebreak()

= 7
#align(left, rect(inset: 8pt)[#image("assets/2025-11-20-23-49-58.png")])


== a. Differential Equation
Let $rho = r sqrt(m omega \/ hbar)$. With $E = hbar omega epsilon$, substitute $u(rho) = e^(-rho^2/2) v(rho)$:
$
  -[ v'' - 2rho v' + (rho^2 - 1)v ] + [ frac(l(l+1), rho^2) + rho^2 - 2 epsilon ] e^(-rho^2/2) v = 0
$
Simplifying (the $rho^2$ terms cancel):
$
  v'' - 2rho v' + [ 2 epsilon - 1 - frac(l(l+1), rho^2) ] v = 0
$

== b. Series Solution and Energy
Ansatz: $v(rho) = rho^(l+1) sum_(k=0)^infinity c_k rho^(2k)$.
Recurrence relation for term $rho^j$:
$
  c_(j+2) [(j+2)(j+1) - l(l+1)] = c_j [ 2j - (2 epsilon - 1) ]
$
Termination at $j_"max" = l + 1 + 2n_r$ => $2(l+1+2n_r) - (2 epsilon - 1) = 0$.
$
  2 epsilon = 2(2n_r + l) + 3 => E_n = (n + 3/2) hbar omega, quad (n = 2n_r + l)
$

== c. Explicit States ($n=0, n=1$)
1. *Ground State ($n=0$):* $n_r=0, l=0$.
   $ psi_(000)^("sph") = (frac(m omega, pi hbar))^(3/4) e^(-m omega r^2 \/ 2 hbar) = psi_(000)^("cart") $

2. *First Excited State ($n=1$):* Degeneracy 3.
   - *Cartesian Basis:* $ ket(100) prop x e^(-r^2/2), ket(010) prop y e^(-r^2/2), ket(001) prop z e^(-r^2/2) $
   - *Spherical Basis:* $Y_(10) prop z/r$, $Y_(1 plus.minus 1) prop (x plus.minus i y)/r$.
     - $ ket(110) = ket(001)_("cart") $
     - $ ket(111) = -1/sqrt(2) (ket(100) + i ket(010))_("cart") $
     - $ ket(11-1) = 1/sqrt(2) (ket(100) - i ket(010))_("cart") $

   *Transformation Matrix:*
   $
     mat(ket(111); ket(110); ket(11-1))_("sph") = mat(
       -1/sqrt(2), -i/sqrt(2), 0;
       0, 0, 1;
       1/sqrt(2), -i/sqrt(2), 0
     ) mat(ket(100); ket(010); ket(001))_("cart")
   $