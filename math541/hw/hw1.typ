#set math.equation(numbering: "(1)")
#set page(margin: (x: 1.2cm, y: 1.2cm))
#import "@preview/physica:0.9.3": *
#import "@preview/mitex:0.2.5": *
#place(top + right, rect(inset: 3pt)[MATH 541 HW1 | Harry Luo])

= P1
Proof:
+ First, prove the relation to be equivalent:
  - Reflective: $a ~ a =>f(a) = f(a)$, TRUE.
  - Symmetric: $a ~ b=>f(a) = f(b)=>f(b) = f(a)=>b ~ a$, TRUE.
  - transitive: $a ~ b, b ~ c=>f(a) = f(b), f(b) = f(c)=>f(a) = f(c)=>a ~ c$, TRUE.


+ Then, prove its equivalence classes to be the fibers of $f$:

  Let $C$ be the set of equivalence classes of $A$ under $~$ , and let $F$ be the set of fibers of $f.$ We will show that $C = F.$

  Take an arbitrary element $a in A.$ The equivalence class of $a in A$ is: $ 
      {x in A | x~a} &= {x in A | f(x) = f(a)} \  &= f^(-1){f(a)}
  $ 
  which by definition is the fiber of $f$.

  Since $a$ was arbitrary, every equivalence class is a fiber of $f$, i.e. $C subset.eq F.$

  Conversely, let $F'$ be an arbitrary fiber of $f$ for some $b in B.$ Then by definition, $ 
      F' &= f^(-1){b} \ &= {x in A | f(x) = b} $.

  Since f is surjective, $exists a in A med s.t. med f(a) = b.$ Consider the equivalence class of $a$:$ 
      {x in A | x ~ a} &= {x in A | f(x) = f(a)} \ &= {x in A | f(x) = b} \ &= F'.
  $ 
  Since $F'$ was arbitrary, every fiber of $f$ is an equivalence class, i.e. $F subset.eq C.$ Thus, $C = F.$
  #h(1fr) $qed$

#pagebreak()

= P2 
Prove by contradiction:

+ Consider an arbitrary *column* in the multiplication table of $G$.  
  Suppose that the colum is _not_ a permutation of $G$.

  Then there would be at least two identical elements in this column, which we denote as $a$ . This implies that $ 
      exists x, y in G, x eq.not y, med s.t. med  x a = y a
  $ 
  Applying $x^(-1)$ from right on both sides: $ 
      x^(-1) x a &= x^(-1) y a \ a &= x^(-1)y a\ => x^(-1) y &= e. 
  $  Since inverse of an element is unique, $y = x$, which is a  contradiction.
  
+ Similarly, consider arbitrary *row* in the multiplication table of $G$ . 
  Suppose that this row is _not_ a permutation of $G$ , i.e. there are at least two repeating elements, denoted as b. This implies$ 
      exists x, y in G, x eq.not y, med s.t. med x a = x b.
  $ 
  Applying $a^(-1)$ from left on both sides: $ 
      x a a^(-1) &= x b a^(-1) \ x &= x b a^(-1)\ => b a^(-1) &= e. 
  $ 
  Since inverse of an element is unique, $b = a$, a contradiction. #h(1fr) $qed$

+ Multiplication tables are special cases of Latin squares. In particular, they hold hold the property of associativity. This restricts the set of possible Latin squares, because:

  The group operation must be associative, menaing for every single combiniation of three elements, $ a, b, c in G, (a b)c = a (b c)$.

  In a table, this means:

  - let entry $ (a,b):= d$ and entry $ (d,c):= e$ , then we must have entry $ (d,c)$ equal to entry $ (a,e)$. 
  This is a strong restriction on the possible arrangements of elements in a Latin square, and thus only a small subset of Latin squares can be multiplication tables of groups.



#pagebreak()
= P3
We check each axiom one by one:
=== Closure: Satisfied.
 For any $ a, b in RR, a + b in RR_"ext".$ \ If at least one of the numbers is $ infinity$, the sum is $ infinity in RR_"ext".$

=== associativity: Satisfied. 
We want to show that for any $ a, b, c in RR_"ext", (a + b) + c = a + (b + c).$ We have two cases:
  - If all elements are real, then the sum is trivially associative.
  - If at least one element is $ infinity$, then both sides equal $ infinity$.
  
  === Identity: Satisfied. 
  The identity element is $ 0 in RR_"ext".$ For any $ a in RR_"ext", a + 0 = 0 + a = a.$

=== Inverse: *NOT* satisfied. 
Assume not, then for $ infinity in RR_"ext", exists a in RR_"ext" s.t. a + infinity = 0.$ This is a contradiction, since $ a + infinity = infinity$ for any $ a in RR_"ext".$

Therefore, $ (RR_"ext", +)$ is not a group. #h(1fr) $qed$

#pagebreak()
= P4
#rect(inset: 8pt)[ $
 display(G = {z in CC | z^n = 1 "for some" n in ZZ^+})
$ ] 
== a. Prove that G is a group under multiplication. 
We check for each axiom:
=== Closure: 
let $ a, b in G$ , then $a^(n_1)=1 , b^(n_2) =1$, for some $ n_1, n_2 in ZZ^+.$ Need to show that $ a b in G <=> (a b )^k = 1 "for some" k in ZZ^+.$ \ Take $ k = n_1 n_2,$ then $
 (a b)^k = a^(n_1 n_2) b^(n_1 n_2) = 1^(n_2) 1^(n_1) = 1.
 $ Exists such k, and so $ a b in G$, i.e. closure is satisfied.

=== Assoc. 
Taivially satisfied, as $ G subset CC,$ each element is a complex number, and multiplication of complex numbers is associative.

=== Identity.
Trivially satisfied, as $ 1 in G$ (take $ n = 1$ ), and for any $ a in G, a 1 = 1 a = a.$

=== Inverse. 
Consider arbitrary $ a in G.$ Exists $ n in ZZ^+ med s.t. med  a^(n) = 1.$  
Rewriting, $ 
    a^(n-1) a = 1 => a^(n-1) = a^(-1). 
$ 
Since $ (z^(n-1))^n =(z^n)^(n-1) = 1, med z^(n-1) in G.$

Therefore, $ (G, times)$ is a group. #h(1fr) $qed$

#line(length: 100%)

== b. $ (G, +)$ is not a group. 
Assume identity exists, then for any $ a in G,$ $ 
     e + a = a + e = a. 
$ Since $ a,e in CC,$ the identity must be $ 0$. However, $ 0 in.not G$, since $ 0^n =0$ for any $ n in ZZ^+$, a contradiction. Thus the identity axiom is failed.#h(1fr) $qed$

#pagebreak()
= P5
We check the four axioms: 
=== Clousure:
As given in the problem, $H$ is closed under $star$ .
=== Associativity:
Since $H subset G$ and $star$ is associative on $G,$ $star$ is also associative on $H.$
=== Inverse:
We are given that $H$ is closed under inverse, and so the inverse axiom is satisfied.
=== Identity:
Since $H$ is nonempty, take arbitrary $h in H$. Since $H$ is closed under inverse, $h^(-1) in H$. Now, we have:
$ 
    h star h^(-1) = h^(-1) star h := e.
$ 
This identity element must exist in $H$ by closure of $H$ under $star$. Thus, the identity axiom is satisfied. 

#pagebreak()
= P6 
$(A, star)$ and $(B, diamond)$ are groups.  $A times B:= {(a, b) | a in A, b in B}$ with operation:$(a, b) (c, d) = (a star c, b diamond d)$ for all $(a, b), (c, d) in A times B.$

== 1. Check group axioms:
=== Closure:
Take arbitrary $(a_1, b_1) "and" (a_2,b_2) in A times B.$ Then, $ 
    (a_1, b_1)(a_2, b_2) = (a_1 star a_2, b_1 diamond b_2).
$ Since $A$ and $B$ are groups, $a_1 star a_2 in A$ and $b_1 diamond b_2 in B.$ Thus, $ (a_1 star a_2, b_1 diamond b_2) in A times B,$ i.e. closure is satisfied.

=== Associativity:
Take arbitrary $(a_1, b_1), (a_2, b_2), (a_3, b_3) in A times B.$ Then, $ 
    [(a_1med , med b_1)(a_2med , med b_2)](a_3med , med b_3) &= (a_1 star a_2med , med b_1 diamond b_2)(a_3med , med b_3) \ &= ((a_1 star a_2) star a_3med , med (b_1 diamond b_2) diamond b_3) \ &= (a_1 star (a_2 star a_3)med , med b_1 diamond (b_2 diamond b_3)) \ &= (a_1med , med b_1)(a_2 star a_3med , med b_2 diamond b_3) \ &= (a_1med , med b_1)[(a_2med , med b_2)(a_3med , med b_3)].
$ and so associativity is satisfied.

=== Identity:
Take arbitrary $(a, b) in A times B.$ Let $e_A$ and $e_B$ be the identity elements of $A$ and $B$ respectively. Then, $ 
    (a, b)(e_A, e_B) = (a star e_A, b diamond e_B) = (a, b)
$ and similarly, $(e_A, e_B)(a, b) = (e_A star a, e_B diamond b) = (a, b).$ Thus, the identity axiom is satisfied with identity element $ (e_A, e_B).$ #h(1fr) 

=== Inverse:
Take arbitrary $(a, b) in A times B.$ Let $a^(-1)$ and $b^(-1)$ be the inverses of $a$ and $b$ in $A$ and $B$ respectively. Then, $ 
    (a, b)(a^(-1), b^(-1)) = (a star a^(-1), b diamond b^(-1)) = (e_A, e_B).
$ Similarly, $(a^(-1), b^(-1))(a, b) = (e_A, e_B)$ and so the inverse axiom is satisfied. #h(1fr) $qed$

== 2. Prove that $A times B$ is abelian iff both $(A, star)$ and $(B, diamond)$ are abelian.

$==>:$ 
Assume $A times B$ is abelian, then for any $ a_1, a_2 in A$ and $ b_1, b_2 in B,$ we have: $ 
    (a_1, b_1)(a_2, b_2) = (a_2, b_2)(a_1, b_1).
    $ \ LHS: $ 
    (a_1, b_1)(a_2, b_2) = (a_1 star a_2, b_1 diamond b_2). 
    $ \ RHS: $
    (a_2, b_2)(a_1, b_1) = (a_2 star a_1, b_2 diamond b_1).
 $ \ Thus $a_1 star a_2 = a_2 star a_1$ and $b_1 diamond b_2 = b_2 diamond b_1$, and so $A$ and $B$ are abelian.

$<==:$ 
Assume both $(A, star)$ and $(B, diamond)$ are abelian, then for any $ a_1, a_2 in A$ and $ b_1, b_2 in B,$ we have: 
$ 
    (a_1,b_1)(a_2,b_2) = (a_1 star a_2, b_1 diamond b_2) = (a_2 star a_1, b_2 diamond b_1) = (a_2,b_2)(a_1,b_1).  
$ This shows that $A times B$ is abelian. #h(1fr) $qed$

#pagebreak()
= P7
== 1. Prove that $x y = y x "iff" y^(-1) x y = x "iff" x^(-1) y^(-1) x y = 1$.
- Start from left. 
Suppose $ x y = y x,$ applying $y^(-1)$ on both sides gives $y^(-1) x y = y^(-1) y x = x$.

Conversely, suppose $ y^(-1) x y = x,$ then $y y^(-1) x y = y x => x y  = y x.$ The first equivalence is proved.

- Now suppose $y  ^(-1)x y = x.$ Applying $x^(-1)$ on both sides gives $x^(-1) y^(-1) x y = x^(-1) x = 1.$
  \ Conversely, suppose $x^(-1) y^(-1) x y = 1.$ Applying $x$ on both sides gives $x x^(-1) y^(-1) x y = x => y^(-1) x y = x.$ The second equivalence is proved, thus completing the proof. #h(1fr) $qed$

== 2. Prove further that $|y x y^(-1)| = |x|$.
Let $|x| = n$ and $|y x y^(-1) = m$     
- First, prove that $m <= n$:
  Since $x^n = e,$ expanding $(y x y^(-1)):$  $ 
      y x y^(-1) y x y^(-1) ... y x y^(-1) (n times) &= y x^n y^(-1) \ &= y e y^(-1) \ &= e. 
  $ 
  And so $m$ divides $n$, i.e. $m <= n.$
- Then, prove that $n <= m$:
  Since $(y x y^(-1))^m = e,$expanding $(y x y^(-1))^m$ in the same way gives $ y x^m y^(-1) = e => y^(-1) x^m y^(-1) y = e => x^m = e $   
  and so $n$ divides $m$, i.e. $n <= m.$
Thus we have $m = n,$ i.e. $|y x y^(-1)| = |x|.$ #h(1fr) $qed$

=== 3. Prove that $|x y| = |y x| forall x, y in G.$
From part 2, we know that for any $g, h in G,$ $ |g| = |h g h^(-1)|$.
Now let $g = x y$ and $h = x^(-1),$ then we can show: $ 
    |x y| = |x^(-1) (x y) (x^(-1))^(-1)| = |x^(-1) x y x| = |y x| $ 
Thus $|x y| = |y x| forall x, y in G.$ #h(1fr) $qed$

#pagebreak()
= P8
As hinted, $t(G) = {g in G | g eq.not g^(-1)}$.
Consider any $g in t(G),$ then $g^(-1) in t(G)$ as well. 
\ This implies that $g$ and $g^(-1)$are distinct, and so $t(G)$ is composed of pairs of elements, and so $|t(G)|$ is even.
\ Since $|G|$ is also even, $|G| - |t(G)|$ is even.

Now, $G - t(G)$ is nonempty since the identity $e in.not t(G)$. Thus exists $
a eq.not e med s.t. med a in G- t(G). $

We chose $a in.not t(G)$, then $a = a^(-1)$ so that $a^2  = e, a eq.not e$. This implies that a is an element of order 2. #h(1fr) $qed$   