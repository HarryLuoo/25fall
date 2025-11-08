#set math.equation(numbering: "(1)")
#set text(
font: "Palatino Linotype",size: 11pt)
#set page(margin: (x: 1cm, y: 1cm), numbering: "1/1")
#import "@preview/physica:0.9.6": *
#place(top + right, rect(inset: 3pt)[phys 406| Harry Luo
])
= 1
#align(
  left,
  rect(inset: 8pt)[Solve the non-linear KdV equation$ 
  u_t + 6 u u_x + u_(x x x) = 0 
  $ using d'Alembert's principle substitution ; find a particular single-parametric
solution.
  ]
)
Consider a moving frame ansatz of $u(x,t) = U(xi) = U(x-c t),$ where $xi := x - c t$. The derivatives become$ 
cases(u_t = - c U'(xi), u_x = U'(xi), u_(x x x) = U'''(xi)) 
$ 
The PDE then reads $ 
- c U' + 3 U U' + U''' = 0 .
$ 
Integrating once with respect to $xi$ gives$ 
- c U' + 6 U U' + U'' = A 
$ 
for some integration constant $A.$ Localized wave solution require that $U, U', U''$ vanish as $|xi| =infinity,$ so we set $A = 0.$ Rearranging gives $ 
U'' = c U - 3 U^2  
$ 
which can be muultipled by $U'$ and integrated again with inverse product law to give$ 
1/2 (U')^2 = c/2 U^2  - U^3 +B. 
$ 
Again, localized wave solutions require $B = 0.$ Thus, we have$ 
U'^2 = c U^2 - 2 U^3 = U^2 (c - 2 U).  
$ 
Separating variables and integrating gives$ 
U(xi) = c/2 sech^2 (sqrt(c)/2 (xi - xi_0)) 
$ which in original variables is $ 
u(x,t) = c/2 sech^2 (sqrt(c)/2 [ x - c t - x_0] ), quad c>0 .
$ This is a solitary wave solution of the KdV equation traveling at parametrized speed $c$.

#pagebreak()
= 2 
#align(
  left,
  rect(inset: 8pt)[Consider the non linear Liouville equation $ 
  u_(t t) - u_(x x) = g exp(u), quad g > 0. 
  $ Using the d'Alambert principle substitution find a particular single-parametric
solution of this equation
  ]
)
Consider a moving frame ansatz of $u(x,t) = U(xi) = U(x-c t),$ where $xi := x - c t$. The derivatives become$ 
cases(u_(t t) = c^2 U''(xi), u_(x x) = U''(xi)) 
$ 
The PDE then reads $ 
c^2 U'' - U'' = g exp(U) =>
(c^2 - 1) U'' = g exp(U) . 
$ 
Multiplying by $U'$ and integrating once with respect to $xi$ gives$ 
(c^2 - 1)/2 (U')^2 = g exp(U) + C 
$ 
for some integration constant $C.$ For a particular explicit solution, set $C = 0.$ Thus,$ 
(U')^2 = (2 g)/(c^2 - 1) exp(U) . 
$ 
Assuming $(g)/(c^2 - 1) > 0$ for real solutions, we have$ 
U' = plus.minus  sqrt((2 g)/(c^2 - 1)) exp(U/2) . 
$ 
Separating variables (taking the negative branch for illustration) and integrating gives$ 
-2 exp(-U/2) = - sqrt((2 g)/(c^2 - 1)) (xi - xi_0) , 
$ 
so$ 
exp(-U/2) = (1)/2 sqrt((2 g)/(c^2 - 1)) (xi - xi_0) . 
$ 
Solving for $U$ yields$ 
U(xi) = -2 ln [ (1)/2 sqrt((2 g)/(c^2 - 1)) (xi - xi_0) ] 
$ 
which in original variables is $ 
u(x,t) = -2 ln [ alpha (x - c t - x_0) ] , quad alpha = (1)/2 sqrt((2 g)/(c^2 - 1)) , 
$ 
with $c^2 > 1$ if $g > 0$. This is a singular (logarithmic blow-up) traveling wave solution of the equation traveling at parametrized speed $c$.

#pagebreak()
= 3
#align(
  left,
  rect(inset: 8pt)[Solve the non-linear Schrodinger equation$ 
  i psi_t psi_(x x) - omega_0 psi + g psi abs(psi)^2 =0, quad g>0 
  $ 
  ]
)
Consider a separable ansatz of $psi(x,t) = A(x) exp(i Psi(t))$. The derivatives become$
cases(
  psi_t = i dot(Psi) A exp(i Psi),
  psi_(x x) = A'' exp(i Psi)
)
$ 
Substitute into the equation$ 
i (i dot(Psi) A exp(i Psi)) - A'' exp(i Psi) - omega_0 A exp(i Psi) + g A^3 exp(i Psi) = 0
$
Dividing by $exp(i Psi)$ gives$ 
- dot(Psi) A - A'' - omega_0 A + g A^3 = 0
$ 
Rearranging yields$ 
A'' = g A^3 - (omega_0 + dot(Psi)) A
$ 
For separation of variables, set $omega_0 + dot(Psi) = mu$ (constant), so $dot(Psi) = mu - omega_0$ and$ 
A'' = g A^3 - mu A
$ 
Multiply by $A'$ and integrate once$ 
1/2 (A')^2 = g/4 A^4 - mu/2 A^2 + C
$ 
For a dark soliton solution with $A(x) -> ±sqrt(mu/g)$ as $|x| -> infinity$, set $C = mu^2/(4g)$ so that $A' = 0$ at the asymptotic value. This gives$ 
(A')^2 = g/2 A^4 - mu A^2 + mu^2/(2g) = (g/2)(A^2 - mu/g)^2
$ 
Taking square roots and separating variables$ 
integral d A / (A^2 - mu/g) = ± sqrt(g/2) integral d x
$ 
Integrating yields$ 
1/(2 sqrt(mu/g)) ln |(A - sqrt(mu/g))/(A + sqrt(mu/g))| = ± sqrt(g/2) (x - x_0)
$ 
Solving for $A(x)$ with appropriate boundary conditions gives$ 
A(x) = sqrt(mu/g) tanh(sqrt(mu/2) (x - x_0))
$ 
Thus the particular solution is$ 
psi(x,t) = sqrt(mu/g) tanh(sqrt(mu/2) (x - x_0)) exp(i(mu - omega_0)t), quad mu > 0
$ 
This is a single-parametric dark soliton solution of the defocusing NLS equation with parameter $mu$.

#pagebreak()
= 4
#align(
  left,
  rect(inset: 8pt)[Solve the Klein Gorden equation $ 
  u_(t t) - u_(x x) - u + u^3 = 0, 
  $ using d'Alembert's principle substitution ; find a particular single-parametric solution.
   ]
)
Consider a moving frame ansatz of $u(x,t) = U(xi) = U(x - c t),$ where $xi := x - c t$. The derivatives become$ 
cases(u_(t t) = c^2 U''(xi), u_(x x) = U''(xi)) 
$ 
The PDE then reads $ 
c^2 U'' - U'' - U + U^3 = 0 => quad
(c^2 - 1) U'' = U - U^3 . 
$ 
Multiplying by $U'$ and integrating once with respect to $xi$ gives$ 
 (c^2 - 1)/2 (U')^2 -  (1)/2 U^2 +  (1)/4 U^4 = C 
$ 
for some integration constant $C.$ For a particular heteroclinic (kink) solution connecting $U(plus.minus infinity) = plus.minus  1$ with $U'(plus.minus  infinity)=0$, we impose such boundary conditiion to find $C$:  $ 
C = -frac(1,2) dot 1 + frac(1,4) dot 1 = -frac(1,4).
$ 
 Thus,$ 
(U')^2 =  ( (1 - U^2)^2 ) / ( 2 (1 - c^2) ) , 
$ 
requiring $|c| < 1$ for real solutions. Separating variables gives$ 
 ( d U ) / (1 - U^2) = plus.minus   ( d xi ) / sqrt( 2 (1 - c^2) ) . 
$ 
Integrating yields$ 
 (1)/2 ln |  (1 + U)/(1 - U) | = plus.minus   ( xi - xi_0 ) / sqrt( 2 (1 - c^2) ) , 
$ 
so$ 
U(xi) = tanh (  ( xi - xi_0 ) / sqrt( 2 (1 - c^2) ) ) . 
$ 
In original variables,$ 
u(x,t) = tanh (  ( x - c t - x_0 ) / sqrt( 2 (1 - c^2) ) ) , quad |c| < 1 , 
$ 
a single-parameter kink soliton traveling at speed $c$ with asymptotics $plus.minus  1$.

#pagebreak()
= 5
#align(
  left,
  rect(inset: 8pt)[#image("assets/2025-11-02-22-08-16.png")]
)
This problem is_ impossible_ to solve in its original statement, and we will show that by leading to a contradiction.

With the subsitution $xi = x - V t,$ write derivatives against $xi$ with prime,  the original coupled equations become $ 
l^2 theta'' - [1+l^2 phi'^2 ]sin theta cos theta + V/omega phi' = 0 $ <eq.1>
$ 
l^2  (sin^2(theta) phi')' + V/omega theta' = 0 
$ <eq.2>
We can first integrate @eq.2 w.r.t. $xi$ to get $phi'(xi)$.
$ 
integral l^2 (sin^2 (theta ) phi') dif xi + integral V/omega dif xi = l^2  sin^2 (theta)phi' + V/omega theta + C = 0 
$ Boundary conditions at infinity is $theta(xi)-> 0$ as $xi ->infinity$. This implies $C = 0$. Thus, we can separate for $phi'$ as$ 
phi' = -V/(omega l^2 ) frac(theta , sin^2 (theta))  .
$ 
Let $a equiv frac(V^2  , omega^2 l^2 ) $, substute above into @eq.1 gives$ 
 l^2  theta'' - sin theta  cos theta - a(frac(theta^2  cos theta , sin^3 theta ) + frac(theta , sin^2 theta) )=0
$ 
Multiplying by $theta'$ to make it into a form so that we can use the fact $ 
(dif )/(dif xi) (l^2/2 theta'^2 ) = l^2  theta'' theta, quad (dif )/(dif xi) (-1/2 sin^2 theta) = -sin theta cos theta med theta' ,
$ we find that $ 
(dif )/(dif xi) (l^2 /2 theta'^2 ) + (dif )/(dif xi) (-1/2 sin^2 theta) = a theta'(frac(theta^2  cos theta , sin^3 theta ) + frac(theta , sin^2 theta) ).
$ Define $ 
E = l^2 /2 theta '^2  - 1/2 sin^2 theta , 
$<eq.E> we have then$ 
E' = a theta'  (frac(theta^2  cos theta , sin^3 theta ) + frac(theta , sin^2 theta) ).
$ We can deduce to a contradiction by studying the small angle limit $theta -> 0$. In this limit, $ 
E' ~ a theta ' (theta ^2 /theta ^3 + theta /theta ^2 ) = 2 a theta' / theta  .
$ 
Without loss of generality, consider a decay rate $theta'\/theta = kappa <0$ as $xi -> infinity$. Then, $ 
E' ~ 2 a kappa <0 quad (xi-> infinity)
$ so that in this limit $E -> -infinity$. 

However, the definition @eq.E is constrained by the boundary condition $ 
theta(xi) ->0,quad  theta'(xi)->0 quad "as"  xi -> infinity
$ and thus $E -> 0$ as $xi -> infinity$. This is a_ contradiction_, so no such solution exists for the original problem beyond the trivial solution $theta(xi) = 0, phi(xi) = "const"$.

One can infer that a sign error in the original problem statement is likely. In fact, had we changed the sign in @eq.2 to be the following $ 
 l^2  (sin^2(theta) phi')' - V/omega theta' = 0 ,
$ the contradiction would be resolved and a nontrivial solution would exist. However that is beyond my scope in terms of this homework, as I have already demonstrated the impossibility of the original problem as stated.


 

 


 
 
  