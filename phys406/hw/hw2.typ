#set math.equation(numbering: "(1)")
#set page(margin: (x: 1cm, y: 1cm))
#import "@preview/physica:0.9.5": *
#place(top + right, rect(inset: 3pt)[Phys406 HW2])

= P1 
#align(
  left,
  rect(inset: 8pt)[Evaluate the Wallis Integral (for $n -> infinity$ ) $ 
     I = integral_(0)^(pi/2) sin^n (t) dif t .
  $ 
  ]
)
Write $sin^n t = exp(n ln(sin t))$, then the integral is$ 
    integral_(0)^(pi/2) e^(n f(t)) dif t, quad f(t) =  ln(sin t) . 
$ 
Taking $f(t) =cot(t)= 0 => t_0 = pi/2$ at boundary, with $ f''(pi/2) = -1<0$ , so consider subsitution $u = pi/2 - t.$ This shifts the maximum and gives $ 
   sin t = cos u approx 1 - u^2/2, quad (u ~ 0) $  
 We see that $f(t) = ln(1- u^2 /2) approx -u^2 /2,$ and thus $ 
   I = integral_(0)^(pi/2) e^(-(n u^2) /2) dif u  approx  integral_(0)^(infinity) e^(-(n u^2) /2) dif u. 
 $ Setting $x = (sqrt(n) u) / sqrt(2) , dif u = sqrt(2/n) dif x, $ and via half a Gaussian integral, we have$ 
   I approx sqrt(2/n) integral_(0)^(infinity) e^(-x^2) dif x = 
#rect(inset: 8pt)[
$ display(   sqrt(pi/(2 n)) .)$
]

  $ 
A comparison plot between the asymptotic form and the exact integral is shown below ( over incerasing $n$ ).
#image("assets/2025-09-28-13-38-16.png")

#pagebreak()
= P2
#align(
  left,
  rect(inset: 8pt)[Find the asymptotic form of the Bessel function in $x -> infinity$ limit $ 
       I_n (x) = 1/pi integral_(0)^(pi) e^(x cos theta) cos(n theta) dif theta. $   
   ]
)
We read off the Laplace integral form $ 
    I = 1/pi integral_(0)^(pi) e^(x f(theta)) g(theta) dif theta 
$ with $f(theta) = cos theta, med g(theta) = cos n theta .$

Find maximum with $f'(theta) = -sin theta = 0 &=> theta_0 = 0 "or" pi, med f''(0) = -1 <0$. The stationary point $theta_0 = 0$ is at boundary, so we consider expansion to second order around $theta_0 = 0$ , with $ 
   cos theta approx 1 - theta^2 /2, quad cos(n theta) approx 1 .
$ 

and so $ 
    I(x) approx 1/pi integral_(0)^(pi) e^(x (1- theta^2 ))  dif theta = e^x / pi integral_(0)^(pi) e^(-(x slash 2)theta^2 )  dif theta  
$Gaussian $e^(- (x/2) theta^2)$ decays rapidly (width $~ z^(-1/2) << pi$), so extend to $ infinity$ with exponentially small error: $ 
    I(x) approx e^x / pi integral_(0)^(infinity) e^(-(x slash 2)theta^2 )  dif theta =_(u = sqrt(x slash 2) med theta) quad e^(x) /pi sqrt(2/x) integral_(0)^(infinity) e^(-u^2) dif u = 
#rect(inset: 8pt)[
$ display(    e^x / sqrt(2 pi x) .)$
]

$ 
A comparison plot between the asymptotic form and the exact integral is shown below ( for $n = 0$ ).
#image("assets/2025-09-28-13-39-11.png")

#pagebreak()
= P3
#align(
  left,
  rect(inset: 8pt)[In the limit of $n -> infinity, x>1,$ find the asymptotic form of the Legendre polynomial $ 
      P_n (x) =1/pi integral_(0)^(pi) (x + sqrt(x^2  - 1) cos theta )^(n)  dif  theta .
  $ 
  ]
)
We read off the Laplace integral form with $f(theta) = ln(x+sqrt(x^2  - 1) cos theta )$: $ 
    P_n (x) = 1/pi integral_(0)^(pi) e^(n f(theta)) dif theta . 
$ 
Examine $f(theta)$, with $omega = sqrt(x^2 -1) >0, med beta = x+ omega >1$ : $ 
    f'(theta) = - frac(omega sin(theta ) , omega cos theta + x) <0, quad (theta in (0, pi)) 
$ 
so $f(theta)$ is monotonically decreasing in $(0, pi)$ with maximum at boundary $theta_0 = 0$. Further, $ 
    f''(theta ) = - frac(omega cos theta (omega  cos theta + x) + omega ^2 sin^2 theta  , (omega  cos theta  + x)^2 )  , quad f''(0) = - frac(omega^2 + omega x , (omega + x)^2 ) = - omega / beta <0 .
$ 
Thus $theta = 0$ is a stationary point at the boudnary. We expand around $theta_0 = 0$ : $ 
    f(theta) approx ln(beta(1- frac(omega theta^2  , 2 beta) )) = ln beta - frac(omega theta^2  , 2 beta). 
$ 
So $ 
    P_n (x) approx 1/pi integral_(0)^(pi) e^(n (ln beta - (omega theta^2 )/(2 beta))) dif theta = beta^n / pi integral_(0)^(pi) e^(-(n omega)/(2 beta) theta^2 ) dif theta .
$ Since $e^(-(n omega)/(2 beta) theta^2 )$ decays rapidly with $n >> 0$  (width $~ sqrt(beta/(n omega)) << pi$), we extend the upper limit to infinity with exponentially small error, and use half Gaussian to estimate:  $ 
    P_n (x) approx beta^n / pi integral_(0)^(infinity) e^(-(n omega)/(2 beta) theta^2 ) dif theta = beta^n / pi sqrt((2 beta)/(n omega)) integral_(0)^(infinity) e^(-u^2) dif u = 
#rect(inset: 8pt)[
$ display(    frac(beta^(n + 1/2)  , sqrt(2 pi n omega) ) .)$
]

$

A comparison plot between the asymptotic form and the exact integral is shown below ($x = 1.5$ ).
#image("assets/2025-09-28-13-39-37.png", width: 80%, )

#pagebreak()
= P4
#align(
  left,
  rect(inset: 8pt)[In the limit of $nu -> oo, x>0, $ find the asymptotic form of the McDonald function$ 
      K_nu (x) = 1/2 integral_(-infinity)^(infinity) exp(nu t - x cosh t) dif t 
  $ 
  ]
)



We read off the Laplace integral form with $Phi(t) = nu t - x cosh t$: $ 
    K_nu (x) = 1/2 integral_(-infinity)^(infinity) e^(Phi(t)) dif t . 
$ 
Examine $Phi(t)$, find stationary point with $ 
    Phi'(t) = nu - x sinh t = 0 quad => t_0 = "arcsinh"(nu / x) , 
$ 
which is an interior point given the infinite bound. Further, $ 
    Phi''(t) = - x cosh t , quad Phi''(t_0) = - x cosh("arcsinh"(nu / x)) = - sqrt(nu^2 + x^2) <0 .
$ 
Thus $t_0$ is a maximum in the interior. We expand around $t_0$: $ 
    Phi(t) approx Phi(t_0) + (1/2) Phi''(t_0) (t - t_0)^2 , quad Phi(t_0) = nu "arcsinh"(nu / x) - sqrt(nu^2 + x^2) .
$ 
So $ 
    K_nu (x) &approx 1/2 integral_(-infinity)^(infinity) exp(Phi(t_0) + (1/2) Phi''(t_0) (t - t_0)^2 ) dif t \ 
    & =  
    (1/2) e^(Phi(t_0)) integral_(-infinity)^(infinity) exp( - (sqrt(nu^2 + x^2)/2) (t - t_0)^2 ) dif t .
$ 
Since this is an interior maximum, we use the full Gaussian integral. Setting $
u = (nu^2+x^2)^(1slash 4)/sqrt(2) dot  (t-t_0) quad =>dif t = sqrt(2)/(nu^2+x^2)^(1slash 4) dif u, $ we have: $ 
    K_nu (x) approx (1/2) e^(Phi(t_0)) frac(sqrt(2),(nu^2+x^2)^(1/4)) integral_(-infinity)^(infinity) e^(-u^2) dif u = 
#rect(inset: 8pt)[
$ display(    sqrt(pi / 2) frac( exp( nu "arcsinh"(nu / x) - sqrt(nu^2 + x^2) ) , (nu^2 + x^2)^(1/4) ) .)$
]

$
A comparison plot between the asymptotic form and the exact integral is shown below (for $x=1$  ).
#image("assets/2025-09-28-13-41-37.png", width: 50%)


#pagebreak()
= P5
#align(
  left,
  rect(inset: 8pt)[In the limit of $nu -> oo, x>0, $ find the asymptotic form of the Weber function$ 
      D_(-nu - 1) (x) = frac(e^(-x^2 slash 4)  , Gamma(nu + 1)) integral_(0)^(infinity) t^nu exp(- x t - t^2  / 2) dif t.
  $ 
  ]
)


Recall the estimate for the Gamma function at large argument (from lecture): $ 
    Gamma(nu + 1) approx sqrt(2 pi nu) (nu / e)^nu .
$ <eq.sterling>

We read off the Laplace integral form with $Phi(t) = nu ln t - x t - t^2 / 2$: $ 
    J(nu) = integral_(0)^(infinity) e^(Phi(t)) dif t , quad D_(-nu-1)(x) = e^(-x^2 / 4) frac(J(nu) , Gamma(nu + 1)) . 
$ 

Examine $Phi(t)$, find stationary point with $ 
    Phi'(t) = nu / t - x - t = 0 &=> t^2 + x t - nu = 0 , quad t_0 = frac( -x + sqrt(x^2 + 4 nu) , 2 ) > 0 , 
$ 
which is an interior point ($t_0 ~ sqrt(nu) >> 0$). Further, $ 
    Phi''(t) = - nu / t^2 - 1 , quad Phi''(t_0) = - (2 + x / t_0 ) < 0 . 
$ 
Thus $t_0$ is a maximum in the interior. We expand around $t_0$: $ 
    Phi(t) approx Phi(t_0) + (1/2) Phi''(t_0) (t - t_0)^2 , quad Phi(t_0) = nu ln t_0 - nu / 2 - (x sqrt(x^2 + 4 nu))/4 . 
$ 
So $ 
    J(nu) approx e^(Phi(t_0)) integral_(-infinity)^(infinity) exp( (1/2) Phi''(t_0) (t - t_0)^2 ) dif t . 
$ 
Since this is an interior maximum far from $t=0$ (Gaussian width $~ 1 / sqrt( - Phi''(t_0) ) = O(1) << t_0$), we use the full Gaussian integral. Setting $u = sqrt( - Phi''(t_0) ) (t - t_0) , dif t = dif u / sqrt( - Phi''(t_0) )$, we have: $ 
    J(nu) approx e^(Phi(t_0)) sqrt( 2 pi / ( - Phi''(t_0) ) ) = e^(Phi(t_0)) sqrt( 2 pi / (2 + x / t_0 ) ) . 
$ 
Thus $ 
    D_(-nu-1)(x) approx frac( e^(-x^2 / 4) e^(Phi(t_0)) sqrt( 2 pi / (2 + x / t_0 ) ) , Gamma(nu + 1) ) 

#rect(inset: 8pt)[
$ display(  = frac( sqrt(2 pi) exp( nu ln t_0 - nu / 2 - (x sqrt(x^2 + 4 nu))/4 ) , sqrt(2 + x / t_0 ) Gamma(nu + 1) ) .)$
]
$ 




Applying Stirling's approximation (@eq.sterling), prefactor simplifies with $t_0 -> oo$ : $ sqrt(2 pi / (2 + x / t_0 )) ~ sqrt(pi) quad => sqrt(2 pi) / [ sqrt(2 + x / t_0 ) Gamma(nu + 1) ] ~ sqrt(pi) / sqrt(2 pi nu) = 1 / sqrt(2 nu). $

For the exponent, expand $t_0 ~ sqrt(nu) - x / 2$, yielding $nu ln t_0 ~ (nu / 2) ln nu - (x / 2) sqrt(nu)$ and $- x sqrt(x^2 + 4 nu) / 4 ~ - (x / 2) sqrt(nu)$. $
nu ln t_0 - nu / 2 - x sqrt(x^2 + 4 nu)/4 ~ (nu / 2) ln nu + nu / 2 - x sqrt(nu) + O(1)\
=>
    D_(-nu-1)(x) ~ 

#rect(inset: 8pt)[
$ display(    frac(1 , sqrt(2 nu) ) (e / nu)^(nu / 2) e^(- x sqrt(nu) ) .)$
]

$
A comparison plot between the asymptotic form and the exact integral is shown below (for $x = 1$ ).
#image("assets/2025-09-28-13-42-29.png")

