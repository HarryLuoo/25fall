#set math.equation(numbering: "(1)")
#set page(margin: (x: 1cm, y: 0.7cm))
#import "@preview/physica:0.9.5": *
#place(top + right, rect(inset: 3pt)[Physics731 HW1|Harry Luo])

= P1 
#rect(inset: 8pt)[ Let $
 display( X = a_0 II + sum_(k=1)^(3) sigma_k a_k ),
$ where $sigma_k$ are pauli matrices and $a_0, a_1$ are numbers. ]

== 1. $Tr X$ and $Tr(sigma_k X).$  
Noticing pauli matrices are traceless: $ 
    Tr(X) = Tr(a_0 II)+ Tr(sum_k sigma_k a_k) = 2a_0 .
$ 
Then consider $ 
    Tr(sigma_k X) &= Tr(a_0 sigma_k II) + Tr(sum_j sigma_k sigma_j) \ 
    & = 0 + sum_(j) a_j Tr(sigma_j sigma_k).  
$ 
Using the fact that $Tr(sigma_j sigma_k) = 2 delta_(j k):$
$ 
    Tr(sigma_k X) = sum_(k=1)^(3) a_k dot   2 delta_(j k) = 2 a_k.
$ 
 == 2. Find $a_0, a_k$ w.r.t. $X_(i j).$
Write $ 
    X_(i j) = a_0 delta_(i j)+ sum_(k=1)^(3) ((sigma_k)_(i j) a_k).  
$ 
Then for diagonal elements: $ 
X_(i i) = a_0 +(sigma_3)_(i i) a_3, \ =>
    X_(1 1) = a_0 + a_3, quad  X_(2 2) = a_0 - a_3
    \ => cases(a_0 = 1/2 (X_(11) + X_(22)), a_3 = 1/2(X_(11) - X_(22))).
$ 
Off diagonal elements: for $m eq.not n: $ $ 
X_(m n) = sigma_1_(m n) a_1 + sigma_2_(m n) a_2 \ =>
    X_(1 2) = a_1 - i a_2, quad X_(2 1) = a_1 + i a_2 \ => cases(a_1 = 1/2(X_(12) + X_(21)), a_2 = 1/(2 i) ( X_(21) - X_(12))).
$

#pagebreak()
= P2.
#align(
  left,
  rect(inset: 12pt)[Consider a ket space spanned by ${ket(a')}$ of Hermitian operator $ bold(A).$ No degeneracy. ]
)

== 1. $Pi_a' ( bold(A) - a')$ is the null operator. 
Proof: Since ${ket(a')}$ spans the space, it's sufficient to show that $Pi_a' ( bold(A) - a')$ annilates all basisket. To show, consider arbitrary basis ket $ket(a'').$ 

$ 
    [product_a' ( bold(A)  - a') ] ket(a'')&= dots times ( bold(A) - a'') ket(a'') times dots  \ 
    & = dots times bold(A) ket(a'') - a'' ket(a'') times dots \ 
    & = dots times a'' ket(a'') - a'' ket(a'')  times dots = 0,
$ and thus $Pi_a' ( bold(A) - a')$ annilates all basis kets, and therefore nullify all vectors in this space. 

== 2. A projection Operator
Let $ 
    hat(P) equiv product_(a'' eq.not a') frac( bold(A) - a'' , a' - a'') . 
$ 
Notice that $hat(P) ket(a') = ket(a'), med hat(P) ket(a_k) = 0$ (for any $a_k eq.not a'.$ ). Explicitely: $ 
    hat(P) ket(a') =frac( bold(A) - a'' , a' - a'') ket(a') = frac(a' - a'' , a' - a'') ket(a') = ket(a'); 
$ 
and for any $a_k eq.not a', $ $ 
    hat(P) ket(a_k) =  dots times frac( bold(A) - a_k , a' - a_k) times dots ket(a_k) = 0.
$ It's clear that $hat(P)$ is a projection operator onto the eigenspace corresponding to the eigenvalue $a'$.


== 3. Illustrate both results using $ bold(A) = S_z$ for spin 1/2 system. 
Recall that the eigenkets ${ket(plus), ket(minus)}$ of the Hermitian operator $S_z$ form an orthornormal basis, just like ${ket(a')}$ in the assumption. $ 
    S_z ket(plus.minus ) = plus.minus  hbar/2 ket(plus.minus ),
$ and from which we can observe: $ 
    product_a' (S_z - a') ket(plus.minus ) = (S_z - hbar/2)(S_z + hbar/2) ket(plus.minus ) = 0.
$ 

Further, $ 
   hat(P) =  product_(a'' eq.not a') frac( bold(A) - a'' , a' - a'') = cases(display(frac(S_z + hbar/2 ,hbar/2 + hbar/2 )) &"for" a' = -hbar/2, display(frac(S_z - hbar/2 ,- hbar/2 - hbar/2 )) &"for" a' = hbar/2) , 
$
and thus for $a' = -hbar/2$:  $hat(P) ket(plus)= 0, med hat(P) ket(minus) = 1$; for $a' = hbar/2$ : $hat(P) ket(minus)= 0, med hat(P) ket(plus) = 1,
$ as expected from part 2. 

#pagebreak()
= P3
#align(
  left,
  rect(inset: 12pt)[Construct $ket( bold(S) dot  hat(bold(n))\; plus)$ as a linear combination of $ket(plus), ket(minus)$, s.t. $ 
       bold(S) dot hat( bold(n)) med ket( bold(S) dot  hat(bold(n))\; plus) = hbar/2 ket( bold(S) dot  hat(bold(n))\; plus),
       $
  ]
)

We recall that, in spherical coordinates,  $ 
    hat(n) = (sin beta cos alpha, sin beta sin alpha, cos beta); \ 
$ and the definition of $ bold(S):$ $ 
    S_x = hbar/2 display(mat(0,1;1,0)), med S_y = hbar/2 display(mat(0,-i;i,0)), med S_z = hbar/2 display(mat(1,0;0,-1)).
$ 
Then, $ 
    bold(S) dot hat( bold(n)) &= S_x n_x + S_y n_y + S_z n_z \ 
    & = hbar/2 display(mat(cos beta, sin beta cos alpha - i sin beta sin alpha; sin beta cos alpha + i sin beta sin alpha, -cos beta)) \ 
    & = hbar/2 display(mat(cos beta, sin beta e^(-i alpha); sin beta e^(i alpha), -cos beta)).
$ 
Let eigenket $ket( bold(S) dot  hat(bold(n))\; plus) = vec(c_1,c_2).$ The eigenvalue equation then reads: $ 
hbar/2 display(mat(cos beta, sin beta e^(-i alpha); sin beta e^(i alpha), -cos beta)) vec(c_1,c_2) &= hbar/2 vec(c_1,c_2) \ 
=> display(mat(c_1 cos beta + c_2 sin beta e^(-i alpha); c_1 sin beta e^(i alpha) - c_2 cos beta))  &= vec(c_1,c_2) 
$
This yields two dependent equations $ 
    c_1 (cos beta - 1) + c_2 sin beta e^(-i alpha) = 0, \ 
    c_1 sin beta e^(i alpha) - c_2 (cos beta + 1) = 0,
$ 
and from which, $ 
    c_1 = frac(sin beta e^(- i alpha) , 1 - cos beta) c_2 => quad c_1 = frac(cos(beta/2)e^(-i alpha) , sin(beta/2)  )c_2.  
$ 
Normalization condition for the eigen solution requires $ 
     |c_1|^2 + |c_2|^2 = 1 \ => |c_2|^2 (frac(cos^2(beta/2) , sin^2(beta/2)) + 1) &= 1 \ => |c_2|^2  = sin^2(beta/2). 
$ 
Then for an arbitrary azimuthal angle $alpha$ , we have $ 
    c_2 =  sin(beta/2) e^(i alpha) , med c_1 = cos(beta/2).
$ 
Thus the eigenket is found to be $ 
#rect(inset: 8pt)[
$ display(    cos(beta/2) ket(plus) + sin(beta/2) e^(i alpha) ket(minus).)$
]
 
$ 

= P4. 
#align(
  left,
  rect(inset: 12pt)[A two level system with Hamiltonian $ 
      H = H_(11) ketbra(1)+ H_(22) ketbra(2) + H_(12)(ketbra(1,2) + ketbra(2,1) .
  $ Find energy eigenvalues and eigenkets.
  ]
)

== 1. method 1, solving eigenvalue problem Explicitely.
Writing $hat(H)$ in matrix form by noticing $hat(H)_(11) = braket(1,H,1) = H_(11), hat(H)_(12) = braket(1,H,2) = H_(21), hat(H)_(22) = braket(2,H,2) = H_(22)$:
$ 
    hat(H)= display(mat(H_(11), H_(12); H_(12), H_(22)).)  
$ Let eigenvalue be $E,$ and the eigenvalue equation reads: $ 
    det( hat(H) - E II) = 0 quad => quad det display(mat(H_(11) - E, H_(12); H_(12), H_(22) - E)) = 0, \ => (H_(11)- E)(H_(22)- E) - H_(12)^2 = 0 \ => E_(plus.minus ) = 1/2(H_(11)+ H_(22) plus.minus sqrt((H_(11)-H_(22))^2 + 4 H_(12)^2 ) ).
$ 
For each $E_(plus.minus )$, we solve for the eigenvector problem $hat(H) ket(E) = E_(plus.minus ) ket(E),$ for $ket(E) = vec(c_1, c_2.)$   
$ 
    display(mat(H_(11) - E_(plus.minus), H_(12); H_(12), H_(22) - E_(plus.minus))) vec(c_1,c_2) = 0 \ =>cases( (H_(11) - E_(plus.minus)) c_1 + H_(12) c_2 = 0, H_(12)c_1 + (H_(22) - E_(plus.minus)) c_2 = 0)\ 
    => cases(c_1 = H_(12), c_2 = E_(plus.minus) - H_(11)).
$ Applying normalization, we have $ 
    ket(E)=vec(c_1, c_2) = frac(1 , sqrt(H_(12)^2 +|E_plus.minus - H_(11)|^2 ) ) vec(H_(12), E_(plus.minus) - H_(11)),
$ with $E_plus.minus$ specified above.

 

== 2. method 2, use result from P1&P3.
Since ${II, sigma_1,sigma_2 ,sigma_3}$ form a basis of the 4-dimensional complex vector space of 2×2 complex matrices, any 2-by-2 matrix X can be expanded as$ 
    X = a_0 II + sum_(k=1)^(3) sigma_k a_k, 
$ 
and thus we can use result from P1 b to write $hat(H)$ : $ 
    hat(H) = display(mat(H_(11), H_(12); H_(12), H_(22))) = a_0 II + sum_(k=1)^(3) sigma_k a_k, $<eq.X>
    where
    $
     a_0 = 1/2 (H_(11) + H_(22)), a_1 = H_(12), a_2 = 0, a_3 = 1/2 (H_(11) - H_(22)). $ 
Denote $ bold(a) = (a_1, a_2, a_3), med  bold(sigma) = (sigma_1, sigma_2, sigma_3),$ and then  @eq.X reads $ 
     hat(H) &= a_0 II +  bold(a) dot  bold(sigma) \ 
     & =  a_0 II + norm( bold(a))( hat(n) dot bold(sigma)) \ 
     & = a_0 II + frac(2 norm( bold(a)) , hbar) (hat(n) dot bold(S)).
$ 
The eigenvalue equation is then $ 
    H ket(E) = [ a_0 II + frac(2 norm( bold(a)) , hbar) (hat(n) dot bold(S)) ] ket(E) = E ket(E).
$ 
Since we knew from P3 that the eigenvalues of $hat(n) dot bold(S)$ are $plus.minus hbar/2,$ we have the energy eigenvalues: $ 
    E_(plus.minus ) = a_0 plus.minus norm( bold(a)),
    $
with $norm( bold(a)) = sqrt(sum_(k=1)^3 a_k^2 ) $ specified above. Further, since $ 
    n_z = cos beta = a_3 / norm( bold(a)), med n_y = a_2 / norm( bold(a)) = 0, med n_x = sin beta cos alpha = a_1 / norm( bold(a)), 
    $
    we have $alpha = 0 "or" pi$ , and $ 
        cos(beta/2) = sqrt(frac(1 + cos beta , 2) ) = sqrt(frac(1 + a_3 / norm( bold(a)) , 2) ), \
        sin(beta/2) = sqrt(frac(1 - cos beta , 2) ) = sqrt(frac(1 - a_3 / norm( bold(a)) , 2) ).
    $ 
    Thus, the eigenkets are the same as those in P3, but with $sin(beta/2), cos(beta/2)$ specified above: $ 
    ket(E_plus) = vec(cos(beta/2), e^(i alpha) sin(beta/2)) , \ 
    ket(E_minus) = vec(sin(beta/2), - e^(i alpha) cos(beta/2)).
$
In particular, when $H_(12)<0, n_1 <0, alpha = pi; $ when $H_(12)>0, n_1 >0, alpha = 0.$ 

#pagebreak()
= P5 
#align(
  left,
  rect(inset: 12pt)[A spin 1/2 system in an eigenstate of $ bold(S) dot hat( bold(n))$ with eigenvalue $hbar/2.$ $hat( bold(n))$  is a unit vector in $x z$ plane with angle $gamma$ w.r.t. $+hat(z).$ ]
)
== 1. The possible outcomes of a measurement of $S_x$ and their probabilities.
From previous problems, we know that the eigenket of $ bold(S) dot hat( bold(n))$ with eigenvalue $hbar/2$, where $alpha = 0, beta = gamma,$  is $ 
   ket(psi) equiv ket( bold(S) dot hat( bold(n)) plus) = cos(gamma/2) ket(plus) + sin(gamma/2) ket(minus).
$ and so the measurement probabilities are $ 
    P(hbar/2) = abs(braket(plus_x, psi))^2  = abs( 1/sqrt(2)( bra(plus) + bra(minus)) ket(psi))^2  = abs(1/sqrt(2)(cos gamma/2 + sin gamma/2) )^2 = frac(1+sin gamma , 2) , \ 
    P(-hbar/2) = abs(braket(minus_x, psi))^2  = abs( 1/sqrt(2)( bra(plus) - bra(minus)) ket(psi))^2  = abs(1/sqrt(2)(cos gamma/2 - sin gamma/2) )^2 = frac(1-sin gamma , 2).
$ 
== 2. Find $expval((Delta S_x)^2)$. Check for $gamma = 0, pi/2, pi.$
A useful identity is $ 
    expval((Delta S_x)^2) = expval(S_x^2) - (expval(S_x))^2,
$ 
where $ 
    S_x^2  = (hbar/2)^2 sigma_x^2 = (hbar/2)^2 II => expval(S_x^2) = hbar^2 /4. \ 
    expectationvalue(S_x) = braket(psi,S_x,psi) = sum_(i) a_i p(a_i) = hbar/2 dot frac( 1 + sin gamma , 2) + (-hbar/2) dot frac( 1 - sin gamma , 2) = hbar/2 sin gamma.    
$ From which we have $ 
    expval((Delta S_x)^2) = hbar^2 /4 - (hbar/2 sin gamma)^2 = 
#rect(inset: 8pt)[
$ display(    hbar^2 /4 cos^2 gamma)$
]

$
Checking for $
gamma = 0: expectationvalue((Delta S_x)^2 ) = hbar^2 /4;\ 
gamma = pi/2: expectationvalue((Delta S_x)^2 ) = 0; \ 
gamma = pi: expectationvalue((Delta S_x)^2 ) = hbar^2 /4 
$ 

== 3. How do the results for 1 and 2 change for the case of $S_y$?
 Noticing $hat(n) = (sin gamma, 0 , cos gamma),$ we can easily read off: $ 
     P(plus.minus hbar/2) = frac(1 plus.minus hat(n) dot hat(y) , 2) = frac(1 plus.minus  0 , 2) = 1/2. 
 $ 
Then $ 
    expectationvalue(S_y) = sum_(i) a_i p(a_i) = hbar/2 dot 1/2 + (-hbar/2) dot 1/2 = 0, \
    expval(S_y^2) = hbar^2 /4. \ 
    => expval((Delta S_y)^2) = hbar^2 /4 - 0^2 = hbar^2 /4.
$
#pagebreak()
= P6
#align(
  left,
  rect(inset: 12pt)[Find the linear combination of $ket(plus), ket(minus)$ that maximizes the uncertainty product $ 
      expectationvalue((Delta S_x)^2) expectationvalue((Delta S_y)^2).
  $ Verify that for the linear combination you found, the uncertainty relation for $S_x, S_y$ is not violated.
  ]
)


We take the general linear combination from P3: $ 
    ket(psi) = cos(beta/2) ket(plus) + sin(beta/2) e^(i alpha) ket(minus),
$ 
and perform similar procedure to find $expval(S_x), expectationvalue(S_x)$.

For $expval(S_x):$ 
$ 
     P(hbar/2) = abs(braket(plus_x, psi))^2  = abs( 1/sqrt(2)( bra(plus) + bra(minus)) ket(psi))^2  = abs(1/sqrt(2)(cos(beta/2) + sin(beta/2) e^(i alpha)) )^2 = frac(1 + sin beta cos alpha , 2) , \

    P(- hbar/2) = abs(braket(minus_x,psi))^2  = abs(1/sqrt(2)(bra(plus) - bra(minus)) ket(psi) )^2 = abs(1/sqrt(2)(cos(beta/2) - sin(beta/2) e^(i alpha)) )^2 = frac(1 - sin beta cos alpha , 2). 
$ 
From which we have $ 
    expectationvalue(S_x) = sum_(i) a_i p(a_i) = hbar/2 dot frac( 1 + sin beta cos alpha , 2) + (-hbar/2) dot frac( 1 - sin beta cos alpha , 2) = hbar/2 sin beta cos alpha.
$ 
Similiarly, for $expval(S_y)$: $ 
    P(hbar/2) = abs(braket(plus_y, psi))^2  = abs( 1/sqrt(2)( bra(plus) + i bra(minus)) ket(psi))^2  = frac(1 + sin beta sin alpha , 2) , \

    P(- hbar/2) = abs(braket(minus_y,psi))^2  = abs(1/sqrt(2)(bra(plus) - i bra(minus)) ket(psi) )^2 =  frac(1 - sin beta sin alpha , 2), \ 
    => expectationvalue(S_y) = sum_(i) a_i p(a_i)  = hbar/2 sin beta sin alpha.
$ 
Also, notice $
S_k^2 = (frac(hbar , 2) ^2  II) => expectationvalue(S_k^2 )= frac(hbar^2 ,4).
$ 
Collecting, we have $ 
    expectationvalue((Delta S_x)^2) = expectationvalue(S_x^2) - (expectationvalue(S_x))^2 = frac(hbar^2 ,4) - (hbar/2 sin beta cos alpha)^2 = frac(hbar^2 ,4)(1 - sin^2 beta cos^2 alpha), \
    expectationvalue((Delta S_y)^2) = expectationvalue(S_y^2) - (expectationvalue(S_y))^2 = frac(hbar^2 ,4) - (hbar/2 sin beta sin alpha)^2 = frac(hbar^2 ,4)(1 - sin^2 beta sin^2 alpha) \ 
    => expectationvalue((Delta S_x)^2) expectationvalue((Delta S_y)^2) = frac(hbar^4 ,16)(1 - sin^2 beta cos^2 alpha)(1 - sin^2 beta sin^2 alpha) = hbar^4 / 16 med underbrace((cos^2(beta)+(sin^4 (beta))/4 sin^2(2alpha)),(*)).
$ 
Maximizing $(*)$ for $alpha, beta in [0, 2pi]$, we have $max (*) = 1$ for $beta = pi + n pi, n in ZZ.$ Thus the maximum uncertainty product is $ 
    max expectationvalue((Delta S_x)^2) expectationvalue((Delta S_y)^2) = 
#rect(inset: 8pt)[
$ display(    hbar^4 /16.)$
]

$