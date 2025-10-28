#set math.equation(numbering: "(1)")
#set text(
font: "Palatino Linotype",size: 11pt)
#set page(margin: (x: 0.5cm, y: 1cm), numbering: "1/1")
#import "@preview/physica:0.9.6": *
#import "@preview/wrap-it:0.1.1": wrap-content
#place(top + right, rect(inset: 3pt)[physics 731 hw 5| Harry Luo
])

= P1 
#align(
  left,
  rect(inset: 8pt)[#image("assets/2025-10-26-11-15-03.png")]
)
=== a. 
In momentum space, $phi_E (p)$ satisfy the schrodinger equation $ 
(p^2 + i hbar F (dif )/(dif p) )phi_E (p) = E phi_E (p) \ => 
i hbar F dv(phi_E,p) = ( E - p^2 /(2m)) phi_E \ => phi_E (p) = N exp(  i/(hbar F) ( E p - p^3 /(6m)) ) 
. $ 
and the time evolution operator is $ 
U(t,0) &= e^(- i H t slash hbar ) = integral e^(- i E t slash hbar) ketbra(E) dif E 
$ 
 
$
 braket(p, U(t, 0), p') &= integral  dif E e^(- i E t slash hbar) braket(p, E) braket(E, p') \ 
 & = integral e^(- i E t slash hbar) phi_E (p) phi^*_E (p) dif E \ 
& = N^2 integral e^(- i E t slash hbar) exp[i/(hbar F)(E p - p^3/(6m))]exp[-i/(hbar F)(E p' - p'^3/(6m))] dif E \ 
& = N^2  exp[frac(i , 6 m hbar F) (p'^3 - p^3)] integral_(-infinity)^(infinity)  dif E exp[frac(i E , hbar F) (p - p' - F t)]
$ 
Using the fourier transform identity $ integral_(-infinity)^(infinity) e^(i k x)  dif x = 2 pi delta(x)$, we have $ 
 braket(p ,U(t,0), p') = N^2 exp[frac(i (p'^3 - p^3) , 6 hbar m F) ]2 pi hbar F delta(p - p' - F t) .
$ 
Normalization reqires $N^2  = 1/(2 pi hbar F)$, so we have $ 
#rect(inset: 8pt)[
$ display( braket(p , U(t,0), p') = exp[frac(i (p'^3 - p^3) , 6 hbar m F) ] delta(p - p' - F t) .)$
]

$ 
=== b.
The propagator $ 
K(x,t; x', 0) = braket(x, U(t,0), x') = integral braket(x,p) braket(p, U, p') braket(p', x') dif p dif p' 
$ 
Using $ braket(x,p) = 1/sqrt(2 pi hbar) e^(i p x slash hbar)$, we have $ 
K &= integral 1/(2 pi hbar) e^(i p x slash hbar) exp[i/(6 m hbar F) (p'^3 - p^3)] delta(p - p' - F t) e^(- i p' x' / hbar)  dif p dif p' \ 
& = 1/(2 pi hbar) integral  dif p exp[ i / hbar (p x - (p - F t) x') ] exp[ i/(6 m hbar F) ((p - F t)^3 - p^3)] \ 
& = 1/(2 pi hbar ) exp[i/hbar (F t x' - (F^2 t^3) /(6 m))] integral_(-infinity)^(infinity)  dif p exp[i/ hbar (-t/(2m) p^2 + (x-x' + (F t^2 )/(2 m))p)]
$ taking subsitution $u = x - x' +frac(F t^2  , 2 m)$: $ 
K &= frac(m , 2 pi i hbar t)^(1/2) exp[i/hbar (F t x' - frac(F^2  t^3  , 6 m ) )]exp[i/hbar frac(m u^2  , 2 t) ]  \ 
& 
#rect(inset: 8pt)[
$ display(= (m/(2 pi i hbar t))^(1/2) exp[ i/hbar ( m/(2 t)(x - x')^2 + 1/2F t(x + x') - (F^2 t^3)/(24 m) ) ] ,)$
]

$ as desired.

 



#pagebreak()
= P2 #align(
  left,
  rect(inset: 8pt)[#image("assets/2025-10-26-11-51-49.png")]
)
The propagated state is given as $ 
psi(x,t) = integral K(x, t; x', 0) psi(x,0) dif x', 
$ 

where $
psi(x,0) = 1/(pi^(1 slash 4) sqrt(d)) exp[ - ( x - a)^2  slash (2 d^2 )] 
$ 
and $ 
K(x,t; x',0) = [frac(m omega , 2 pi i hbar sin omega t) ]^(1 slash 2)exp[frac(i m omega[(x^2 + x'^2 )] cos omega t- 2 x x', 2 hbar sin omega t) ]. 
$ 

All we need to do is to _simply_ carry out the gaussian integral:$ 
psi(x,t) = frac(1 , pi^(1/4)sqrt(d) ) (frac(m omega , 2 pi i hbar sin omega t) )^(1 slash 2) integral_(-infinity)^(infinity) e^(I)  dif x' 
$ 
where $ 
I equiv frac(i m omega [ (x^2  + x'^2 )cos omega t - 2 x x'] ,2 hbar sin omega t ) - frac( (x' - a)^2  , 2 d^2 ) .  
$ 
We take the following subsitutions$ 
A = 1/(2 d^2 ) - frac(i m omega cot omega t , 2 hbar) , quad B = q/d^2  - frac(i m omega x , hbar sin omega t) , quad C = frac( i m omega x^2  cos omega t , 2 hbar sin omega t) - a^2 /(2 d^2 ), 
$ 
to write $I$ in the form of $ 
I = - A x'^2 + B x' + C 
$ 
and so the gaussian integral term becomes $ 
integral_(-infinity)^(infinity) e^I  dif x' =integral exp[- A x'^2 + B x' + C] dif x' = e^C integral exp[-A x'^2 + B x'] dif x' =  sqrt(pi/ A) exp(B^2 /(4 A)+C) .   
$ 
The wavefunction is retrieved: $ 
psi(x,t) = 1/(pi^(1/4)sqrt(d) )(frac(m omega , 2 i hbar A sin omega t) )^(1/2) exp(B^2 /(4 A)+C) . 
$ Expanding out $A, B, C$, we have the desired result (which is algebraicly simplified via #smallcaps("Mathematica")):


$ 
#rect(inset: 8pt)[
$ display(psi&(x, t) = \ & 1/(pi^(1 \/4) sqrt(d)) [cos omega t + i planck.reduce/(m omega d^2) sin omega t]^(-1 \/2)exp [ (i m omega x^2)/(2 planck.reduce tan omega t) - (i m omega x a)/(planck.reduce sin omega t) + (i m omega a^2)/(2 planck.reduce tan omega t)]exp [ - (((m omega x)/(planck.reduce sin omega t) - (a m omega)/(planck.reduce tan omega t))^2)/(2(1/(d^2) - (i m omega)/(planck.reduce tan omega t)))] .)$
]

 
$ 
The probability density is found by $abs(psi(x,t))^2 = psi(x,t) dot psi^* (x,t)$. The overall phase factors (first exp) contribute nothing to the magnitude. The prefactor's modulus is
$ 
1 \/sqrt(cos^2 omega t +(planck.reduce/(m omega d^2))^2 sin^2 omega t) 
$ 

and the second exp's real part (after expanding the quadratic) gives the Gaussian form centered at $x = a cos omega t$ 

with effective width $d^2 [cos^2 omega t +(planck.reduce/(m omega d^2))^2 sin^2 omega t]$ , yielding
 $ 

#rect(inset: 8pt)[
$ display(|psi(x, t)|^2= 1/(sqrt(pi) thin d) thin 1/((cos^2 omega t +(frac(planck.reduce, m omega d^2))^2 sin^2 omega t)^(1 \/2))exp [ - ((x - a cos omega t)^2)/(d^2 (cos^2 omega t +(frac(planck.reduce, m omega d^2))^2 sin^2 omega t))],)$
]

 
$ 
 
exactly as desired.


#pagebreak()
= P3 
#align(
  left,
  rect(inset: 8pt)[#image("assets/2025-10-26-13-55-08.png", width: 80%)]
)
We rewrite $braket(k_1,k_1')$ by inserting the identity: $ 
braket(k_1,k_1')= integral braket(k_1,x) braket(x,k'_1)  dif x = integral psi^*_(k_1) (x) psi_(k'_1) (x) dif  x
$ 
The step potential kills cross terms, so $ 
braket(k_1,k'_1)& =\ &1/(2pi) [overbrace(
  integral_(-infinity)^(0) (e^(-i k_1 x) + frac(k_1-k_2 , k_1+k_2) e^(i k_1 x) )(e^(i k'_1 x)+ frac(k'_1 -k'_2 , k'_1 + k'_2)e^(- i k'_1 x)  ) dif x,I_1)
 + underbrace(integral_(0)^(infinity) (frac(2 k_1 , k_1+k_2) e^(-i k_2 x) )(frac(2 k'_1 , k'_1 + k'_2) e^(i k'_2 x) ) dif x,I_2)
]
$ 

We evaluate $I_1, I_2$ separately. But first denote $r = frac(k_1-k_2 , k_1+k_2), t = frac(2 k_1 , k_1+k_2).  $  $ 
I_1 &= integral_(-infinity)^(0)  (e^(-i k_1 x)+ r e^(i k_1 x)) (e^(i k'_1 x) + r' e^(-i k'_1 x) ) dif x \ 
& =  integral_(0)^(infinity) e^(i(k_1 - k'_1) x) + r e^(-i(k_1 + k'_1) x) + r' e^(i(k_1 + k'_1) x) + r r' e^(-i(k_1 - k'_1) x) dif x
$ 

Since $E>V_0$,  $k_1>0$ and so all $delta(k_1+k'_1) = 0$. This gives $ 
I_1 = pi(1 + r r') delta(k_1 - k'_1) + (1 - r r') frac(i , k_1 - k'_1)  .
$ 
$I_2$ is more direct: 
$ 
I_2 =  integral_(0)^(infinity) t ( e^(- i k_2 x) )(t' e^(i k'_2 x) ) dif(x)  = t t' integral_(0)^(infinity) e^(- i (k_2 - k'_2)x)  dif x = t t' (pi delta(k_2 - k'_2) - frac(i  , k_2 - k'_2)  
$ 

We can combine $I_1+I_2$, but first notice that $ 
delta(k_2 - k'_2) = k_2/k_1 delta(k_1 - k'_1); quad k_2 - k'_2 = k_1/ k_2 (k_1 - k'_1) 
$ then $ 
I_1 + I_2 = 1/(2 pi) [ pi(1 + r r' + t t' k_2/k_1) delta(k_1-k'_1)
+ (1 - r r' - t t' k_2/k_1 frac(i , k_1 - k'_1) )
] 
$ 
Further, since $t = 1_r quad => r r' + t t' k_2/k_1 = 1$, so we arrive at $braket(k_1,k'_1)= delta(k_1-k'_1)  .
$ 
 
 


#pagebreak()
= P4 
#align(
  left,
  rect(inset: 8pt)[#image("assets/2025-10-27-09-09-01.png")]
)

== 1. $E > V_0$ 
#wrap-content(image("assets/2025-10-27-14-43-46.png"),"Consider"+$ E >V_0$+" first.  We take the following ansatz for wavefunction in each region:"+$
psi(x) = cases(e^(i k x) + r e^(- i k x) quad &"I", C e^(i q x ) + D e^(-i q x) quad &"II", t e^(i k x) quad &"III"    )
$+"where "+$k = sqrt(2 m E) slash  hbar $+" and "+ $q = sqrt(2 m (E - V_0)) slash hbar$  )

Matching the boundary conditions and cotinuity at $x = 0, a$: $ 
x=0 : quad cases(1+r = C+D, k(1-r) = q(C-D)) => vec(C,D) = 1/2 display(mat(1+k/q, 1-k/q; 1-k/q, 1+k/q)) vec(1,r)
$ <eq.5.1>
$ 
x=a: quad C e^(i q a) + D e^(-i q a) = t e^(i k a) => vec(C e^(i q a) , D e^(-i q a) )= frac(t e^(i k a)  , 2) vec(1+k/q, 1-k/q) .
$ 
We multiply @eq.5.1 by $diag(e^(i q a) , D e^(i q a) )$ and we can equate the two boudary conditions to get $ 
1/2  display(mat(e^(i q a) (1+k/q), e^(i q a) (1-k/q); e^(- i q a) (1-k/q), e^(- i q a) (1+k/q)) vec(1, r)) = frac(t e^(i k a)  , 2) vec(1+k/q, 1-k/q) . 
$ 
Expanding this matrix equaiton, rearranging the terms, we have 
$ 
e^(i q a) (1 + k/q) + e^(i q a) (1 - k/q) r
= t e^(i k a) (1 + k/q) ; 
\ e^(-i q a)(1 - k/q) + e^(-i q a)(1 + k/q) r
= t e^(i k a)(1 - k/q) .
$ 

From which we can solve for the transmission amplitude $t$ as $ 
t = display((e^(-i k a)))/display((cos(q a) - i (k^2 + q^2)/(2 k q) sin(q a)) )
$
Similarly, we can solve for the reflection amplitude $r$ as
$
r = display((-i (k^2 - q^2)/(2 k q) sin(q a)))/display((cos(q a) - i (k^2 + q^2)/(2 k q) sin(q a)) )
$
and the transmission and reflection coefficients $T$ and $R$ as
$
T =|t|^2 = 1/(cos^2 (q a) +((k^2 + q^2)/(2 k q))^2 sin^2 (q a))
$
$
R = |r|^2 = (((k^2 - q^2)/(2 k q))^2 sin^2(q a))/(cos^2 (q a) +((k^2 + q^2)/(2 k q))^2 sin^2 (q a))
$
We can easily verify (using #smallcaps("Mathematica") or otherwise) that $T + R = 1$ as required by probability conservation.

#line(length: 100%) ///////////////////////////
== 2. $E < V_0$
Now take $E < V_0$. In Region II the solution is evanescent, so we use
$
psi(x) = cases(e^(i k x) + r e^(- i k x) quad &"I",
               C e^(kappa x ) + D e^(-kappa x) quad &"II",
               t e^(i k x) quad &"III")
$
with $k = sqrt(2 m E) slash hbar$ and $kappa = sqrt(2 m (V_0 - E)) slash hbar$.

Matching the boundary conditions and continuity at $x=0,a$:
$
x=0 : quad cases(1+r = C+D, quad i k(1-r) = kappa(C-D))
      => vec(C,D) = 1/2 display(mat(1 - i k/kappa, 1 + i k/kappa;
                                    1 + i k/kappa, 1 - i k/kappa)) vec(1,r)
$ <eq.6.1>
$
x=a : quad C e^(kappa a) + D e^(-kappa a) = t e^(i k a)
      => vec(C e^(kappa a), D e^(-kappa a)) = frac(t e^(i k a), 2) vec(1 - i k/kappa, 1 + i k/kappa).
$

Multiply @eq.6.1 by $diag(e^(kappa a), e^(-kappa a))$ and equate the two boundary relations to get
$
1/2 display(mat(e^(kappa a) (1 - i k/kappa), e^(kappa a) (1 + i k/kappa);
                 e^(-kappa a) (1 + i k/kappa), e^(-kappa a) (1 - i k/kappa)) vec(1, r))
= frac(t e^(i k a), 2) vec(1 - i k/kappa, 1 + i k/kappa).
$

Expanding the matrix equation and rearranging to isolate $t$ and $r$ yields
$
e^(kappa a)(1 - i k/kappa) + e^(kappa a)(1 + i k/kappa) r = t e^(i k a)(1 - i k/kappa),
$
$
e^(-kappa a)(1 + i k/kappa) + e^(-kappa a)(1 - i k/kappa) r = t e^(i k a)(1 + i k/kappa).
$

From these, the transmission amplitude is
$
t = display((e^(-i k a)))/display((cosh(kappa a) - i (k^2 - kappa^2)/(2 k kappa) sinh(kappa a))).
$
Also, the reflection amplitude is
$
r = display((-i (k^2 + kappa^2)/(2 k kappa) sinh(kappa a)))/display((cosh(kappa a) - i (k^2 - kappa^2)/(2 k kappa) sinh(kappa a))).
$

Therefore the transmission and reflection coefficients are
$
T = |t|^2 = 1/(cosh^2(kappa a) + ((k^2 - kappa^2)/(2 k kappa))^2 sinh^2(kappa a))
         = 1/(1 + ((k^2 + kappa^2)^2/(4 k^2 kappa^2)) sinh^2(kappa a)),
$
$
R = |r|^2 = (((k^2 + kappa^2)/(2 k kappa))^2 sinh^2(kappa a))/
            (cosh^2(kappa a) + ((k^2 - kappa^2)/(2 k kappa))^2 sinh^2(kappa a))
          = (((k^2 + kappa^2)^2/(4 k^2 kappa^2)) sinh^2(kappa a))/
            (1 + ((k^2 + kappa^2)^2/(4 k^2 kappa^2)) sinh^2(kappa a)).
$

As a check, one verifies $T + R = 1$,as expected.








#pagebreak()
= P5
#align(
  left,
  rect(inset: 8pt)[Consider the spin precession problem with Hamiltonina $ 
  H = - frac(e B , m c) S_z equiv omega S_z .
  $ Write Heisenberg equations of motino for the time dependent operators $S_x (t), S_y (t), S_z (t)$, and solve them to find $S_x (t), S_y (t), S_z (t)$ as functions of time. 
  ]
)
Since the opservables has no explicit time dependence, we have, for some observable $A,$  $ 
 dot(A) = 1/(i hbar) [A, H]
$ 
So $ 
dot(S_x) = i/(i hbar) [S_x, omega S_z] = omega/(i hbar) [S_x, S_z] = - omega S_y, \ 
dot(S_y)= 1/(i hbar) [S_y, omega S_x] = omega S_x,\ 
dot(S_z) = omega/(i hbar) [S_z, S_z]  = 0. 
$ 
We can immediately read off that $ S_z (t) = S_z (0).$ To solve for $ S_x (t)$ (and $ S_y (t)),$ we take another time derivative on $dot(S_y)$ (or $dot (S_x)$ )  to get $ 
dot.double(S_x) = - omega^2 S_x; quad dot.double(S_y) = - omega^2  S_y 
$ 
which are solved to be $ 
S_x (t) = c_1 cos omega t + c_2 sin omega t, \ S_y (t) = c_3 cos omega t + c_4 sin omega t. 
$ 
Admitting initial conditons of $ 
S_x (0) = c_1, quad dot(S_x (0))= c_2 omega = - omega S_y (0); \  
S_y (0) = c_3, quad dot(S_y (0)) = c_4 omega = omega S_x (0),
$ 
we will have the solutions as $ 

#rect(inset: 8pt)[
$ display(S_x (t) = S_x (0) cos omega t - S_y (0) sin omega t\, \ S_y (t) = S_y (0)cos omega t + S_x (0) sin omega t. )$
]

$ 

#pagebreak()
= P6
#align(
  left,
  rect(inset: 8pt)[Let $x(t)$ be the coordinate operator for a free particle in one dimension in the Heisenberg picture. Evaluate $ 
  [x(t), x(0)]. 
  $ 
   ]
)
For a free particle in 1D, the Hamiltonian is $ H = p^2 /(2m).$ Since $p$ commutes with $H$, we have $ 
dot(p) = 1/(i hbar) [p, H] = 0. 
$ 
While $ 
dot(x) = 1/(i hbar) [x, H] = 1/(i hbar) [x, p^2 /(2m)]= 1/(i hbar) 1/(2m) i hbar (diff p^2 )/(diff p) = p/m = p(0)/m ,
$ 
where we used the fact that $[x, F(arrow(p))] = i hbar partial_p F.$ 

Therefore we have the solution for $x(t)$ as $ 
x(t) = x(0) + frac(p(0) , m)t,  
$ 
which mirrors the classical trajectory of a free particle in uniform motion. 

We can then evaluate the commutator as $ 
[x(t), x(0)] = [x(0)+frac(p(0) ,m )t, med x(0) ] = 1/m [p(0)t, x(0)] =
#rect(inset: 8pt)[
$ display( - (i hbar) / m t)$
]

$ 
