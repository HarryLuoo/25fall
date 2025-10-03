#set math.equation(numbering: "(1)")
#set page(margin: (x: 1cm, y: 1cm))
#import "@preview/physica:0.9.5": *
#place(top + right, rect(inset: 3pt)[math541 hw4])

= 1
 #align(
  left,
  rect(inset: 8pt)[Let G be a group acting on A. FIx $a in A.$ Show that $G_a = {g in G |
  g a = a}$ is a subgroup of g. ]
)
 To show that $G_a <= G,$ we need to show that $G_a$ is nonempty and $forall x, y in G_a, x y^(-1) in G_a.$

- nonempty: $e in G_a$, trivially, since $e a = a.$
- Closure: Let $g , h in G_a.$ Need $g h^(-1) in G_a, i.e. g h^(-1) a = a.$

  $ 
      g h^(-1) a = g (h^(-1) a) = g a = a,  
  $ 
  where, we used the fact that $h^(-1) in G_a$ since $ h in G => h^(-1) in G "and" h a = a \ => h^(-1) h a = h^(-1) a => e a = h^(-1) a => a = h^(-1) a.
  $   

Thus, $G_a <= G.$

#pagebreak()
= 2. 
#align(
  left,
  rect(inset: 8pt)[H is a group acting on A. Show that $ 
      a ~ b "iff" exists h in med s.t. med a = h b 
  $ is anequivalence relation on A.
  ]
)
- Reflexive : true, since $e in H, e a = a => a~a.$ 
- Symmetric: Suppose $a ~ b.$ Then, $exists h in H med s.t. med h a = b.$ Since $h in H => h^(-1) in H,$ we have $h^(-1) b = h^(-1) h a = e a = a => b ~ a.$
- Transitive: Suppose $a ~ b, b~ c,$ then $ 
    exists h_1 in H, a = h_1 b; exists h_2 in H, b = h_2 c \ => a = h_1 h_2 c \ => (h_1 h_2) in H, a = (h_1 h_2) c => a ~ c.
$ Thus $~$ is an equivalence relation on A.

#pagebreak()
= 3
#align(
  left,
  rect(inset: 8pt)[Let G be any group. Show that $(g_1,g_2) a := g_1 a g_1^(-1)$ gives an action of $G times G$ on $G.$ \
  Show thatn the Kernel of this action is ${(g,g)| g in ZZ(G)}$ ]
)

=== 1
 consider $e_1,e_2 in G$ $ 
    (e_1, e_2) a  = e_1 a e_2^(-1) = e a e = a. 
$ 
- consider $(h_1, h_2), (g_1, g_2) in G times G.$ $ 
    (h_1, h_2) ((g_1, g_2) a) &= (h_1, h_2) (g_1 a g_2^(-1)) \ 
    & = h_1 g_1 a g_2^(-1) h_2^(-1). \ 
    ((h_1 g_1), (h_2 g_2)) a &= (h_1 g_1) a ( h_2 g_2)^(-1) \ 
    & = h_1 g_1 a g_2^(-1) h_2^(-1) = (h_1, h_2) ((g_1, g_2) a).
$ 
so this is an action of $G times G$ on $G.$

=== 2 
Consider the kernel $(g_1, g_2) med s.t. med (g_1, g_2) a = a, forall a in G.$ 
   Then $ 
       g_1 a g_2^(-1) = a <=> g_1 = a g_2 a^(-1), forall a in G 
   $ 
   which gives $g_2 = a^(-1)g_1 a med forall a in G.$ Let arbitrary $x, y in G, $ then $ 
       x^(-1) g_1 x = y^(-1) g_1 y => g_1 (x y ^(-1)) = (x y ^(-1)) g_1 .
   $ Then $g_1 in Z(G.)$ Hence $g_2 = a^(-1) g_1 a = g_1 med := g.$ Thus, the kernel is $ 
       {(g, g) | g in Z(G)}.
    $ 
     
#pagebreak()
= 4
#align(
  left,
  rect(inset: 8pt)[Let G be a group and let G act on itself by left conjugation, s.t. each $g in G$ maps $G-> G$ by $x mapsto g x g^(-1).$ For fixed $g in G,$ prove: 
  1. Conjugation by g is automorphisim of G.
  2. $x, med g x g^(-1)$ have same order $forall x in G.$ 
  3. $forall A subset.eq G, |A| = |g A g^(-1)|.$  ]

)
 
=== 1 
Define $c_g : G -> G, c_g(x) = g x g^(-1).$ Now, for any $x, g in G,$ consider $ 
     c_g(x y ) = g x y g^(-1); \ c_g(x) c_g(y) = (g x g^(-1)) (g y g^(-1)) = g x (g^(-1) g) y g^(-1) = g x y g^(-1) \ c_g(x y) = c_g(x) c_g(y).
 $ So $c_g$ is a homomorphism. Further, recall that a map $f$  is bijective if $exists g: B->A med s.t. med f compose g = e_B, g compose f = e_A.$  
   
   We define an "inverse conjugation" as $c_(g^(-1)): G->G, c_g(x) = g^(-1) x g.$ Then, $ 
       c_g compose c_(g^(-1)) (x) = c_g(g^(-1) x g) = g (g^(-1) x g) g^(-1) = e x e = x; \ 
       c_(g^(-1)) compose c_g (x) = c_(g^(-1))(g x g^(-1)) = g^(-1) (g x g^(-1)) g = e x e = x.
    $ Therefore $c_g compose c_(g^(-1)) = e = c_(g^(-1)) compose c_g.$ 
    Thus, $c_g$ is bijective, and hence an automorphism of G. 

=== 2 
Since $c_g$ is an automorphism, it is isomorphic, so using proposition from lecture that isomorphic elements have the same order, we have that $x$ and $g x g^(-1)$ have the same order.

=== 3
Since $c_g: G->G$ is bijective, it is injective, and so a subset $A subset G$ is injective to $c_g(A) = g A g^(-1).$ 
Further, we can show that $c_g$ is surjective from $A$ to $g A g^(-1).$ Consider any $y in g A g^(-1).$ Then, $exists a in A med s.t. med y = g a g^(-1).$ But then, $c_g(a) = g a g^(-1) = y.$ Thus, $c_g$ is surjective from $A$ to $g A g^(-1).$ 
   
   Since $c_g$ is both injective and surjective from $A$ to $g A g^(-1), c_g$ is bijective from $A$ to $g A g^(-1),$ and so $|A| = |g A g^(-1)|.$

#pagebreak()
= 5
#align(
  left,
  rect(inset: 8pt)[Give an explicit example where G is a group, $H subset G, med |H| = infinity, $ H is closed under the group opreation, but H is not a subgroup of G. ]
)
We can construct such an example by failing the subgroup definition that $forall x in H, x^(-1) in H.$

Consider $G = (RR, +), H = NN$. It is easily verified that $H subset G, |H| = infinity,$ and $H$ is closed under addition. However, consider $2 in H.$ Its inverse would be $-2,$ but it is not in $H.$ Thus, $H$ is not a subgroup of $G.$

#pagebreak()
= 6
#align(
  left,
  rect(inset: 8pt)[Prove that 
  1. If H and K are subgroups of G, then $H  inter K$ is a subgroup of G. 
  2. The intersection of an arbitrary nonempty collection of subgroups of G is a subgroup of G. ]
)
=== 1
 Consider arbitrary $x, y in H inter K.$ Then $x, y^(-1) in H, x, y^(-1) in K$ and $x y^(-1) in H, med x y^(-1) in K$ by subgroup definiton.
   Then $x y^(-1) in H inter K.$ Further, $e in H, e in K => e in H inter K$, nonempty. Thus, $H inter K <= G.$  
=== 2
 Denote $H_i <= G (i = I)$ for some index set $I$, and denote $S = inter_i H_i.$
   
First, it's clear that $ e in S$ as $e in H_i forall i$, and so $S$ is nonempty.

Then, consider $x, y in S,$ then $x, y in H_i forall i in I$ by definition of intersection. 
   By subgroup definition, $x y^(-1) in H_i forall i in I,$ and so $x y^(-1) in S.$ 
Thus, $S <= G.$  

#pagebreak()
= 7 
#align(
  left,
  rect(inset: 8pt)[Prove the following: 
  1. Assume $H<= G, K<= G,$ then $H union K $ not closed under multiplication unless $H<= K$ or $K <= H.$ 
  2. 2. Let $H_n <= G med (n = 1, 2, dots) med s.t. med H_n <= H_(n+1).$ Prove that $union_(n=1)^infinity H_n <= G.$  ]
)
=== 1
 We need to prove : $H union K "closed under multilpication" => H<= K "or" K<= H.$ Suppose not: $H union K$ but $H lt.eq.not K$ or   $K lt.eq.not H.$

Then choose $h in H backslash K, med k in K backslash H.$ Since $H union K$ closed under multiplictation, $h k in H union K.$ 

   If $h k in H,$ then since $h in H,$ by subgroup definition, $h^(-1) in H$ and so $k = h^(-1) (h k) in H,$ a contradiction. 
   If $h k in K,$ then since $k in K,$ by subgroup definition, $k^(-1) in K$ and so $h = (h k) k^(-1) in K,$ a contradiction.  

   So, $H union K$ not closed under multiplication unless $H<= K$ or $K <= H.$ 

=== 2
 Denote $H = union_(n=1)^infinity H_n.$ Choose $x, y in H.$ Then $x in H_m, y in H_n$ for some $m, n in NN.$
Take $k = max(m,n),$ then $x, y in H_k$ since $H_m <= H_k, H_n <= H_k.$ 
   By subgroup definition, $x y^(-1) in H_k,$ and so $x y^(-1) in H.$ Further, $e in H_1 <= H,$ so $H$ is nonempty. Thus, $H <= G.$

#pagebreak()
= 8
#align(
  left,
  rect(inset: 8pt)[Let $H <= G$ for G a group. Prove: 
  1. $H subset.eq N_G (H) $
  2. Find an example where $G$is a group, $A subset.eq G,$ but $A subset.not N_G (A)$ 
  3. $H subset.eq C_G (H)$ iff H is abelian.     ]
)

=== 1. 
Recall $N_G (H) = {g in G | g H g^(-1) = H}$ . To show $H subset.eq N_G (H) = {g in G | g H g^(-1) = H}$ is to show $forall h in H, h H h^(-1) = H.$
   
Fix $h in H, h^(-1) in H.$ Then $forall x in H, h x h^(-1) in H => h H h^(-1) subset.eq H.$ 

Simliarly, fix $h^(-1) in H$. Then $forall y in H, h^(-1) y h in H => y in h H h^(-1) $. But since $y in H, H subset.eq h H h^(-1).$

Collectively, $h H h^(-1) = H,$ and so $h in N_G (H).$ Since $h in H$ was arbitrary, $H subset.eq N_G (H).$

=== 2. 
Consider $G = S_3 = {(1 2 3), (1 2), (1 3), (1 3 2), e}$. Consider $A = {(1 2), (1 3)} subset G.$

Further, consider $(1 2) in G.$ Notice that it is in $A$, but not in $N_G (A),$ since: 
$ 
    (1 2) (1 2) (1 2) = ( 1 2) in A. \ 
    (1 2) (1 3) (1 2) = (2 3) in.not A.
$ 
  So $(1 2) in.not N_G (A) $  while $(1 2) in A$ , so $A subset.not N_G (A).$  

=== 3. 
- Assume $H subset.eq C_G (H) <=> h in C_G (H)med forall h in H,$ which implies for all $a in A, h a = a h$ by the definition of centralizer. Thus, $H$ is abelian.

- Assume $H$ is abelian. Then, $forall h in H, forall a in H, h a = a h => h a h^(-1) = a h h^(-1) = a => h H h^(-1) = H => h in C_G (H).$ Since $h in H$ was arbitrary, $H subset.eq C_G (H).$ Thus completes the proof.
  
#pagebreak()
= 9. 
#align(
  left,
  rect(inset: 8pt)[$G = Q_8, A= {i, -i}, $ find $Z(G), C_G (A), N_G (A).$  ]
)
 $G = {plus.minus 1, plus.minus i, plus.minus j, plus.minus k}.$ 
1. $Z(G) = Z(Q_8) = { g in Q_8 | g x = x g , forall x in Q_8} = {1, -1}, $ since $i, j, k$ do not commute with each other.
   
2. $C_G (A) = {g in Q_8 | g a = a g, forall a in A} = {1, -1, i, -i } = expectationvalue(i) $, as $Z(G) subset.eq C_G (A),$ and $j, k$ do not commute with $i.$ 
   
3. $N_G (A) = { g in G | g A g^(-1) = A}$. Since $C_G (A) subset.eq N_G (A)$ , examine only $g = j, k.$

   - for $g = j, $ notice that $j A j^(-1) = {-i, i} = A;$
   - for $g = k, $ notice that $k A k^(-1) = {i, -i} = A.$
   - for cases $g = -j, -k,$ the same results hold in the exact same way.
- Thus, $N_G (A) = {1, -1, i, -i, j, -j, k, -k} = Q_8.$  