#set math.equation(numbering: "(1)")
#set text(
font: "Palatino Linotype",size: 11pt)
#set page(margin: (x: 1cm, y: 1cm), numbering: "1/1")
#import "@preview/physica:0.9.6": *
#place(top + right, rect(inset: 3pt)[PHYS 406 | Harry Luo
])
= 1
#align(
  left,
  rect(inset: 8pt)[Evaluate the integral over circular contour $C: x^2 +y^2 = 2x$:$ 
  integral.cont_C 1/(z^2 +1) dif z 
  $ 
   ]
)
Find the pole by factoring the denominator $ 
z^2 +1 = (z+i) (z-i) =0 => quad z_1 = i, z_2 = -i
$ 
However, notice that the contour $C$ can be written as $ 
x^2 +y^2 = 2x quad => (x-1)^2 +y^2 =1 
$ i.e. a circle centered at $(1,0)$ with radius $1$. 

From this, we see that $ 
|i-1|=sqrt(1+1)=sqrt(2) >1 \ $ and $ |-i-1|=sqrt(1+1)=sqrt(2) >1 
$ so that both poles lie outside the contour and the integral is analytic within and on $C$. By Cauchy's Integral Theorem, the value of the integral is therefore $0$.

#pagebreak()
= 2 
#align(
  left,
  rect(inset: 8pt)[Evaluate the integral with contour $C:$ $|z-2|=1/2$.$ 
  integral.cont_C frac(z , (z-1)(z-2)^2 )  dif z 
  $ 
    ]
)
The contour is a circle centered at $x=2$ with radius $1/2$.
We find the following poles by setting the denominator equal to zero: $ 
z_1 = 1, quad "order" =1, "outside contour";\ z_2 = 2, quad "order" = 2, "in contour".
$ 
We thus only focus on residue at $z=2$.$ 
Res(f, z_2=2)= lim_(z -> 2) (dif )/(dif z) ((z-2)^2 1/((z-1)(z-2)^2) ) = -1
$ 
Then by the Residue Theorem, we have $ 
integral.cont_C f(z) dif z = 2 pi i (-1) = - 2 pi i. 
$ 


#pagebreak()
= 3 
#align(
  left,
  rect(inset: 8pt)[For the contour $C$: $|z|= 2,$ find $ 
  integral.cont_C frac(1 , (z-3)(z^5-1))  dif z.  
  $ 
   ]
)
We first realize that the contour is a circle centered at the origin with radius $2$.

We find the poles: 
- $z_1 = 3$, outside contour. 
- $z^5 = 1 => z = exp[2 pi i k slash 5], k = 0,1,dots,4.$ All five roots lie within the contour since $|exp[2 pi i k slash 5]| =1 <2$. We denote these roots as $z_2, z_3, z_4, z_5, z_6$.

We use the fact that sum of the residues of $f(z)$ at all its finite singularities, plus the residue of $f(z)$ at infinity, is zero. Here, $ 
sum_(z= 2)^(6) Res(f, z_i) + Res(f, z_1) = 0 quad => quad sum_(z= 2)^(6) Res(f, z_i) = - Res(f, z_1) ,
$ where $ 
Res(f, z_1) = lim_(z -> 3) (z-3) frac(1 , (z-3)(z^5-1))  =1/242.
$ So by the Residue Theorem, we have $ 
integral.cont_C f(z) dif z = 2 pi i (- 1/242) = -1/121 pi i.
$ 

#pagebreak()
= 4
#align(
  left,
  rect(inset: 8pt)[Evaluate the integral with contour $C$: $|z|=1$.$ 
  integral.cont_C frac(z^3 , 2z^4+1)  dif z 
  $ 
    ]
)
The contour is a circle centered at the origin with radius $1$.

We find the poles by solving $2z^4 + 1 = 0$, which gives $z^4 = -1/2$. The four poles are:
$
z_k = (1/2)^(1slash 4) exp(i(pi + 2pi k)/4)
$ for $k = 0,1,2,3$.

Since $|(1/2)^(1/4)| < 1$, all four poles lie inside the contour $C$.

For each simple pole $z_k$, we calculate the residue using $
Res(f, z_k) = P(z_k)/Q'(z_k)
$ where $P(z) = z^3$ and $Q(z) = 2z^4 + 1$:
$
Q'(z) = 8z^3,
$ so $ 
Res(f, z_k) = z_k^3/(8z_k^3) = 1/8.
$

The sum of residues is $4 dot (1/8) = 1/2$.

By the Residue Theorem:
$
integral.cont_C f(z) dif z = 2pi i dot (1/2) = pi i 
$

#pagebreak()
= 5
#align(
  left,
  rect(inset: 8pt)[Evaluate the integral with contour $C$: $|z|=1$.$ 
  integral.cont_C frac(e^(z^2) , z^2(z^2-9))  dif z 
  $ 
    ]
)
The contour is a circle centered at the origin with radius $1$.

We find the poles:
- $z = 0$ (order 2, from $z^2$)
- $z = 3$ (order 1, from $z^2-9=0$)
- $z = -3$ (order 1, from $z^2-9=0$)

Since $|3| > 1$ and $|-3| > 1$, only the pole at $z=0$ lies inside the contour.

We calculate the residue at the pole of order 2 at $z=0$:
$ 
Res(f, 0) &=lim_(z -> 0) (dif )/(dif z) [z^2 dot frac(e^(z^2) , z^2(z^2-9))] \ 
& = lim_(z -> 0) (dif )/(dif z) [frac(e^(z^2) , z^2-9)] \ 
& =  lim_(z -> 0) frac(e^(z^2) dot 2z dot (z^2-9) - e^(z^2) dot 2z , (z^2-9)^2) \ 
& =  lim_(z -> 0) frac(2z e^(z^2) (z^2-10) , (z^2-9)^2) = 0
$

Then by the Residue Theorem:
$
integral.cont_C f(z) dif z = 2pi i dot 0 = 0
$

#pagebreak()
= 6
#align(
  left,
  rect(inset: 8pt)[For $C$ a circle centered at origin, find $ 
  1/(2 pi i) integral.cont_C sin(1/z) dif z. 
  $ 
   ]
)
Expand $sin(1/z)$ in its Laurent series about $z=0$:$ 
sin_1/z approx 1/z - 1/(6 z^3) + dots 
$ read off the coefficient of $1/z$ term, which is $1$.
So $Res(f(z),0) = 1$ and so by the Residue Theorem, we have $ 
1/(2 pi i) integral.cont_C f(z) dif z = Res(f(z),0) = 1 
$ 
 
#pagebreak()
= 7 
#align(
  left,
  rect(inset: 8pt)[For C a circle centered at the origin ,find $ 
  1/(2 pi i) integral.cont_C sin^2 (1/z) dif z. 
  $ 
  ]
)

Write $ sin^2 1/(z)= frac(1- cos(2/z) , 2) $ 
and expand in Laurent series about $z=0$: $ 
 sin^2 1/(z) approx frac(1-(1+1/2(2/z)^2 + dots) ,2 ) = 1/z^2 - 8/(4! z^4) + dots
$ 
There is no $1/z$ term, so the residue at $z=0$ is $0$. By the Residue Theorem, we have $ 
1/(2 pi i) integral.cont_C f(z) dif z = 0.
$

#pagebreak()
= 8
#align(
  left,
  rect(inset: 8pt)[For C a circle centered at the origin and $n$ an integer , find $ 
  1/(2 pi i) integral.cont_C z^n e^(2 slash z)  dif z 
  $ 
  ]
)
Expand $e^(2 slash z)$ in its Laurent series about $z=0$: $ 
z^(2 slash z) approx 1 + 2/z + 2/z^2 + underbrace( + 1/(j!) 2^j / (z^j) , j"th term")+ dots 
$ 
Multiply by $z^n$: $ 
z^n e^(2 slash z) approx z^n + 2 z^(n-1) + dots + 2^j/(j!) z^(n - j) + dots 
$
Seek the $1/z$ term, which occurs when $n - j = -1 => j = n + 1$. Thus the residue at $z=0$ is $ 
Res(f(z),0)= frac(2^(n+1) ,(n+1)! ) . 
$ 
By the Residue Theorem, the integral is $ 
integral.cont_C f(z) dif z =  frac(2^(n+1) ,(n+1)! ) . 
$ 
Note that for $n< -1,$ we interpret factorial of negative integers as infinite, so the residue and integral is $0$ in that case.

#pagebreak()\
= 9 
#align(
  left,
  rect(inset: 8pt)[Find $ 
  integral.cont_(|z|=3) (1+z+z^2 )(e^(1 slash z)+ e^(1 slash(z-1))  + e^(1 slash (z-2) )  ) dif  z
  $ 
  ]
)
We recognoize pole: $ 
z_1 = 0, z_2= 1, z_3 = 2. 
$ 
Since there are three terms that contribute to poles, and for each pole, only one term contribute to the residue with others being analytic, we can find the residue $Res(f,0), Res(f,1), Res(f,2)$ separately.

- $z_1= 0$. Only $e^(1/z)$ contributes to the residue. Write $ 
(1 + z + z^2 ) e^(1 slash z) approx (1 + z + z^2 ) sum_(k=0)^(infinity) frac(z^(-k) , k!) = sum_(k=0)^(infinity) 1/(k!) (z^(-k) + z^(1 - k) + z^(2 - k) )
$ 
 We seek the $1/z$ term, which occurs when $k=1, 2,3$ respectively for the three parts. Thus $
Res(f,0) = 1 + 1/2  + 1/6 = 5/3. 
$

- $z_2=1$. Taking subsitution $omega = z-1,$ we have   $ 
(1+z+z^2 )e^((1 slash (z-1))) = (3 + 3omega + omega^2 ) e^(1/omega )  = sum_(k=0)^(infinity) 1/(k!) (3 omega^(-k) + 3 omega^(1 - k) + omega^(2 - k) ) .
$ 
Seek $omega^(-1) $ terms, which occurs when $k=1, 2,3$ respectively for the three parts. Thus $
Res(f,1) = 3 + 3/2 + 1/6 =14/3.
$

- $z_3 = 2$. Following the same procedure, we take $omega = z-2$ and write $ 
(1+z+z^2 )e^(1/(z-2))  = (7 + 5 omega + omega^2 ) e^(1/omega )  = sum_(k=0)^(infinity) 1/(k!) (7 omega^(-k) + 5 omega^(1 - k) + omega^(2 - k) ) . 
$
Seek $omega^(-1) $ terms, which occurs when $k=1, 2,3$ respectively for the three parts. Thus $
Res(f,2) = 7 + 5/2 + 1/6 =29/3. 
$

Thus by the Residue Theorem, we have $ 
integral.cont_C f(z) dif z =2 pi i sum_(k=1)^(3) Res(f, z_k)= 2 pi i(5/3 + 14/3 + 29/3 )=32 pi i.   
$ 

#pagebreak()
= 10
#align(
  left,
  rect(inset: 8pt)[Find $ 
  integral.cont_(|z|=5) frac(z , sin z( 1- cos z))  dif z  
  $ 
  ]
)

We recognize poles with $ 
sin z (1 - cos z) = 0 quad => z = n pi. 
$ 
Within the contour $|z|=5$, we have poles at $ 
z = 0 , plus.minus pi. 
$ 
For $z = plus.minus pi, $ these are simple poles. We find using the formula $ 
Res(p(z)/(q(z)),z_0) = p(z_0)/(q'(z_0)). 
$ 
So that $ 
Res(f,pi) = pi/(cos pi - cos (2 pi)) = -pi/2 \ 
Res(f, pi) = frac(- pi , cos(-pi) - cos (-2 pi)) = pi/2.  
$ 
While for $z=0,$ it's a pole of order 2. We take the Laurent expansion around $z=0$: $ 
f(z) approx frac(z , (z-z^3/6) (1 -1 x^2 /2))  = frac(z ,z^3/2- z^5/12 )   .
$ 
We see that there is no $1/z$ term, so $Res(f,0) = 0.$
Thus by the Residue Theorem, we have $ 
 integral.cont_(|z|=5) f(z) dif z = 2 pi i ( -pi/2 + pi/2) = 0.
$ 
