#set math.equation(numbering: "(1)")
#set text(font: "Palatino Linotype", size: 11pt)
#set page(margin: (x: 1cm, y: 1cm), numbering: "1/1")
#import "@preview/physica:0.9.6": *
#import "@preview/wrap-it:0.1.1": wrap-content

// Header placement
#place(top + right, rect(inset: 3pt)[Assignment \#7 Solutions
])

= 1
#align(left, rect(inset: 8pt)[Unitary Unimodular Matrices])

*Given:* $ U = frac(a_0 + i bold(sigma) dot bold(a), a_0 - i bold(sigma) dot bold(a)) $
where $a_0$ is real and $bold(a)$ is a real vector.

== a. Unitarity and Unimodularity

*Unitarity ($U^dagger U = 1$):* \
Let $N = a_0 + i bold(sigma) dot bold(a)$. The denominator is $a_0 - i bold(sigma) dot bold(a) = N^dagger$ (since $bold(sigma)$ is Hermitian and scalars are real). Because $N$ and $N^dagger$ commute, we write $U = N (N^dagger)^(-1)$.
$
  U^dagger = (N (N^dagger)^(-1))^dagger = (N^dagger)^(-1 dagger) N^dagger = N^(-1) N^dagger
$
$
  U U^dagger = N (N^dagger)^(-1) N^(-1) N^dagger = N N^(-1) (N^dagger)^(-1) N^dagger = 1 dot 1 = 1.
$

*Unimodularity ($det U = 1$):* \
Using the identity $det(c I + bold(sigma) dot bold(v)) = c^2 + abs(bold(v))^2$ (where $abs(bold(v))^2 = bold(v) dot bold(v)$ for complex vectors, here just $a^2$):
$
  det U = frac(det(a_0 + i bold(sigma) dot bold(a)), det(a_0 - i bold(sigma) dot bold(a))) = frac(a_0^2 + abs(bold(a))^2, a_0^2 + abs(bold(a))^2) = 1.
$

== b. Axis $hat(n)$ and Angle $theta$
We convert $U$ to standard form $cos(theta/2) - i (bold(sigma) dot hat(n)) sin(theta/2)$. Multiply numerator and denominator by $N = a_0 + i bold(sigma) dot bold(a)$:
$
  U = frac((a_0 + i bold(sigma) dot bold(a))^2, a_0^2 + bold(a)^2) = frac(a_0^2 - bold(a)^2 + 2i a_0 (bold(sigma) dot bold(a)), a_0^2 + bold(a)^2)
$
Separating real and imaginary parts:
$
  U = underbracket(frac(a_0^2 - bold(a)^2, a_0^2 + bold(a)^2), cos(theta\/2)) + i (bold(sigma) dot bold(a)) frac(2 a_0, a_0^2 + bold(a)^2)
$
Matching the imaginary part $- i (bold(sigma) dot hat(n)) sin(theta/2)$:
$
  hat(n) = - frac(bold(a), abs(bold(a))), quad sin(theta/2) = frac(2 a_0 abs(bold(a)), a_0^2 + bold(a)^2).
$
Thus, $theta = 2 arccos(frac(a_0^2 - bold(a)^2, a_0^2 + bold(a)^2))$.

= 2
#align(left, rect(inset: 8pt)[Euler Rotations])

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
  theta = 2 arccos(cos(beta/2) cos(frac(alpha+gamma, 2)))
$

#pagebreak()

= 3
#align(left, rect(inset: 8pt)[Operator Eigenfunctions])

*Objective:* Show $ket(psi) = e^(-i J_z phi \/ hbar) e^(-i J_y theta \/ hbar) ket(j\, m)$ is an eigenstate of $hat(O) = J_x cos phi sin theta + J_y sin phi sin theta + J_z cos theta$ with eigenvalue $m hbar$.

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

= 4
#align(left, rect(inset: 8pt)[Angular Momentum Matrices (j=1)])

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
  D = 1 - i cal(J) (phi - phi^3/3! + ...) - cal(J)^2 (phi^2/2! - phi^4/4! + ...) \
  D = 1 - i cal(J) sin phi - cal(J)^2 (1 - cos phi)
$

== c. Matrix for $beta$ rotation ($hat(n) = hat(y)$)
We use $cal(J)_y = frac(1, sqrt(2)) mat(0, -i, 0; i, 0, -i; 0, i, 0)$.
$
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