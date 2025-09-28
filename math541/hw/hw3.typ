#set math.equation(numbering: "(1)")
#set page(margin: (x: 1cm, y: 1cm))
#import "@preview/mitex:0.2.5": *
#import "@preview/physica:0.9.5": *
#place(top + right, rect(inset: 3pt)[Math541|HW3])
= 1
Consider $ 
    display(mat(1,1;0,1)) , display(mat(0,1;1,0)) in "GL"_2(FF_2), 
$ 
a conterexample to commutivity is given by $ 
    display(mat(1,1;0,1)) display(mat(0,1;1,0)) = display(mat(1,1;1,0)) \ eq.not display(mat(0,1;1,0)) display(mat(1,1;0,1)) = display(mat(0,1;1,1)). 
$ 

#pagebreak()

= 2
#align(
  left,
  rect(inset: 8pt)[G consists of the invertible upper triangular real 2 by 2 matrices.]
)

=== 1. Show G is closed under multiplication.
Consider $ 
     display(mat(a,b;0,c)) display(mat(d,e;0,f)) = display(mat(a d, a e + b f; 0, c f)) in G.
$ 

=== 2. Show G is closed under inverse. 
Consider $ 
    display(mat(a,b;0,c))^(-1) = 1/(a c)  display(mat(c, -b; 0 , a))  in G. 
$ 

=== 3. Show that $G <= "GL"_2(FF_2)$.
Notice that $G$ is non empty since $ display(mat(1,0;0,1)) in G$, and $G subset "GL"_2(FF_2)$ by definition, and $G$ is closed under multiplication and inverse by (1) and (2).
 Thus $G <= "GL"_2(FF_2)$.

=== 4. Show that $G$is not commutative, but its subset with $b=0$ is a commutative subgroup.
Consider $ 
    display(mat(1,2;0,1)) display(mat(1,2;0,2)) = display(mat(1,6;0,2)) \ eq.not display(mat(1,2;0,2)) display(mat(1,2;0,1)) = display(mat(1,4;0,2)).  
$ 
And so $G$is not commutative.

However, if $b=0$, then $ 
    display(mat(a,0;0,c)) display(mat(d,0;0,f)) = display(mat(a d, 0; 0, c f)) = display(mat(d,0;0,f)) display(mat(a,0;0,c)).
$ Also, the subset is non empty since $ display(mat(1,0;0,1))$ is in the subset, and it is closed under multiplication and inverse by (1) and (2). Thus the subset with $b=0$ is a commutative subgroup of $G$.

#pagebreak()
= 3 
=== 1. Order of each element in $Q_8.$
$ 
    Q = {plus.minus 1, plus.minus i, plus.minus j, plus.minus k}. 
$ 
We have $abs(1) = 1, abs(-1) = 2, abs(i)=4, abs(-i) = 4, abs(j) = abs(-j) = abs(k) = abs(-k) = 4.$

=== 2. Prove that $D_8$ and $Q_8$ are not isomorphic.

We consider the isomorphic property that if $phi: G-> H$ is an isomorphism, then for any $g in G$, $abs(g) = abs(phi(g)).$
This implies that isomorphism preserves the order of elements, and so $G$ and $H$ must have the same number of elements of each order.
We notice that in $D_8,$
$ 
    abs(e) = 1, abs(r) = abs(r^3) = 4, abs(r^2) = 2, abs(s) = abs(s r) = abs(s r^2) = abs(s r^3) = 2. 
$ 
Thus $D_8$ has 5 elemetns of order 2, while $Q_8$ has only one element of order 2. Thus $D_8$ and $Q_8$ are not isomorphic.

#pagebreak()

= 4. 
=== 1.
We verify each relations.

1.$M_(-1)^2  = M_1$ 

#mitext(`

 $$ \mathbf{M}_{-1}^2 = \begin{pmatrix} -1 & 0 \\ 0 & -1 \end{pmatrix} \begin{pmatrix} -1 & 0 \\ 0 & -1 \end{pmatrix} = \begin{pmatrix} (-1)(-1) + (0)(0) & (-1)(0) + (0)(-1) \\ (0)(-1) + (-1)(0) & (0)(0) + (-1)(-1) \end{pmatrix} = \begin{pmatrix} 1 & 0 \\ 0 & 1 \end{pmatrix} = \mathbf{M}_1$$
`)

2. $M_i^2 = M_j^2 =M_k^2 = M_(-1)$.
#mitex(`
$$\mathbf{M}_i^2 = \begin{pmatrix} i & 0 \\ 0 & -i \end{pmatrix} \begin{pmatrix} i & 0 \\ 0 & -i \end{pmatrix} = \begin{pmatrix} i^2 & 0 \\ 0 & (-i)^2 \end{pmatrix} = \begin{pmatrix} -1 & 0 \\ 0 & -1 \end{pmatrix} = \mathbf{M}_{-1}$$
\\
$$\mathbf{M}_j^2 = \begin{pmatrix} 0 & 1 \\ -1 & 0 \end{pmatrix} \begin{pmatrix} 0 & 1 \\ -1 & 0 \end{pmatrix}  = \begin{pmatrix} -1 & 0 \\ 0 & -1 \end{pmatrix} = \mathbf{M}_{-1}$$
\\

$$\mathbf{M}_k^2 = \begin{pmatrix} 0 & i \\ i & 0 \end{pmatrix} \begin{pmatrix} 0 & i \\ i & 0 \end{pmatrix} = \begin{pmatrix} i^2 & 0 \\ 0 & i^2 \end{pmatrix} = \begin{pmatrix} -1 & 0 \\ 0 & -1 \end{pmatrix} = \mathbf{M}_{-1}$$

`) All three relations hold.

3. $M_i M_j = M_k$.
#mitex(`
$$\mathbf{M}_i \mathbf{M}_j = \begin{pmatrix} i & 0 \\ 0 & -i \end{pmatrix} \begin{pmatrix} 0 & 1 \\ -1 & 0 \end{pmatrix} = \begin{pmatrix} (i)(0)+(0)(-1) & (i)(1)+(0)(0) \\ (0)(0)+(-i)(-1) & (0)(1)+(-i)(0) \end{pmatrix} = \begin{pmatrix} 0 & i \\ i & 0 \end{pmatrix} = \mathbf{M}_k$$
`)
4. $M_j M_i = M_(-k)$:
#mitex(`
$$\mathbf{M}_j \mathbf{M}_i = \begin{pmatrix} 0 & 1 \\ -1 & 0 \end{pmatrix} \begin{pmatrix} i & 0 \\ 0 & -i \end{pmatrix}  = \begin{pmatrix} 0 & -i \\ -i & 0 \end{pmatrix} = \mathbf{M}_{-k}$$
`) 

=== 2.Deduce that these eight matrices consitute a subgroup of $"GL"_2(CC)$ with the same multiplication table as $Q_8$, and thus $Q_8$ is a group.
Let $H$ be the 8-matrix subgroup of $"GL"_2(CC)$ 
We verify the subgroup criteria for finite group $H$ .
1. Closure:   
   The relations we checked showed that any element in the set can be written as a product of generators, and any product of generators simplifies to an element in the set. Thus, $H$ is* closed* under matrix multiplication.
2. Non empty: 
    $M_1$ is the identity matrix, and is in $H$ , and so $H$  is non empty.

And so by the subgroup criterion, $H <= "GL"_2(CC).$
   


=== 3. Show that the subgroup has the same multiplication table as $Q_8$.

The map $ phi: Q_8  mapsto  { M_x  | x  in Q_8 }$ defined by $ phi(x) =  M_x$ (e.g., $ phi(i) =  M_i$, $ phi(j) =  M_j$, etc.) is a homomorphism because the generators $i, j$ and $ M_i,  M_j$ satisfy the same defining relations. 

Since $ phi$ is a bijection between the two sets of 8 elements, it is an isomorphism. This means the matrix group and $Q_8$ have identical structures and multiplication tables.

=== 4. Conclude that $Q_8$ is a group.

#mitext(
`
Let $\psi: Q_8 \to H$ be the bijection defined by $\psi(x) = \mathbf{M}_x$ for each $x \in Q_8$. By the verified relations, $\psi$ respects the defining multiplication rules of $Q_8$, hence $\psi$ is a homomorphism.

The associativity axiom for $Q_8$ now follows from the associativity of matrix multiplication in $H$. For any $x, y, z \in Q_8$:
$$
\psi((xy)z) = \psi(xy)\psi(z) = (\psi(x)\psi(y))\psi(z)
$$
Since matrix multiplication is associative in $H$:
$$
(\psi(x)\psi(y))\psi(z) = \psi(x)(\psi(y)\psi(z))
$$
And since $\psi$ is a homomorphism:
$$
\psi(x)(\psi(y)\psi(z)) = \psi(x)\psi(yz) = \psi(x(yz))
$$
Thus, $\psi((xy)z) = \psi(x(yz))$. Since $\psi$ is injective, it follows that $(xy)z = x(yz)$ in $Q_8$.

The existence of an identity element in $Q_8$ is confirmed by $\psi(1) = \mathbf{M}_1$, where $\mathbf{M}_1$ is the identity matrix in $H$. The existence of inverses for each element $x \in Q_8$ is confirmed by $\psi(x^{-1}) = \psi(x)^{-1}$, where $\psi(x)^{-1}$ is the matrix inverse in $H$. Finally, closure of $Q_8$ under its operation is inherent in its definition via the multiplication table.

Therefore, $Q_8$ satisfies all the group axioms (closure, associativity, identity, and inverses), and hence is a group._
`)

#pagebreak()
= 5. 
#align(
  left,
  rect(inset: 8pt)[let $phi : G -> H$ be a homomorphism.]
)
=== 1. Prove that $phi(x^n) = phi(x)^n$ for all $ n in NN.$  

We prove this by induction on $n$. Base case: $n=1$. Trivially true since $phi(x^1) = phi(x) = phi(x)^1$.

Inductive step: Assume true for $n=k$, i.e., $phi(x^k) = phi(x)^k$. We want to show it is true for $n=k+1$. Notice $ 
    psi(x^(k+1)) = psi(x^k x) 
$ and homomorphism implies $ 
    psi(x^k x) = psi(x^k) psi(x) = psi(x)^(k+1),
$as wanted. Thus by induction, $phi(x^n) = phi(x)^n$ for all $ n in NN.$

=== 2. Do part 1 for $n = -1$ and deduce that $phi(x^n) = phi(x)^n$ for all $n in ZZ.$

Since homomorphisem preserves identity, we have $ 
    phi(x^(-1) x) = phi(x^(-1)) phi(x) = phi(e) = e.
$ Thus $phi(x^(-1)) = phi(x)^(-1).$ 

Let $m in ZZ, m<0; n = -m, n in NN.$ Then consider $ 
   phi(x^m) = phi(x^(-n)) = phi((x^n)^(-1)) = phi(x^n)^(-1) = (phi(x)^n)^(-1) = phi(x)^(-n) = phi(x)^m.
$ Since we have proved part 1, we conclude that $phi(x^n) = phi(x)^n$ for all $n in ZZ.$

#pagebreak()
= 6. 
#align(
  left,
  rect(inset: 8pt)[Let $theta: Delta ->Omega$ be a bijection. Define $ 
      phi: S_Delta -> S_Omega, quad "by" phi(sigma) = theta compose sigma compose theta^(-1).
  $ 
   ]
)
=== 1. Prove that $phi$ is well defined.
#mitext(`If $\sigma \in S_\Delta$, then $\sigma: \Delta \to \Delta$ is a bijection, and since $\theta, \theta^{-1}$ are bijections, the composition
$$
\phi(\sigma) = \theta \circ \sigma \circ \theta^{-1} : \Omega \to \Omega
$$
is also a bijection. Hence $\phi(\sigma) \in S_\Omega$, so $\phi$ is well-defined.`)

=== 2. Prove that $phi$ is a bijection from $S_Delta $ onto $S_Omega.$ 

#mitext(`
Define
$$
\psi: S_\Omega \to S_\Delta,\qquad \psi(\tau) = \theta^{-1} \circ \tau \circ \theta.
$$
Then for any $\tau \in S_\Omega$,
$$
(\phi \circ \psi)(\tau)
= \phi(\theta^{-1}\circ \tau \circ \theta)
= \theta \circ (\theta^{-1}\circ \tau \circ \theta)\circ \theta^{-1}
= (\theta\circ \theta^{-1}) \circ \tau \circ (\theta\circ \theta^{-1})
= \tau,
$$
so $\phi \circ \psi = \mathrm{id}_{S_\Omega}$. Similarly, for any $\sigma \in S_\Delta$,
$$
(\psi \circ \phi)(\sigma)
= \psi(\theta\circ \sigma \circ \theta^{-1})
= \theta^{-1} \circ (\theta\circ \sigma \circ \theta^{-1}) \circ \theta
= (\theta^{-1}\circ \theta)\circ \sigma \circ (\theta^{-1}\circ \theta)
= \sigma,
$$
so $\psi \circ \phi = \mathrm{id}_{S_\Delta}$. Hence φ is bijective with inverse $\psi$.
`)


=== 3. Prove that $phi$ is a homomorphism, i.e. $phi(sigma compose tau) = phi(sigma) compose phi(tau)$ 

#mitext(`
For any $\sigma,\tau \in S_\Delta$,
$$
\phi(\sigma \circ \tau)
= \theta \circ (\sigma \circ \tau) \circ \theta^{-1}
= (\theta \circ \sigma \circ \theta^{-1}) \circ (\theta \circ \tau \circ \theta^{-1})
= \phi(\sigma)\circ \phi(\tau).
$$
Thus φ is a group homomorphism.

Therefore, $\phi$ is a bijective homomorphism, i.e., an isomorphism $S_\Delta \cong S_\Omega$.
`)

#pagebreak()
= 7.
 #align(
  left,
  rect(inset: 8pt)[Let $G, H$ be groups and let $phi: G -> H$ be a homomorphism. Prove that the image of $phi(G)$ is a subgroup of $H, $ and that if $phi$ is injective then $G$ is isomorphic to $phi(G).$]
)

=== 1. 
Using the subgroup criterion, we see that $phi(G) subset H$ by definition of the image, and $phi(G)$ is non empty since $e_H = phi(e_G) in phi(G).$

Also, let $x = phi(g_1), y = phi(g_2); med g_1, g_2 in G.$ Notice that $ x y^(-1) = phi(g_1)phi(g_2)^(-1) = phi(g_1)phi(g_2^(-1)) = phi(g_1 g_2^(-1)) in phi(G), $ and so $phi(G)$ is closed under inverse.Thus by the subgroup criterion, $phi(G) <= H.$ (Note that we used part 2 of problem 5 to show $phi(g_2)^(-1) = phi(g_2^(-1)).$)

=== 2. 
Define $psi: G -> phi(G), med psi(g) := phi(g)$ .
Then $psi$ is a homomorphism since for any $g_1, g_2 in G,$
$ 
    psi(g_1 g_2) = phi(g_1 g_2) = phi(g_1) phi(g_2) = psi(g_1) psi(g_2).
$ 
$psi$ is surjective by definition of $phi(G)$, and injective if $phi$ is injective. Thus $psi$ is an isomorphism. #h(1fr) $qed$


#pagebreak()
= 8.
#align(
  left,
  rect(inset: 8pt)[#mitext(`Let $G, H$ be groups and $\varphi: G \to H$ a homomorphism. Define
$$
\ker(\varphi) := \{\, g \in G \mid \varphi(g) = e_H \,\}.
$$`)]
)




=== 1. #mitext(`$\ker(\varphi)$ is a subgroup of $G$.`)

#mitext(`
Use the subgroup test: a nonempty subset $K\subseteq G$ is a subgroup iff $\forall x,y\in K$, we have $xy^{-1} \in K$.

- Nonempty: $\varphi(e_G)=e_H$, so $e_G \in \ker(\varphi)$.
- Closure under $xy^{-1}$: If $x,y \in \ker(\varphi)$, then
  $$
  \varphi(xy^{-1}) = \varphi(x)\,\varphi(y)^{-1} = e_H \cdot (e_H)^{-1} = e_H,
  $$
  hence $xy^{-1} \in \ker(\varphi)$.

Therefore $\ker(\varphi) \le G$.

`)

=== 2. #mitext(` $\varphi$ is injective $\iff \ker(\varphi) = \{e_G\}$.`)

#mitext(`
($\Rightarrow$) Suppose $\varphi$ is injective. Let $g \in \ker(\varphi)$, so $\varphi(g)=e_H=\varphi(e_G)$. By injectivity, $g=e_G$. Hence $\ker(\varphi)=\{e_G\}$.

($\Leftarrow$) Suppose $\ker(\varphi)=\{e_G\}$. If $\varphi(g_1)=\varphi(g_2)$, then
$$
\varphi(g_1 g_2^{-1})=\varphi(g_1)\varphi(g_2)^{-1}=e_H,
$$
so $g_1 g_2^{-1} \in \ker(\varphi)$ and thus $g_1 g_2^{-1}=e_G$, i.e. $g_1=g_2$. Hence $\varphi$ is injective.
`)
