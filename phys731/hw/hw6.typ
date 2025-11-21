#set math.equation(numbering: "(1)")
#set text(font: "Palatino Linotype", size: 11pt)
#set page(margin: (x: 1cm, y: 1cm), numbering: "1/1")
#import "@preview/physica:0.9.6": *
#import "@preview/wrap-it:0.1.1": wrap-content
#place(top + right, rect(inset: 3pt)[phys731 HW6 Harry Luo
])

= 1 
#align(left, rect(inset: 8pt)[#image("assets/2025-11-01-12-24-56.png")])

== a. Energy eigenvalues
For $V(x) = 1/2 m omega^2 x^2 ,$ we find the classical turning point as $E = V(plus.minus A)$ where $
  A = sqrt(frac(2 E, m omega^2)) , quad E = frac(A^2 m omega^2, 2)
$ 
in the regime $E>V(x),$ define the quantum number for WKB: $
  k(x) = 1/hbar sqrt(2m(E - 1/2m omega^2 x^2 )) = frac(m omega, hbar) sqrt(A^2 -x^2).
$Recall the WKB quantization condition for a single smooth bound state: $
  integral_(x_1)^x_2 k(x) dif x = (n+1/2)pi
$ 
where $x_1 = -A, x_2 = A.$ We compute the integral: $
  integral_(x_1)^x_2 k(x) dif x = frac(m omega, hbar) integral_(-A) ^A sqrt(A^2 - x^2) dif x = frac(m omega, hbar) frac(pi A^2, 2) = frac(pi E, hbar omega) .
$Letting this equal to $(n+1/2) pi,$ we solve for the energy levels: $
  frac(pi E, hbar omega) = (n+1/2) pi => quad E_n = (n+1/2) hbar omega, quad n = 0,1,2,...
$ exactly as expected from the quantum harmonic oscillator solution.

== b. Validity Criterion
Recall the validity criterion for WKB approximation: $
  abs(frac(k', k^2)) <<1.
$ 
We evalueate LHS and find the edge of the validity region. 
First, we have $
  k = frac(m omega, hbar) sqrt(A^2 - x^2) => quad k' = frac(m omega, hbar) frac(- x, sqrt(A^2 - x^2)) .
$ 
Then $
  abs(frac(k', k^2)) = abs(- frac(hbar, m omega) frac(x, (A^2 -x^2 )^(3/2))) = l^2 frac(abs(x), (A^2 -x^2 )^(3/2))
$ where we defined the characteristic length scale $l := sqrt(frac(hbar, m omega)).$

We further define a dimensionless position variable $alpha = frac(abs(x), A) $, where $
  A = sqrt(frac(2E, m omega^2)) =l sqrt(2(n+1/2))
$ Following the non-dimensionalization, we have $
  abs(frac(k', k^2)) = (alpha l^2 )/(A^2 (1-alpha^2 )^(3/2) ) = frac(alpha, 2(n+1/2)(1-alpha^2 )^(3/2))
$ 
We study the limit $alpha -> 0$ and $alpha -> 1$:
- As $alpha -> 0,$ $
    abs(k'/k^2) ~ 1/n
  $ and the WKB is valid for large $n.$
- As $alpha -> 1,$ i.e. near turning point, let $x = A- xi$, we have $
    abs(k'/k^2) ~ frac(l^2 A, (2 A xi)^(3/2)) = l^2 /(2^(3/2)sqrt(A) xi^(3/2))
  $ at the edge of the validity region, $
    abs(k'/k^2) ~1 => quad xi ~ 2^(7/6) l (n + 1/2)^(-1/6) .
  $ 
Thus the fraction of the classically allowed region occupied by this boundary layer is $
  xi/A ~ 1/(2^(5 \/3)) thin(n + frac(1, 2))^(-2 \/3),
$ which scales with decreasing $n.$ Thus, although the WKB criterion always fails arbitrarily close to the turning points, the “bad” region becomes a parametrically small fraction of the classically allowed interval as $n$ increases.

#pagebreak()

= 2 
#align(left, rect(inset: 8pt)[#image("assets/2025-11-01-12-25-20.png")])
#wrap-content(
  image("assets/2025-11-01-16-04-03.png", width: 60%),
  "First, lable" + $psi_(x<a) = psi_"I", med psi_(a < x < b) = psi_("II"), med psi_(x > b) = psi_("III").$ + "We will reformulate the wavefunctions in each region and connect them using connection formulas at the turning points" + $ x=a,b.$ + "We plot the potential with the regions marked below (See left).",
)
Let's follow the order $psi_"III" -> psi_"II" -> psi_"I"$. 
- First, write $psi_"III"$ as follows:$
    frac(F, sqrt(k(x))) exp(i integral_(b)^(x) k(x') dif x')= frac(F, sqrt(k)) e^(i pi/4) e^(i phi), \
    G/sqrt(k(x)) exp[i integral_(b)^(x) k(x') dif x'] equiv G/sqrt(k) e^(-i pi/4) e^(-i phi)
  $ 
where $phi equiv integral_(k)^(x) k(x') dif x - i pi \/4.$ 
Then we use Euler's formula to convert to $
  psi_"III" &= 1/sqrt(k)[ F e^(i pi / 4) (cos phi + i sin phi)+ G e^(- i pi/ 4) (cos phi - i sin phi)] \ &= 2/sqrt(k) cos phi 1/2(F e^(i pi / 4)+ G e^(- i pi / 4)) + 1/sqrt(k) sin phi (i F e^(i pi / 4) - i G e^(- i pi/4) )
$ and so each term can be connected to $psi_"II"$ using the connection formulas: $
  psi_"II" = 1/sqrt(kappa) 1/2 [F e^(i pi / 4)+ G e^(- i pi/4) ]exp(integral_(b)^(x) kappa(x') dif x')- 1/sqrt(kappa)(i F e^(i pi / 4) - i G e^(- i pi/ 4) ) exp[- integral_(b)^(x) kappa(x') dif x'].
$
Using $theta equiv exp[ integral_(a)^(b) kappa(x') dif x' ]$, we match the region of integration to get $
  psi_"II" = & 1/sqrt(kappa) 1/2 [F e^(i pi / 4)+ G e^(- i pi/4) ]exp(integral_(b)^(x) kappa(x') dif x' + integral_(a)^(b) kappa(x') dif x' - integral_(a)^(b) kappa(x') dif x') \ & - 1/sqrt(kappa)(i F e^(i pi / 4) - i G e^(- i pi/ 4) ) exp[- integral_(b)^(x) kappa(x') dif x' - integral_(a)^(b) kappa(x') dif x' + integral_(a)^(b) kappa(x') dif x'] \ 
             & = 1/sqrt(kappa) 1/2 [F e^(i pi / 4)+ G e^(- i pi/4) ] 1/theta exp(integral_(a)^(x) kappa(x') dif x') - 1/sqrt(kappa)(i F e^(i pi / 4) - i G e^(- i pi/ 4) ) theta exp[- integral_(a)^(x) kappa(x') dif x'] .
$ 
From which we read off $
  C = theta [i G e^(- i pi / 4)- i F e^(i pi / 4) ], quad D = 1/(2 theta) [F e^(i pi / 4)+ G e^(- i pi/4) ].
$ 

- Now we connect $psi_"II"$ to $psi_"I"$ using the same procedure. We first note $psi_"II"$ : 
$
  psi_"II" = frac(C, sqrt(kappa(x))) exp[- integral_(a)^(x) kappa(x') dif x'] + frac(D, sqrt(kappa(x))) exp[ integral_(a)^(x) kappa(x') dif x'].
$
At the turning point $x=a$, the potential has positive slope $V'(a)>0$. Applying connection formulas term-by-term to $psi_"II"$ gives
$
  psi_"I" = frac(2 C, sqrt(k(x))) cos[ integral_(x)^(a) k - pi/4 ] - frac(D, sqrt(k(x))) sin[ integral_(x)^(a) k - pi/4 ].
$
Let $phi_a equiv integral_(a)^(x) k(x') dif x'$, so $integral_(x)^(a) k = - phi_a$. Then
$
  cos[ integral_(x)^(a) k - pi/4 ] = cos[- phi_a - pi/4 ] = cos(phi_a + pi/4),
$
$
  sin[ integral_(x)^(a) k - pi/4 ] = sin[- phi_a - pi/4 ] = - sin(phi_a + pi/4).
$
Thus
$
  psi_"I" = frac(2 C, sqrt(k)) cos(phi_a + pi/4) - frac(D, sqrt(k)) [- sin(phi_a + pi/4) ] = frac(1, sqrt(k)) [ 2 C cos(phi_a + pi/4) + D sin(phi_a + pi/4) ].
$
Let $tilde(phi) equiv phi_a + pi/4$. Using Euler's formula,
$
  psi_"I" = frac(1, sqrt(k)) [ 2 C (e^(i tilde(phi) ) + e^(-i tilde(phi) ) )/2 + D (e^(i tilde(phi) ) - e^(-i tilde(phi) ) )/(2 i) ]
$
$
  = frac(1, sqrt(k)) [ C (e^(i tilde(phi) ) + e^(-i tilde(phi) ) ) + (D /(2 i)) (e^(i tilde(phi) ) - e^(-i tilde(phi) ) ) ]
$
$
  = frac(1, sqrt(k)) [ e^(i tilde(phi) ) ( C + D/(2 i) ) + e^(-i tilde(phi) ) ( C - D/(2 i) ) ].
$
Since $D/(2 i) = - i D /2$, this is
$
  psi_"I" = frac(1, sqrt(k)) [ e^(i tilde(phi) ) ( C - i D /2 ) + e^(-i tilde(phi) ) ( C + i D /2 ) ].
$
Substituting $tilde(phi) = phi_a + pi/4$,
$
  psi_"I" &= frac(1, sqrt(k)) [ e^(i (phi_a + pi/4) ) ( C - i D /2 ) + e^(-i (phi_a + pi/4) ) ( C + i D /2 ) ] \ 
          & = frac(1, sqrt(k)) [ e^(i pi/4) ( C - i D /2 ) e^(i phi_a ) + e^(-i pi/4) ( C + i D /2 ) e^(-i phi_a ) ].
$
Comparing to $psi_"I" = frac(A, sqrt(k)) e^(i phi_a ) + frac(B, sqrt(k)) e^(-i phi_a )$, we read off
$
  A = e^(i pi/4) ( C - i D /2 ), quad B = e^(-i pi/4) ( C + i D /2 ).
$
Now substitute the expressions for $C$ and $D$:
$
  C = theta [ i G e^(-i pi/4) - i F e^(i pi/4) ], quad D = frac(1, 2 theta) [ F e^(i pi/4) + G e^(-i pi/4) ].
$
For $A$,
$
  A &= e^(i pi/4) [ theta ( i G e^(-i pi/4) - i F e^(i pi/4) ) - i/2  frac(1, 2 theta) ( F e^(i pi/4) + G e^(-i pi/4) ) ] \ 
    & = e^(i pi/4) [ i theta ( G e^(-i pi/4) - F e^(i pi/4) ) - (i /(4 theta)) ( F e^(i pi/4) + G e^(-i pi/4) ) ] \
    & = (theta + 1/(4 theta) ) F + i (theta - 1/(4 theta) ) G.
$
For $B$,
$
  B &= e^(-i pi/4) [ theta ( i G e^(-i pi/4) - i F e^(i pi/4) ) + i/2  frac(1, 2 theta) ( F e^(i pi/4) + G e^(-i pi/4) ) ] \ 
    & = e^(-i pi/4) [ i theta ( G e^(-i pi/4) - F e^(i pi/4) ) + (i /(4 theta)) ( F e^(i pi/4) + G e^(-i pi/4) ) ] \
    & = i (1/(4 theta) - theta ) F + (theta + 1/(4 theta) ) G.
$
This gives the transfer matrix relation
$
  vec(A, B) = display(mat(theta + 1/(4 theta), i (theta - 1/(4 theta) );i (1/(4 theta) - theta ), theta + 1/(4 theta))) vec(F, G).
$

In the limit $G = 0,$  and $theta >>1,$ we have $ 
A = (theta+ 1/(4 theta))F, quad B = i (1/(4theta)-theta)F 
$ 
Transmission is given by $ 
T = abs(F/A)^2 =1/(theta+1/(4 theta))^2 ~ 1/theta^2  = exp[-2 integral_(a)^(b) kappa(x') dif x'] 
$ 


#pagebreak()

= 3
#align(left, rect(inset: 8pt)[#image("assets/2025-11-01-12-26-51.png")])

#wrap-content(image("assets/2025-11-01-20-41-01.png", width: 80%),"See left for the 1D symmetric double well potential, with marked regions and turning points. We will exploit the symmetry and parity of the potential in our derivation, in that we only solve for the region "+ $x>0.$ )
We propose the following wavefunction ansatz for each region (symmytry about $x=0$ allows us to only consider $x>0$):
$ 
psi_I = F/sqrt(kappa) e^(- integral_(x_2)^(x) kappa dif x')   \ psi_"II" = 1/sqrt(k) [A cos(s - pi/4) + B sin(s - pi/4)] , quad (s equiv integral_(x_1)^(x) k(x') dif x') \ 
psi_"III" = 1/sqrt(kappa)[C e^(u(x))+ D e^(-u(x)) ] , quad (u(x) equiv integral_(0)^(x) kappa(x') dif x')
$ 
We connect $psi_I$ to $psi_"II"$ at turning point $x=x_2$ where $V'(x_2)>0$. Using connection formulas, we convert $psi_"I" -> psi_"II"$ as $ 
psi_"II" prop& 2/sqrt(k) cos( integral_(x)^(x_2) k(x') dif x' - pi/4) = 2/sqrt(k) cos(theta - integral_(x_1)^(x) k dif x' - pi/4)  \ 
& =   2/sqrt(k) [cos theta  cos( integral_(x_1)^(x) k dif x' + pi/4) + sin theta sin( integral_(x_1)^(x) k dif x' +pi/4) ] \ 
& = 2/sqrt(k) [ sin theta cos(s - pi/4) - cos theta sin(s - pi/4) ] 
$ Matching coefficients with original $psi_"II"$, we read off $ 
A =  2 sin theta, quad B =- 2 cos theta \ => B/A = - cot theta  
$ 
We next connect $psi_"II"$ to $psi_"III"$ at turning point $x=x_1$ where $V'(x_1)<0$. Using connection formulas, we convert $psi_"II" -> psi_"III"$ by first writing $ 
psi_"II" = A/2 2/sqrt(k) cos (s- pi/4) + B/sqrt(k) sin(s - pi/4)   
$ then $ 
psi_"III" prop 1/sqrt(kappa) [A/2 exp( integral_(x_1)^(x) kappa dif x') -  B exp(- integral_(x_1)^(x) kappa dif x') ] 
$ since $ integral_(x_1)^(x) kappa dif x' = integral_(0)^(x) kappa dif x' - integral_(0)^(x_1) kappa dif x' = u- phi/2$, we can write $ 
psi_"III" prop 1/sqrt(kappa)[A/2 exp(u - phi/2) - B exp(- (u - phi/2)) ] = 1/sqrt(kappa)[(A/2 e^(- phi/2)) e^u - (B e^(phi/2)) e^(-u) ]
$ 
Matching coefficients with original $psi_"III"$, we read off $
C = A/2 e^(- phi/2), quad D = - B e^(phi/2) 
$ 
 

Symmetry of the potential $V(-x)=V(x)$ means all eigenstates are either even ($psi(-x)=psi(x)$) or odd ($psi(-x)=-psi(x)$). Since we're only working on $x>0$, we impose the parity condition at the center $x=0$ (where $u(0)=0$) to fix the coefficients $C,D$ in $psi_"III"$. This automatically determines the solution for $x<0$ by reflection.

- *Even states* ($psi'(0)=0$):  
  The wavefunction in the barrier is $ psi_"III"(x) prop 1/sqrt(kappa(x)) [C e^(u(x)) + D e^(-u(x))]. 
  $ 
  Differentiate: $ psi'_"III" (x) prop 1/sqrt(kappa(x)) [C kappa(x) e^(u(x)) - D kappa(x) e^(-u(x))] $  
  (the $kappa(x)$ factor comes from the chain rule on the exponentials, and the $1/sqrt(kappa)$ prefactor derivative is neglected in WKB as it's slowly varying).  
  Set $psi_"III"'(0)=0$: at $x=0$, $u=0$, so $e^u = e^(-u) = 1$, giving  
  $ C kappa(0) - D kappa(0) = 0 quad => quad C = D $
  Now plug in the expressions for $C,D$ from the connection at $x_1$:  
$ 
C = A/2 e^(-phi/2), quad D = -B e^(+phi/2) 
$  
  So $ A/2 e^(-phi/2) = -B e^(+phi/2) => quad  B/A = -1/2 e^(-phi) $  
  But from the connection at $x_2$, we have $B/A = -cot theta$. Thus:  
  $ cot theta = +1/2 e^(-phi),
  $ which is the quantization condition for even states.

- *Odd states* ($psi(0)=0$):  
  Evaluate $psi_"III"(0)$: at $x=0$, $u=0$, so $e^u = e^(-u) = 1$, giving  
  $
  C + D = 0 quad => quad C = -D
  $ 
  Plug in $C,D$: $
  A/2 e^(-phi/2) = -(-B e^(+phi/2)) => quad  B/A = +1/2 e^(-phi).
  $
  Again using $B/A = -cot theta$ from $x_2$: $ cot theta = -1/2 e^(-phi),
  $ which is the quantization condition for odd states.
Collectively, the quantization conditions for even and odd states are:$ 
"Odd": & cot theta = -1/2 e^(-phi) \ "Even": & cot theta = +1/2 e^(-phi)
$ with $ theta = integral_(x_1)^(x_2) k(x') dif x', quad phi = 2 integral_(0)^(x_1) kappa(x') dif x'. $

Notedly, as $phi -> infinity$ both conditions reduces to 
$ cot theta = 0 => quad theta(E) = pi/2, (3 pi)/2, (5 pi)/2, dots = (n + 1/2) pi
$ which is exactly the quantization condition for a single isolated well, as expected since large $phi$ means a high/wide barrier that decouples the wells.





#pagebreak()
= 4
#align(left, rect(inset: 8pt)[#image("assets/2025-11-01-12-27-18.png")])
== a. 
For a particle moving under $F$ from $x = x', t=0,$ we have its EOM: $ 
x_"CL" (t) = x' + v_0 t + 1/2 a t^2  = x' + (frac(x - x' , t) - frac(F t , 2 m) )t' + F/(2m) t^2  
$ 
and so the classical action is given as $ 
S = integral_(0)^(t) L dif t = integral_(0)^(t) 1/2 m dot(x) + F x(t')  dif t' = frac(m(x-x')^2 ,2 t ) + frac(F (x + x')t ,2 ) - frac(F^2 t^3 ,24 m)  .  
$ The propagator $K$ is thus $ 
K  = A(t) exp(i S slash hbar) 
$ 
where $A(t) $ can be evaluated by considering the free particle limit $F -> 0:$ $ 
K = sqrt(frac(m , 2 pi i hbar t) ) exp(frac(i m (x - x')^2  , 2 hbar t) ) equiv A(t) exp(frac(i m (x - x')^2  , 2 hbar t) ) => A(t) = sqrt(frac(m , 2 pi i hbar t) ) .
$ 
Therefore, the full propagator is $ 
K =  sqrt(frac(m , 2 pi i hbar t) ) exp[i/hbar frac(m(x-x')^2 ,2 t ) + frac(F (x + x')t ,2 ) - frac(F^2 t^3 ,24 m) ].
$ 

== b. 
For the simple harmonic oscillator, the classical Lagrangian is given as $ 
 L = T- V = 1/2 m dot(x)^2 - 1/2 m omega^2 x^2 
$ and the EOM is retrieved as $ 
(dif )/(dif t) (m dot(x))+ m omega^2  x = 0 quad => dot.double(x)  omega^2 x = 0
$ 
the solution to the EOM with boudary conditions $x(0) = x', x(t) = x$ is $ 
x_(c l)(tau) = (x' sin(omega(t - tau)) + x sin(omega tau))/(sin(omega t)) 
$ 
the classical action is evaluated as $ 
S = integral_(0)^(t) L dif tau =  integral_(0)^(t) 1/2 m dot(x)^2 - 1/2 m omega^2 x^2  dif tau = integral_(0)^(t) m/2 (dif )/(dif tau) (x dot(x))  dif tau = m/2 [x(t) dot(x)(t) - x(0) dot(x)(0)]
$ 
where $ 
dot(x)(tau) = frac(omega , sin omega t)(- x' cos(omega (t - tau )) + x cos(omega tau))   \ => dot(x)(0)=frac(omega , sin omega t) (- x' cos omega t + x), quad dot(x)(t) = frac(omega , sin omega t) (- x' + x cos omega t)
$
Plugging in, we have $ 
S = frac(m omega , 2 sin omega t) [(x^2  + x'^2 ) cos omega t - 2 x x'] 
$ 
The propagator is thus $ 
K = A(t) exp(i/hbar frac(m omega , 2 sin omega t) [(x^2  + x'^2 ) cos omega t - 2 x x']  )
$




#pagebreak()
= 5 
#align(left, rect(inset: 8pt)[#image("assets/2025-11-01-12-28-13.png")])
For $x = x' = 0,$ we have $ 
K = sum_(n) abs(psi_n (0))^2 e^(- i E_n t \/ hbar)  ,   
$ <eq.prop>
while for the harmonic oscillator, we recall its propagator in closed form (with $x = x' = 0$ )$ 
K =  (frac(m omega , 2 pi i hbar sin omega t) )^(1\/2) = (frac(m omega , pi hbar e^(i omega t) (1-e^(-2 i omega t) )) )^(-1 slash 2) = sqrt(frac(m omega , pi hbar) ) e^(- i omega t slash 2) (1- e^(- 2i omega t) )^(1 slash 2)   
$ 
Using binomial expansion, i.e. $ 
(1 - z)^(- 1 slash 2) = sum_( k=0)^(infinity) frac((2 k)! ,4^k (k!)^2  ) z^k   
$ taking $z = e^(- 2 i omega t) ,$ we have $ 
K = sqrt(m omega pi hbar) e^(- i omega t slash 2) sum_( k=0)^(infinity) frac((2 k)! ,4^k (k!)^2  ) (e^(- 2 i omega t) )^k = sqrt((m omega) /(pi hbar)) sum_( k=0)^(infinity) frac((2 k)! ,4^k (k!)^2  ) e^(- i omega t (2 k + 1 slash 2)   
$ <eq.bin>

Also, recall that the Harmonic oscillator has wavefunction solutions in terms of Hermite polynomials: $ 
psi_n = N_n H(alpha x) e^(- alpha^2  x^2  \/ 2 )  
$ 
where $ alpha = sqrt(m omega \/ hbar) ,$ and $N_n$ is the normalization constant. Notedly, $H_n (0) = 0$ for odd $n,$ so $psi_n (0) = 0$ for odd $n.$ 
We can thus rewrite @eq.prop in terms of only even $n = 2 k:$ $ 
K = sum_(k=0)^(infinity) abs(psi_(2k) (0))^2 e^(- i E_(2k)t \/ hbar)   
$ 
Mathing with  @eq.bin, we identify $ 
sum_(k) abs(psi_(2k) (0))^2 e^(- i E_(2k)t \/ hbar) = sqrt((m omega) /(pi hbar)) sum_( k=0)^(infinity) frac((2 k)! ,4^k (k!)^2  ) e^(- i omega t (2 k + 1 slash 2))
$ 
and so the time dependent terms must match for each $k:$ $ 
E_(2k) t slash hbar = (2k + 1/2) omega t => quad E_n = hbar omega (n + 1/2) 
$ 
We can therefore determine energy eigenvalues for even $n$: $ 
E_0= 1/2 h omega; quad  E_2 = 5/2 h omega; quad E_4 = 9/2 h omega; dots
$
However, not all of the eigenvalues through $n=4$ can be obtained using this method. As mentioned, the wavefunctions for odd quantum numbers ($n=1, 3, 5, dots$) have odd parity and are therefore zero at the origin, $psi_n (0)=0$. These states make no contribution to the spectral sum for $K(0, t; 0, 0)$ and are thus "invisible" to this specific analysis.