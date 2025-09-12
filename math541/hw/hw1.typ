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

= P3
