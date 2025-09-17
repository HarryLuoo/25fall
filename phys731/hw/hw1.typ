#set math.equation(numbering: "(1)")
#set page(margin: (x: 1cm, y: 1cm))
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
    X_(1 1) = a_0 + a_3, quad  X_(2 2) = a_0 - a_3.
$ 
Off diagonal elements: for $m eq.not n: $ $ 
X_(m n) = sigma_1_(m n) a_1 + sigma_2_(m n) a_2 \ =>
    X_(1 2) = a_1 - i a_2, quad X_(2 1) = a_1 + i a_2.
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
    & =  bold(A) ket(a'') - a'' ket(a'') \ 
    & = a'' ket(a'') - a'' ket(a'') = 0,
$ and thus $Pi_a' ( bold(A) - a')$ annilates all basis kets, and therefore nullify all vectors in this space. 

== 2. 
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
    c_1 sin beta e^(i alpha) - c_2 (cos beta + 1) = 0. 
$ 
from which, $ 
    c_1 = frac(sin beta e^(- i alpha) , 1 - cos beta) c_2 => quad c_1 = frac(cos(beta/2)e^(-i alpha) , sin(beta/2)  )c_2.  
$ 
Normalization condition for the eige solution requires $ 
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

== 1. method 1, solve eigenvalue problem Explicitely.


== 2. method 2, use result from P3.