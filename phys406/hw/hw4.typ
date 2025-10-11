#set math.equation(numbering: "(1)")
#set page(margin: (x: 1.2cm, y: 1cm),numbering: "1/1")
#import "@preview/physica:0.9.6": *
#place(top + right, rect(inset: 3pt)[Phy406 hw4
])
= 1
#align(
  left,
  rect(inset: 8pt)[Use Frobenius ansatz to the Hermite equation $ 
  y'' - 2x y' + 2 n y = 0 
  $ 
  Derive indicial equation, derive recursion relation between the expansion coefficient, and construct
several polynomials ]
)
Let $y = sum_(k=0)^(infinity) a_k x^(k+r)$ with $a_0 != 0$. We have the derivatives:
$ 
y' = sum_(k=0)^(infinity) (k+r) a_k x^(k+r-1); quad y'' = sum_(k=0)^(infinity) (k+r)(k+r-1) a_k x^(k+r-2).
$ 
Plugging into the Hermite equation:
$ 
0 = sum_(k=0)^(infinity) (k+r) (k+r-1) a_k x^(k+r-2) - 2x sum_(k=0)^(infinity) (k +r) a_k x^(k+r-1) + 2n sum_(k=0)^(infinity) a_k x^(k+r).
$ 
To find the indicial equation and recursion relation, we require the sum of the coefficients of each power of $x$ to be zero. Let's isolate the first few terms after re-indexing the first sum:
$

r(r-1) a_0 x^(r-2) + (r+1)r a_1 x^(r-1) + sum_(k=0)^(infinity) [ (k+r + 2) (k+r+1) a_(k+2) - 2(k+r)a_k + 2n a_k ] x^(k+r) = 0;
$
The coefficient of the lowest power of $x$ (i.e., $x^(r-2)$) gives the indicial equation:
$ 
r(r-1) = 0 ==> r = 0 " or " 1. 
$ 
Imposing the coefficient of $x^(r-1)$ to be zero gives $(r+1)r a_1 = 0$. This implies $a_1=0$ when $r=1$. The rest of the terms give the recursion relation:
$
#rect(inset: 8pt)[
$ display(a_(k+2) = frac(2(k+r-n),(k+r+2)(k+r+1)) a_k ,)$
]
 quad (r=0 " or " r=1 , k = 0,1,2,...)
$
For $r = 0,$ the recursion relation becomes $ 
a_(k+2) = frac(2 (k-n) ,(k+2)(k+1) ) a_k.  
$ 
Starting with $a_0,$ we have $ 
a_2 = -n a_0, quad a_4 = -frac(n(2-n) , 6) a_0, quad a_6 = frac(n (n-2) (n-4) , 90) a_0, dots  
$ we can write this into $ y_"even" = a_0(1- n x^2  + frac(n(n-2) , 6) x^4- dots) $

Similarly, starting with $a_1,$ we can write $ y_"odd" = a_1(x+frac(1-n , 3) x^3 + frac((1-n)(3-n) ,30 )x^5+dots ) $ 
and a general solution for $r=0$ is $ y = y_"even" + y_"odd" .$
We notice that $r=1$ gives the same series solution with leading constant $a_0$ instead of $a_1.$ It is therefore sufficient to consider only $r=0$.

We notice that the recursion terminates on $k-n = 0 => k = n.$ 

Now consider $H_1 (x)$ with $n=1$. Recursion : $
a_(k+2) = frac(2 (k-1) , (k+2)(k+1)) a_k.
$ Odd $n$ gaurantees finite $y_"odd"$ polynomial, so to get finite polynomial solution, we kill $y_"even"$ by setting $a_0 = 0$. We thus have $ y = a_1 x + frac(1-1 , 3) a_1 x^3 = a_1 x . $ Convintionally, we set leading coefficient $a_1 = 2^n = 2,$ and the Hermite polynomial to the first order is thus $
#rect(inset: 8pt)[
$ display( H_1 (x) = 2x. )$
]
$

Similarly, consider $H_2 (x)$ with $n=2$. Recursion : $ 
a_(k+2) = frac(2 (k-2) , (k+2)(k+1)) a_k. 
$ 
Even $n$ gaurantees finite $y_"even"$ polynomial, so to get finite polynomial solution, we kill $y_"od"$ by setting $a_1 = 0$. We thus have $ y = a_0 - 2a_0 x^2 . $  Convintionally, we set leading coefficient $-2 a_0 = 2^n = 4,$ and the Hermite polynomial to the second order is thus $ 
#rect(inset: 8pt)[
$ display(H_2 (x) = 4x^2 -2. )$
]
$ 

We can continue to read off several more: $H_3 (x) = 8x^3 - 12x, H_4(x) = 16 x^4 - 48 x^2  + 12.$ 

#pagebreak()
= 2
#align(
  left,
  rect(inset: 8pt)[Apply Frobenius method around $x=0$ to the Legendre equation $ 
  (1-x^2 )y'' - 2x y' + n(n+1) y = 0 .
  $ 
  ]
)
Let $y = sum_(k=0)^(infinity) a_k x^(k+r)  $ . Plugging into the Legendre equation, we have $ 
0 = (1-x^2 )sum_(k=0)^(infinity) (k+r)(k+r-1) a_k x^(k+r-2) - 2x sum_(k=0)^(infinity) (k+r) a_k x^(k+r-1) + n(n+1) sum_(k=0)^(infinity) a_k x^(k+r). 
$ 
We re-index the first and second term, and isolate the first few terms to match the summation bounds: $ 
0 = r(r-1)a_0 x^(r-2) +r(r+1) a_1 x^(r-1)+ sum_(0)^(infinity) x^(k+r) [&(k+r+2)(k+r+1)a_(k+2)\ &- (k+r)(k+r-1)a_k - 2(k+r)a_k + n(n+1)a_k]   
$ 
Imposing the coefficient of the lowest power of $x$ (i.e., $x^(r-2)$) to be zero gives the indicial equation: $ r(r-1) = 0 ==> r = 0 " or " 1. $
Imposing the coefficient of $x^(r-1)$ to be zero gives $ a_1= 0$ when $r=1$. The rest of the terms give the recursion relation: $ 
a_(k+2) = frac((k+r)(k+r+1)- n(n+1) ,(k+r+2)(k+r+1) )a_k , quad (r=0 " or " r=1 ; k = 0,1,2,...)  
$ 

We consider the case $r=0$. (the case $r=1$ gives redundant solutions of odd series only. ) The recursion relation becomes$ 
#rect(inset: 8pt)[
$ display( a_(k+2) = frac(k(k+1) - n(n+1) , (k+2)(k+1)) a_k ,)$
]

$ 
and the termination condition is $ k(k+1) - n(n+1) = 0 ==> k = n. $
We consider $P_1(x)$ with $n=1.$ Odd $n$ gaurantees the odd series terminate, so kill even series with $a_0 equiv 0.$ We then have $y = a_1 x$. Convintionally, normalization is set so that $P_n (1) = 1 => a_1=1$.  Thus $ 
#rect(inset: 8pt)[
$ display(P_1 (x) = x.)$
]
 $ 

Similarly, for $P_2(x)$ with $n=2,$ even series terminate, so kill odd series with $a_1 equiv 0.$ We then have $a_2 = -3 a_0$, and $y = a_0 (1 - 3 x^2).$ Convintionally, normalization is set so that $P_n (1) = 1 => a_0 = - 1/2.$ Thus $
#rect(inset: 8pt)[
$ display( P_2 (x) = - 1/2 (3x^2 -1) .)$
]
 $ 

#pagebreak()
= 3
#align(
  left,
  rect(inset: 8pt)[Apply Frobenius method around $x=0$  to the Lauguerre equation $ 
  x y'' + (1-x)y' + n y = 0,
  $ where $n$ is a non-negative integer. Find Lauguerre polynomials $L_n (x)$ for several low orders $n$
  ]
)
Let $y = sum_(k=0)^(infinity) a_k x^(k+r)   $. Plugging in, we have $ 
sum_(k=0)^(infinity) (k+r) (k+r-1)a_k x^(k+r-1) + sum_(0)^(infinity) (k+r) a_k x^(k+r-1) - sum_(k=0)^(infinity) (k+r) a_k x^(k+r) +n sum_(k=0)^(infinity) a_k x^(k+r) =0  
$ 
Re-indexing the first two sums and isolating the first few terms, we have $ 
r(r-1) a_0 x^(r-1) + sum_(k=0)^(infinity) (k+r+1) (k+r)a_(k+1) x^(k+r) +r a_0 x^(r-1) +& sum_(k=0)^(infinity) (k+r+1) a_(k+a) x^(k+r) \ &- sum_(k=0)^(infinity) (k+r) a_k x^(k+r) + n sum_(k=0)^(infinity) a_k x^(k+r) = 0
$ 

Imposing the coefficient of the lowest power of $x$ (i.e., $x^(r-1)$) to be zero gives the indicial equation: $ r^2 = 0 ==> r = 0. $
The rest of the terms give the recursion relation: $ 
a_(k+1) = frac(k+r-n , (k+r+1)^2 )a_k =^(r=0) 
#rect(inset: 8pt)[
$ display(frac(k-n , (k+1)^2 ) a_k )$
]
, quad (k=0,1,2,...)   
$ 
From which we see that the series terminates when $ k-n = 0 ==> k = n. $
Consider $L_1(x):$ $n=1.$ $a_1 = (0-1)/1 a_0 = -a_0$ and so $y = a_0(1-x)$. Conventional normalization sets $L_n (0) = 1 => a_0 = 1.$ Thus 
$ 
#rect(inset: 8pt)[
$ display(L_1 (x) = 1-x. )$
]
$

Similarly, $L_2(x)$ is given by $n=2.$ $a_1 = (0-2)/1 a_0 = -2 a_0$ and $a_2 = (1-2)/4 a_1 = 1/2 a_0.$ Thus $y = a_0(1 - 2x + 1/2 x^2).$ Conventional normalization sets $L_n (0) = 1 => a_0 = 1.$ Thus $ 
#rect(inset: 8pt)[
$ display(L_2 (x) = 1 - 2x + 1/2 x^2. )$
]
$ 

#pagebreak()
= 4
#align(
  left,
  rect(inset: 8pt)[Consider the Bessel equation with order $nu = 0$$ 
  x^2  y'' + x y' + (x^2 -nu^2 )y = 0. 
  $ Show that the indicial equation has degenreate roots by construct explicitly the Bessel function $J_0(x)$ using Frobenius method. Then, use $y = J_0(x) ln(x)+ sum_(k>=0) b_k x^k$ to find the second linearly independenly solution. Compare with the Bessel function of the second kind $Y_0(x)$.  
  ]
)
We use the regular Frobenius ansatz $y = sum_(k=0)^(infinity) a_k x^(k+r)  $ .  Plugging into the Bessel equation with $nu=0$ , we have $ 
x^2 sum_(k=0)^(infinity) (k+r)(k+r-1) a_k x^(k+r-2) + x sum_(k=0)^(infinity) (k+r) a_k x^(k+r-1) + (x^2 ) sum_(k=0)^(infinity) a_k x^(k+r) = 0.
$ Matching the indicies, we have $ 
sum_(k=0)^(infinity) (k+r) (k+r-1)a_k x^(k+r) + sum_(k=0)^(infinity) (k+r) a_k x^(k+r) + sum_(k=0)^(infinity) a_k x^(k+r+2) =0\ 

sum_(k=0)^(infinity) (k+r)^2 a_k x^(k+r) + sum_(k=2)^(infinity) a_(k-2) x^(k+r)   =0 
$ 
For $k = 0,$ we read off the indicial equation: $ r^2 = 0 ==> r = 0. $ For $k=1,$ we have $ a_1 = 0,$ gaurantees odd terms vanish.
The rest of the terms give the recursion relation: $
a_(k+2) = - frac(1 , (k+r+2)^2 ) a_k =^(r=0) - frac(1 , (k+2)^2 ) a_k , quad (k=0,1,2,...)  
$
Let $k=2m$, the recursion relation gives $ 
a_(2m) = a_0 (-1)^m frac(1 , 2^(2m) (m!)^2 ); quad J_0(x) = sum_(m=0)^(infinity) a_(2m) x^(2m) .  
$ 
 and so the first solution is (choosing $a_0=1$ ) :$ 
#rect(inset: 8pt)[
$ display( J_0(x) = sum_(m=0)^(infinity) (-1)^m frac(x^(2m)  , 2^(2m) (m!)^2 )   )$
]

 $ 
#line(length: 100%) ///////////////////////////
For the second solution, take the Frobenius-log ansatz
$
y_2(x) = J_0(x) ln x + S(x), quad S(x) = sum_(k=0)^(infinity) b_k x^k .
$


Differentiate:
$
y_2' = J_0' ln x + frac(J_0, x) + S'; quad y_2'' = J_0'' ln x + frac(2 J_0', x) - frac(J_0, x^2) + S'' .
$
Plug into $x^2 y'' + x y' + x^2 y = 0$. The $ln x$-terms cancel because $J_0$ solves the ODE, and the non-$ln x$ terms give
$
 x^2 S'' + x S' + x^2 S + 2 x J_0' = 0 .
$

Now expand in series. With $S = sum_(k >= 0) b_k x^k$ and
$
2 x J'_0(x) = sum_(m=1)^(infinity) frac(4 m (-1)^m, 2^(2 m) (m!)^2 ) x^(2 m) ,
$
equating the coefficient of $x^k$ yields, for $k >= 2$,
$
k^2 b_k + b_(k-2) + cases(
  frac(4 m (-1)^m, 2^(2 m) (m!)^2 ) quad k = 2 m ,
  0 quad (k "odd") ,
) quad quad= 0 ,
$
and from the $x^1$ term we get $b_1 = 0$. By induction, all odd coefficients vanish, $b_(2 m + 1) = 0$.

Thus it suffices to work with even indices. For $m >= 1$,
$
 4 m^2 b_(2 m) + b_(2 m - 2) + frac(4 m (-1)^m, 2^(2 m) (m!)^2 ) = 0 .
$<eq.4.1>

Introduce (ingenious insight from GPT)
$
 d_m := (-1)^m 2^(2 m) (m!)^2 b_(2 m) quad (m >= 0) .
$
Multiplying @eq.4.1 by $(-1)^m 2^(2 m) (m!)^2$ gives
$
4 m^2 d_m - 4 m^2 d_(m-1) + 4 m = 0 quad => quad  d_m - d_(m-1) = - frac(1, m)  quad (m >= 1) .
$
Hence
$
 d_m = d_0 - H_m , quad H_m := sum_(j=1)^m frac(1, j) ; quad H_0 := 0 .
$

Undoing the substitution,
$
 b_(2 m) = frac((-1)^m, 2^(2 m) (m!)^2 ) (d_0 - H_m ) , quad b_(2 m + 1) = 0 .
$
Now, rewrite
$
S(x) =& sum_(m=0)^(infinity) b_(2 m) x^(2 m) = sum_(m=0)^(infinity) frac((-1)^m, 2^(2 m) (m!)^2 ) (d_0 - H_m ) x^(2 m) \
=& d_0 underbrace(sum_(m=0)^(infinity) frac((-1)^m, 2^(2 m) (m!)^2 ) x^(2 m) , J_0(x) ) 
- sum_(m=1)^(infinity) frac((-1)^m H_m, 2^(2 m) (m!)^2 ) x^(2 m) .
$
Therefore
$
#rect(inset: 8pt)[
$ display(y_2(x) = J_0(x) (ln x + d_0 ) - sum_(m=1)^(infinity) frac((-1)^m H_m, 2^(2 m) (m!)^2 ) x^(2 m)  .)$
]

$



The standard small-$x$ expansion of the Neumann function is (cite #underline(link("https://dlmf.nist.gov/10.8#E2")[DLMF 10.8.2]))
$
 Y_0(x) = frac(2, pi) ( ln frac(x, 2) + gamma) J_0(x) + frac(2, pi) sum_(m=1)^(infinity) frac((-1)^(m+1) H_m, 2^(2 m) (m!)^2 ) x^(2 m) .
$<eq.dagger>
Compare this with our $y_2$. Choose
$
d_0 = gamma + ln frac(1, 2)  quad med s.t. med quad ln x + d_0 = ln frac(x, 2) + gamma ,
$
and then define $Y_0$ simply by scaling:
$
 Y_0(x) = frac(2, pi ) y_2(x) .
$
With this choice,
$
frac(2, pi ) y_2(x) = frac(2, pi ) ( ln frac(x, 2) + gamma ) J_0(x) - frac(2, pi ) sum_(m=1)^(infinity) frac((-1)^m H_m, 2^(2 m) (m!)^2 ) x^(2 m) ,
$
which matches @eq.dagger term-by-term because $-(-1)^m = (-1)^(m+1)$.


#pagebreak()
= 5
#align(
  left,
  rect(inset: 8pt)[Solve the Airy function using Frobenius method to obtain two linearly independent series solutions $ 
  y'' - x y = 0 
  $ 
  ]
)
Let $y = sum_(k=0)^(infinity) a_k x^(k+r)  $ , substitution gives $ 
sum_(k=0)^(infinity) (k+r) (k+r-1) a_k x^(k+r-2)- sum_(k=0)^(infinity) (k+r) a_k x^(k+r+1) =0   
$ 
Reindexing the second term: $ 
sum_(k=0)^(infinity) (k+r) (k+r-1)a_k x^(k+r-2) - sum_(k=3)^(infinity) (k+r-3) a_(k-3) a_(k-3) x^(k+r-2)=0.  
$ 
Now match coefficients of each power $x^(k+r-2)$:

- For $k=0$: $r(r-1) a_0 = 0 ==> #rect[$r= 0 "or" 1$]$.
- For $k=1$: $(r+1) r a_1 = 0$.
- For $k=2$: $(r+2)(r+1) a_2 = 0  ==> #rect[$a_2 = 0$]$.
- For $k >= 3$: $(k+r)(k+r-1) a_k - a_(k-3) = 0$, and from which we reveal the recursion relation: 
  $ 
   a_k = frac(a_(k-3), (k+r)(k+r-1) ) , quad k >= 3 
  $ 
We investigate the two roots of the indicial equation separately.
- *Branch $r=0$* (Ordinary Power Series)

The head constraints for $k=1,2$ give no restriction on $a_1$ but force $a_2=0$. Thus two free seeds $a_0$ and $a_1$ generate two decoupled subsequences (due to the step-3 recurrence):

From $a_0$: $a_3 = frac(a_0, 3 dot 2 ) = frac(a_0, 6 )$, $a_6 = frac(a_3, 6 dot 5 ) = frac(a_0, 180 )$, etc. (indices $0,3,6, dots$).

From $a_1$: $a_4 = frac(a_1, 4 dot 3 ) = frac(a_1, 12 )$, $a_7 = frac(a_4, 7 dot 6 ) = frac(a_1, 504 )$, etc. (indices $1,4,7, dots$).

Hence
$
y(x) = a_0 ( 1 + frac(x^3, 3! 2! ) + frac(x^6, 6! 5! ) + dots  ) + a_1  ( x + frac(x^4, 4! 3! ) + frac(x^7, 7! 6! ) + dots   ) ,
$<eq.5>
since $3 dot 2 = 3! / 1!$, $6 dot 5 = 6! / 4!$, etc.

- *Branch $r=1$*: The head constraints give $a_1 = a_2 = 0$. The recurrence then produces the same “$1 mod 3$” subsequence as taking $r=0$ with $a_1 != 0$. Thus it does not yield an independent solution beyond the two already obtained from $r=0$. 



Comparing @eq.5  to the standard Airy functions Ai(x) and Bi(x), we see that they are specific choices of these constants, selected for their distinct asymptotic behaviors.

If we choose the normalization constants
$
a_0 = frac(1, 3^(2/3) Gamma(2/3)) quad "and" quad a_1 = -frac(1, 3^(1/3) Gamma(1/3)) ,
$
we can arrive at the specific solution:
$
y(x) = frac(1, 3^(2/3) Gamma(2/3)) ( 1 + ... ) - frac(1, 3^(1/3) Gamma(1/3)) ( x + ... ) .
$
This combination matches the definition of the *Airy function of the first kind*, $"Ai"(x)$.

Alternatively, if we choose the constants
$
a_0 = frac(1, 3^(2/3) Gamma(2/3)) quad "and" quad a_1 = frac(1, 3^(1/3) Gamma(1/3)) ,
$
we can arrive at the specific solution:
$
y(x) = frac(1, 3^(2/3) Gamma(2/3)) ( 1 + ... ) + frac(1, 3^(1/3) Gamma(1/3)) ( x + ... ) .
$
Which matches the definition of the *Airy function of the second kind*, $"Bi"(x)$.