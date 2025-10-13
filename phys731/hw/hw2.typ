#set math.equation(numbering: "(1)")
#set page(margin: (x: 1cm, y: 0.1cm))
#import "@preview/physica:0.9.5": *
#set text(font: "Palatino Linotype", size: 11pt)
#place(top + right, rect(inset: 3pt)[Phy731|HW2|Harry Luo])

= P1 
#align(left, rect(inset: 5pt)[$
    L equiv alpha(x) (dif ^2 )/(dif ^2x ) + beta(x) (dif )/(dif x) + gamma(x).
  $
])
=== 1. Conditions for self-adjointness
We calculate for $braket(f, L g)$ and $braket(L f, g)$ separately, and observe $braket(f, L g) - braket(L f, g)$.

- $braket(f, L g)$: $
    braket(f, L g) &= integral_(-infinity)^infinity dif x f^*(x) [alpha g''(x) + beta g'(x) + gamma g(x)] \
                   & = underbrace(integral_(-infinity)^(infinity) f^* alpha g'' dif x, (1)) + underbrace(integral_(-infinity)^(infinity) f^* beta g' dif x, (2)) + integral_(-infinity)^infinity gamma dif x
  $ 

Integrating by parts for each term, we have $
  (1) = [f^* alpha g' - f'^* alpha g - f alpha' g]_(-infinity)^infinity + integral_(-infinity)^(infinity) (f''^* alpha + 2 f'^* alpha' + f^* alpha'')g dif x; \ 
  (2) = [f^* beta g]_(-infinity) ^infinity - integral_(-infinity)^(infinity) ( beta f'^* + beta' f^*) g dif x.
$ 
and thus $
  braket(f, L g) = [f^* alpha g' - f'^* alpha g - f^* alpha' g + f^* beta g]_(-infinity)^infinity + integral_(-infinity)^(infinity) [ alpha f''^* + (2 alpha' - beta) f'^* + ( alpha'' - beta' + gamma) f^*] g dif x.
$ 
In an almost exact same way, we work out $braket(L f, g)$ using integration by parts, we have $
  braket(L f, g) = [ alpha g g'^* - alpha g' f^* - alpha' g f^* + beta g f^*]_(-infinity)^infinity + integral_(-infinity)^(infinity) f^*[ alpha g'' + (2 alpha - beta)g' + ( alpha'' - beta' + c) g ] dif x.
$ 
Subtracting the two, and using the fact that $f^* g'' - f''^* g = (dif )/(dif x) (f^* g' - (f')^* g),$ we arrive at $
  braket(f, L g) - braket(L f, g) = [ alpha (f'^* g - f^* g')]_(-infinity)^infinity + integral_(-infinity)^(infinity) ( alpha'- beta) (f^* g' - f'^* g) dif x.
$ 
We observe that the condition for self-adjointness requires 
+ $ beta(x) = alpha'(x)$ ,
+ the boundary conditions $[ alpha (f'^* g - f^* g')]_(-infinity)^infinity = 0$ .

=== 2. The legendre operator is self adjoit on $[-1,1}$ 
We immediately read off that$
  alpha(x) = -(1-x^2 ), quad alpha'(x) = 2x, \ beta(x) = 2x, \ gamma(x) = 0 ,
$ and so $
  alpha(plus.minus 1) = 0 => [ alpha (f'^* g - f^* g')]_(-infinity)^infinity = 0, \ 
  beta(x) = alpha'(x) .
$ This is suffice to show that the Legendre operator is self-adjoint on $[-1,1]$, under the b.c. that $f,g$ are finite at $x = plus.minus 1$.

#pagebreak()

= P2 
=== 1. Show by induction that $[x_i,p_i^n] = n i hbar p_i^(n-1)$, and $[p_i, x_i^n] = -n i hbar x_i^(n-1)$ 
Recall that $[x_i, p_j] = i hbar delta_(i j)$.

- Base case ($n=1$): Trivially true, as $[x_i, p_i] = i hbar$ and $[p_i, x_i] = -i hbar$.

- Inductive case: Assume true for $n = k,$ i.e. $[x_i, p_i^k] = k i hbar p_i^(k-1)$ and $[p_i, x_i^k] = -k i hbar x_i^(k-1)$. We want to show true for $n = k+1$.

Notice that $
  [x_i, p_i^(k+1)] = [x_i, p_i^k p_i] = [x_i, p_i^k] p_i + p_i^k [x_i, p_i] = k i hbar p_i^(k-1) p_i + p_i^k i hbar = (k+1) i hbar p_i^k, \ 
  [p_i, x_i^(k+1)] = [p_i, x_i^k x_i] = [p_i, x_i^k] x_i + x_i^k [p_i, x_i] = -k i hbar x_i^(k-1) x_i + x_i^k (-i hbar) = -(k+1) i hbar x_i^k.
$ 
Then by induction, we have $[x_i,p_i^n] = n i hbar p_i^(n-1)$ and $[p_i, x_i^n] = -n i hbar x_i^(n-1)$ for all positive integers $n$.

=== 2. Use the result in (1) to show that $[x_i, G(p_i)] = i hbar (partial G)/(partial p_i)$ and $[p_i, F(x_i)] = -i hbar (partial F)/(partial x_i)$ for any analytic functions $F$ and $G$.

Proof:
Expand $G( bold(p)) = sum_(m) a_m product_r p_r^(m_r) $. Then $
  [x_i, G( bold(p)] = sum_(m) a_m [x_i, product_r p_r^(m_r)] ,
$ 
where $
  [x_i, product_r p_r^(m_r)] &= product_(r eq.not i) p_r^(m_r) [x_i, p_i^(m_i-1)] \ 
                             & = product_(r eq.not i) p_r^(m_r) m_i i hbar p_i^(m_i-1) \
  =>
  [x_i, G( bold(p))]         &= i hbar sum_(m) m_i p_i^(m_i-1) product_(r eq.not i)p_r^(m_r) \
                             & = i hbar sum_(m) a_m (partial)/(partial p_i) (product_r p_r^(m_r)) = i hbar (partial G( bold(p)))/(partial p_i).
$ #h(1fr) $qed$

Similarly, expanding $F( bold(x)) = sum_(m) a_m product_r x_r^(m_r), $ we can show that $
  [p_i, F( bold(x))] &= sum_(m)a_m [p_i, product_r x_r^(m_r)]
$ where $
  [p_i, product_r x_r^(m_r)] &= product_(r eq.not i) x_r^(m_r) [p_i, x_i^(m_i)] \ 
                             & = product_(r eq.not i) x_r^(m_r) (-m_i i hbar x_i^(m_i-1)) \
  =>
  [p_i, F( bold(x))]         &= -i hbar sum_(m) a_m m_i x_i^(m_i-1) product_(r eq.not i)x_r^(m_r) \
                             & = -i hbar sum_(m) a_m (partial)/(partial x_i) (product_r x_r^(m_r)) = -i hbar (partial F( bold(x)))/(partial x_i).
$ #h(1fr) $qed$
 
=== 3. Comparing $[x^2 , p^2 ]$ with ${x^2 , p^2 }$.
We first work out $ [x_i, p^2 ]$, with $p^2 = sum_(j) p_j^2 $ : $
  [x_i, p^2 ] sum_(j)( p_j [ x_i, p_j] + [x_i, p_j] p_j) = sum_(j) (p_j i hbar delta_(i j) + i hbar delta_(i j) p_j) = 2 i hbar p_i.
$ Then, we have $
  [x^2 , p^2 ] &= [ sum_(i) x_i^2 , p^2 ] \ 
               & = sum_(i) (x_i [x_i, p^2 ] + [x_i, p^2] x_i \
    & = sum_(i)(x_i 2 h i hbar p_i + 2 i hbar p_i x_i) \
    & = 2 i hbar sum_(i)(x_i p_i + p_i x_i) \
    & = 2 i hbar ( bold(x) dot bold(p) + bold(p) dot bold(x)).
$ 

On the other hand, $
  {x^2 , p^2 } = sum_i (partial_x_i x^2 dot partial_p_i p^2 - partial_p_i x^2 dot partial_x_i p^2 ) = sum_i (2 x_i dot 2 p_i - 0) = 4 bold(x) dot bold(p).
$ 
Now, notice that if we define a mapping s.t. $
  bold(x) dot bold(p) mapsto 1/2 ( bold(x) dot bold(p) + bold(p) dot bold(x)),
$ then we can relate the poisson bracket to the commutator by $
  i hbar {x^2 , p^2 } mapsto 1 hbar dot 4 dot 1/2 ( bold(x) dot bold(p) + bold(p) dot bold(x))= [x^2 , p^2 ].
$ 




#pagebreak()
= P3
#align(left, rect(inset: 5pt)[Consider $
    T( bold(l)) = exp(frac(-i bold(p) dot bold(l), hbar)),
  $
])
=== 1. Find $[x_i, T( bold(l))]$ .

Using the result in P2(2), taking $G( bold(p)) = exp(frac(-i bold(p) dot bold(l), hbar))$, we have $
  [x_i, T( bold(l))] = i hbar (partial)/(partial p_i) ( exp(frac(-i bold(p) dot bold(l), hbar))) = i hbar exp(frac(-i bold(p) dot bold(l), hbar)) frac(-i l_i, hbar) = l_i T( bold(l)).
$Notice that $
  [x_i, T( bold(l))] = x_i T( bold(l)) - T( bold(l)) x_i = l_i T( bold(l)) 
  \ => T^dagger(bold(l)) x_i T( bold(l)) = x_i + l_i.
$ 
=== 2.
From this, we see that $
  expectationvalue(x_i') = braket(alpha, x_i', alpha) = braket(alpha, T^dagger(bold(l)) x_i T( bold(l)), alpha) = braket(alpha, (x_i + l_i) alpha) = expectationvalue(x_i) + l_i.
$ 

#pagebreak()
= P4 
#align(
  left,
  rect(
    inset: 5pt,
  )[Using identity below and $x ket(x')= x' ket(x'), med p ket(p') = p' ket(p); $ find $bra(x) [x,p] ket(alpha)$ in terms of $psi_alpha (x) = braket(x, alpha)$$
      braket(x, p) = frac(1, 2 pi hbar) exp(frac(i p x, hbar)).
    $
  ],
)
=== 1. Brute force using the Fourier transform relation 
$braket(x, [hat(x),hat(p)], alpha) =underbrace(braket(x, hat(x) hat(p), alpha), (1)) - underbrace((x,hat(p) hat(x),alpha), (2)) $ . We denote $N = 2 pi hbar.$ 
$
  (1) &= integral braket(x, hat(x)hat(p), p')braket(p', alpha) dif p' \ 
      & = integral braket(x, hat(x) p', p') braket(p', alpha) dif p' \
      & = integral braket(x, hat(x) p', p') braket(p', x')braket(x', alpha) dif p' dif x' \
      &=p' x integral braket(x, p')braket(p', x')braket(x', alpha) dif p' dif x' \
      & = x p' integral 1/N exp(i p' x slash hbar) 1/N exp(- i p' x' slash hbar) psi_alpha (x') dif p' dif x' \
      & = x p' integral 1/N^2 exp(i p' (x-x') slash hbar) psi_alpha (x') dif p' dif x'.
$ 
Noticing $ 1/N integral exp((i p (x-x')) / hbar) p dif p = - i hbar partial_x delta(x-x'), $ we simplify (1) to $
  (1)= - i hbar x partial_x integral delta(x-x') psi_alpha (x') dif x' = - i hbar x psi'_alpha (x).
$ 
Similarly, $
  (2) = integral braket(x, hat(p), p')braket(p', hat(x), alpha) dif p' \ 
    & = p' integral braket(x, p')braket(p', hat(x), alpha) dif p' \
    & = p' integral braket(x, p') braket(p', hat(x), x') braket(x', alpha) dif p' dif x' \
    & = p' x' integral braket(x, p')braket(p', x')psi_alpha (x') dif p' dif x' \
    & = p' x' integral 1/N e^(i p' x slash hbar) 1/N e^(- i p' x' hbar) psi_alpha (x') dif p' dif x' \
    & = x' p' integral 1/N^2 e^(i p' (x-x') slash hbar) dif p' dif x' \
    & = - i hbar partial_x integral delta(x-x') x' psi_alpha (x') dif x' \
    & = - i hbar (psi(alpha) + x psi'(alpha))
$ 
Subtracting, we have $
  braket(x, [hat(x),hat(p)], alpha) = (1) - (2) = - i hbar x psi'_alpha (x) + i hbar (psi_alpha (x) + x psi'_alpha (x)) = i hbar psi_alpha (x).
$ 
=== 2. Using the fact that in $ket(x)$ representation, $p = -i hbar partial_x$.
We simply make expansions and arrive at $
  braket(x, [x,p], alpha)&= braket(x, x med i hbar partial_x - i hbar partial_x med x, alpha) = x (- i hbar partial_x psi_alpha (x)) - (- i hbar partial_x (x psi_alpha (x))) \ 
                         & = - i hbar x partial_x psi_alpha (x) + i hbar psi_alpha (x) + i hbar x partial_x psi_alpha(x) = i hbar psi_alpha (x).
$ 


#pagebreak()
= P5
#align(left, rect(inset: 5pt)[The ground state positiion space wavefunction of the Hydrogen atom is $
    psi_(1s)( bold(x)) = braket(bold(x), 1s) = frac(1, sqrt(pi a_0^3)) exp(- r slash a_0).
  $
])
=== 1. Find $psi_(1s)( bold(p)).$ 
We first prove the following identity: $
  integral_RR_3 e^(-i bold(q) dot bold(x)) f(r) dif^3 r&=integral_0^infinity r^2 f(r) dif r integral_(0)^(pi) sin theta e^(-i q r cos theta) dif theta integral_(0)^(2pi) dif phi \ &=_(u equiv cos theta) 2 pi integral_(0)^(infinity) r^2 f(r) dif r integral_(-1)^(1) e^(- i q r u) dif u \ & = 4 pi integral_(0)^(infinity) r^2 f(r) sin(q r)/(q r) dif r \ &= (4pi)/q integral_(0)^(infinity) f(r) sin(q r)r dif r
$ 
We then consider $psi(bold(p))$ using fourier transform: $
  psi(bold(p))= braket(bold(p), 1s) = integral braket(bold(p), bold(x)) braket(bold(x), 1s) dif^3 x = 1/(2 pi hbar)^(3/2) integral e^(-i bold(p) dot bold(x) slash hbar) psi_(1s)( bold(x)) dif^3 x.
$ 
Taking $f(r) = psi_(1s) (r), q = p/hbar, N =(2 pi hbar)^(3/2)$ we can use the identity above to yield: $
  psi_(1s) ( bold(p)) &= 1/N (4 pi)/q integral_0^infinity r psi_(1s)(r) sin(q r) dif r \ 
                      & = frac(4 pi, N) 1/(sqrt(pi a_0^3) ) 1/q integral_(0)^(infinity) r e^(- r / a_0) sin(q r) dif r,
$ 
where we use #smallcaps("Mathematica") to find$
  integral_(0)^(infinity) r e^(- alpha r) sin(beta r) dif r = frac(2 alpha beta, (alpha^2 + beta^2)^2) , quad alpha, beta in RR
$ 
Having $alpha = 1/a_0, beta = q = p/hbar,$ we have $
  psi_(1s) ( bold(p)) &= frac(4 pi, N) frac(1, sqrt(pi a_0^3)) 1/q frac(2 (1/a_0) q, ((1/a_0)^2 + q^2)^2) \ 
                      & = frac(8 pi, N) frac(1, sqrt(pi (a_0)^3)) frac(1 slash a_0, ((1 slash a_0)^2 + (p slash hbar)^2)^2) .
$

=== 2. find $expval(bold(p)), expectationvalue(abs(bold(p))) $.

Considering spherical symmetry, we have $
  expval(bold(p)) = integral_RR_3 bold(p) |psi_(1s)( bold(p))|^2 dif^3 p = 0.
$

While $
  expectationvalue(abs(bold(p))) = integral_RR^3 p abs(psi_(1s)(p))^2 dif^3 p = 4 pi integral_(0)^(infinity) p^2 abs(psi_(1s)(p))^2 dif p.
$ 
Take $y = a_0 p slash hbar, dif p = hbar slash a_0 dif y.$
Then $
  expectationvalue(abs(bold(p))) &= 4pi 8/pi^2 (a_0/hbar)^3 integral_(0)^(infinity) frac(p^3, (1+y^2 )^4) dif p = 8/(3pi) hbar/a_0.
$ 
 
#pagebreak()
= P6
#align(
  left,
  rect(
    inset: 5pt,
  )[Find $expval((Delta x)^2) expectationvalue((Delta p)^2)$ for a particle in a 1d infinite square well for the n-th eigenstate of potential, and find numerical result for ground and first state. ],
)
For odd n, we have $
  psi_n (x) = 1/sqrt(a) cos(frac(n pi, 2a) x).
$ 
and for even n, we have $
  psi_n (x) = 1/sqrt(a) sin(frac(n pi, 2a) x).
$
We work out each term in $(Delta x))^2 = expectationvalue(x^2) - expectationvalue(x)^2 , (Delta p)^2 = expectationvalue(p^2)- expectationvalue(p)^2 $ separately.
1. $expval(x)= integral_(-a)^a x abs(psi_n (x)^2) dif x = 0$ as the integrand is odd.
2. For $expval(x^2)$: odd n: $psi_n = 1/sqrt(a) cos(n pi x slash 2 a.) $; even n: $psi_n = 1/sqrt(a) sin(n pi x slash 2 a).$
Notice $abs(psi_n)$ is same for both cases, and so $
  integral_(-a)^(a) x^2 abs(psi_n (x))^2 dif x= integral_(-a)^(a) x^2 abs(cos^2 (frac(n pi, 2 a) x)) dif x = underbrace(1/2 integral_(-a)^(a) x^2 dif x, 2a^3 slash 3.)+ underbrace(1/2 integral_(-a)^(a) x^2 abs(cos(frac(n pi, a) x)) dif x, star).
$ where taking $ beta = n pi slash a,$ $ star = 
frac(4a cos(beta a), beta^2) =abs(frac(4 a^3 (-1)^n, n^2 pi^2)) $ and so $
  expectationvalue(x^2)= 1/a (a^3/3 - frac(2 a^3, n^2 pi^2) ) = a^2 (1/3 - frac(2, pi^2 n^2) ).
$ 

 

Then , consider momemtum: $
  expectationvalue(p) = integral_(-a)^(a) psi^*_n (- i hbar partial_x)psi_n dif x = - i hbar/2 [psi_n^2 (x)]_(-a)^(a) = 0;
$ 
 
$
  expectationvalue(p^2) &= integral_(-a)^(a) psi_n^* (x) hat(p)^2 psi_n (x) dif x \ 
                        & = integral_(-a)^(a) psi_n^*(x) ( -hbar^2 (dif ^2 )/(dif ^2 ) psi_n (x) ) dif x \
                        & = - hbar^2 integral_(-a)^(a) psi_n^* psi''_n (x) dif x
$ 
Notice that $ - hbar^2 /(2m) psi''_n (x) = E_n psi_n (x) => psi''_n (x) = -k_n^2 psi_n (x), quad k_n = n pi slash 2a $ 

and so $
  expectationvalue(p^2)= hbar^2 k_n^2 integral abs(psi_n)^2 dif x = hbar^2 k_n^2 = hbar^2 (n pi slash 2a)^2 .
$ 
and so $
  expectationvalue((Delta x)^2) expectationvalue((Delta p)^2) = hbar^2 /4 (frac(pi^2 n^2, 3) -2).
$ 
 
$
  n=1: 1.28987 hbar^2 /4; quad n=2: 11.1595 hbar^2 /4.
$ 



