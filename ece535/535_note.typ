#import "@preview/physica:0.9.5": *
#import "@preview/ilm:1.4.0": *
#show heading: text.with(size: 13pt, weight: 1000)
#set text(11pt)
#set page(margin: (x: 2cm, y: 2cm),numbering: "1/1", columns: 1, flipped: false)
#set math.equation(numbering:"(1)")
// #show math.equation: set text(11pt)
// #set math.cases(gap: 0.2em)
#heading(outlined: false)[ECE 535 Quantum Sensing]
Lectures by Prof. Jennifer Choy.\
not sure what this class is about...
#line(length: 100%, stroke: (thickness: 2pt))
#set heading(numbering: "1.1")
#outline(indent: auto,depth:2)
#pagebreak()

= 1c Diffraction and the nunncertainty principle 
== REsolution limits in electron and light microscopy
== Diffraction of matter waves 


== Defining wave functions
- Probablistic interpretation
  WE model a particle as wave $psi(x)$ . The pdf: $ 
      P(x) = abs(psi(x))^2, quad int_(-infinity)^(infinity) P(x) dif x = 1.
  $ 
  



- Wave function 
  EM wave : $arrow(p) = hbar arrow(k), E = hbar omega:$ $ 
      E prop E_0 exp(i/hbar( arrow(p) dot arrow(r) - E omega t)) 
  $ 
   For a particle in 1D (Fourier Transform): 
   $ 
       psi(x,t) prop exp(i hbar (p_0 x - E t)); quad E_0 = p^2 /2m \ Psi(x,t) prop integral_(-infinity)^(infinity) psi dif t
   $ 
  

== The Uncertainty Principle

- Uncertainty Principle $ 
    Delta p Delta x >= hbar/2 ; quad  Delta E Delta t >= hbar/2
$ 

- The uncertainty principle is derived form the wave nature of matter 
  The wave function is not normalized. Fix this by defining a *wave packet* that localizes the matter wave within a spatial interval $Delta x$ .
  Take analogy from light waves: a gaussian beam: $ 
      E(r, z, t) = E_0 exp(- r^2 slash w^2 ) exp(i(k z - omega t )) 
  $ where $w$ is the beam waist, a function of $z$ . 
  
 A wave packet comprises of superposition of monochromatic waves with frequencies $omega_j$ in interval $Delta omega.$ 
 
 $ 
     psi(x,t) 
 $ 
 
 

 To find time dependence of the peak: $ 
     0  = (dif omega)/(dif k)_(k_0) t - x_"max" => x_"max" = (dif omega)/(dif k)_(k_0) t = frac(hbar k_0 ,m ) t 
 $ 
 
 where we read off the particle velocity $v = frac(hbar k_0 , m) t$ . Eqiuvalant to group velocity of a wave packet.