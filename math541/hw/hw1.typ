#set math.equation(numbering: "(1)")
#set page(margin: (x: 1.2cm, y: 1.2cm))
 #import "@preview/physica:0.9.3": *
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

+ Multiplication tables are special cases of Latin squares, in particular, they hold hold the property of associativity. This restricts the set of possible Latin squares, because:

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
$ Since $ a,e in CC,$ the identity must be $ 0$. However, $ 0 in.not G$, since $ 0^n =0$ for any $ n in ZZ^+$, a contradiction. #h(1fr) $qed$

#pagebreak()
= P5
$$ 