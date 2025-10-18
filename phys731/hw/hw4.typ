#set math.equation(numbering: "(1)")
#set text(
font: "Palatino Linotype",size: 11pt)
#set page(margin: (x: 1cm, y: 1cm), numbering: "1/1")
#import "@preview/physica:0.9.6": *
#place(top + right, rect(inset: 3pt)[phys731 hw4, Harry Luo
])
= 1
#align(
  left,
  rect(inset: 8pt)[#image("assets/2025-10-16-15-58-27.png")]
)
=== 1).
Hamiltonian under $ bold(B):$ $ bold(H) = - bold(mu) dot  bold(B) = frac(e g B , 2 m_e) S_z equiv omega S_z. $ 
Initial state $ 
ket(psi(0))= ket(hat(n) ";"t)= cos(beta/2) ket(+) + sin(beta/2) ket(-)
$ 
and the time evolution is given by $ 
ket(psi(t)) = hat(U)(t) ket(psi(0)) = e^(-i H t slash hbar) ket(psi(0)) &= e^(- i omega S_z t slash hbar)  [cos(beta/2) ket(+) + sin(beta/2) ket(-)] \ 
& = cos(beta/2) e^(-i omega t slash 2) ket(+) + sin(beta/2) e^(i omega t slash 2) ket(-). 
$
So we have projection on $ ket(+)$ as   $ 
braket(+_x, psi) = 1/sqrt(2) (bra(+) + bra(-)) ket(psi) = 1/sqrt(2) (cos(beta/2) e^(-i omega t slash 2) + sin(beta/2)e^(i omega t slash 2) ). 
$ 
Denote $Omega = omega t slash 2,$ we find the probability of measuring $S_x = hbar/2$ is $ 
abs(braket(+_x, psi))^2 = 1/2 (cos(beta/2) e^(i Omega) + sin(beta/2)e^(i Omega) )^2  = 1/2[1 + sin beta cos(2 Omega)] = 
#rect(inset: 8pt)[
$ display(1/2[1 + sin beta cos(omega t)].)$
]
$ 
=== 2). 
To find $expval(S_x)(t)$, it is eluding to work in the Hisenburg picture, since $ 
expectationvalue(S_x) = braket(psi_0, S_x (t), psi_0)  ,
$ <eq.sx> and $S_x (t)$ can be found in the Hisenburg picture with $ 
 dv(S_x,t) &= 1/(i hbar) [S_x, H] = omega/(i hbar)[S_x, S_z] = - omega S_y, \
 dv(S_y, t) &= omega/(i hbar)[S_y, S_z]= omega S_x. 
$ Taking derivative of the first equation again, and substituting the second equation in, we have $ 
 dv(S_x,t,2) = - omega^2 S_x,
  $ which has the solution 
 $ 
 S_x = c_1 cos(omega t)+ c_2 sin(omega t). 
 $ Initial value $ S_x (0) = c_1, \
dv(S_x (0),t) = -c_2 omega = - omega S_y (0)
 $ So the solution becomes $ 
 S_x (t) = S_x (0) cos(omega t) - S_y (0) sin(omega t).
 $ 
 Going back to @eq.sx, we have $ 
 expectationvalue(S_x)(t)= braket(psi_0, S_x (t), psi_0)  &=braket(psi_0, S_x (0) cos omega t - S_y (0) sin omega t, psi_0) \ 
 & = braket(psi_0, S_x (0), psi_0) cos omega t - braket(psi_0, S_y (0), psi_0) sin omega t \ 
 & = expectationvalue(S_x)_0 cos omega t - expectationvalue(S_y)_0 sin omega t. 
 $ 
Since initial spin in x-z plane, $expval(S_y)_0 = 0.$ and $ 
expectationvalue(S_x)_0 &= braket(psi_0, S_x, psi_0)  \ 
& = (cos (beta/2) bra(+) + sin(beta/2) bra(-)) S_x (cos(beta/2) ket(+) + sin(beta/2) ket(-)) \ 
& = hbar/2 sin beta.
$ 

Thus, $ 
#rect(inset: 8pt)[
$ display(expectationvalue(S_x)(t) = hbar/2 sin beta cos omega t.)$
]
  
$ 

=== 3). Limit case of $beta = 0, pi/2$
 

 1. $beta=0$: 
   $ 
   abs(braket(+_x, psi))^2 = 1/2, quad expectationvalue(S_x)(t) =0   
   $ Which means a completely mixed state in $S_x$ measurement, and no time evolution in $expval(S_x).$ This makes sense since $[S_x, S_z] eq.not 0$ so definite $S_z$ means completely uncertain $S_x.$ 
2. $beta = pi/2$: 
   $ 
   abs(braket(+_x, psi))^2 = 1/2[1 + cos(omega t)], quad expectationvalue(S_x)(t) = hbar/2 cos(omega t). 
   $
   This means that the initial state is fixed at $ket(+)_x$, and the state evolution is a perfect precession around z axis. 

#pagebreak()
= 2
#align(
  left,
  rect(inset: 8pt)[#image("assets/2025-10-16-15-44-29.png")]
)

A $nu_e -> nu_e$ transition is characterized as $braket(nu_e, psi)$ with  $ 
ket(psi) = U ket(psi_0)= e^(-i H t slash hbar) ket(psi_0) ,
$ 
where $ket(psi_0) = ket(nu_e) = cos(theta ) ket(nu_1) - sin(theta) ket(nu_2).$ Using $H ket(nu_i) = E_i ket(nu_i),$ we have $ 
ket(psi) = e^(-i E_1 t slash hbar) cos theta ket(nu_1) - e^(-i E_2 t slash hbar) sin theta ket(nu_2) 
$ 
Projecting to $ket(nu_e)$ we have $ 
braket(nu_e,psi) &= (cos theta bra(nu_1) - sin theta bra(nu_2)) (e^(-i E_1 t slash hbar) cos theta ket(nu_1) - e^(-i E_2 t slash hbar) sin theta ket(nu_2)) \ 
& = cos^2 theta e^(- i E_1 t slash hbar) + sin^2 theta e^(-i E_2 t slash hbar) .
$ The probability of $nu_e -> nu_e $ transition is thus $ 
P = abs(braket(nu_e, psi))^2 &= 1- sin^2 (2theta)sin^2 (frac(Delta E t , 2 hbar) ), quad  (Delta E equiv E_2 - E_1)

$ Using the appriximations given in the problem, $ 
Delta E = frac(Delta m^2  c^3 , 2 p) = frac(Delta m^2  c^4 , 2E) , quad t = L/c. 
$ 

Thesefore the probability becomes $ 
P = 1- sin^2 (2 theta) sin^2 (frac(Delta m^2  c^4 L , 4 E hbar c) ), 
$ 

which is exactly as wanted.

#pagebreak()
= 3
#align(
  left,
  rect(inset: 8pt)[#image("assets/2025-10-16-15-57-34.png")]
)

=== 1). 
Let $ket(alpha) = r ket(R) + l ket(L),$ then the eigenequatino reads $ 
H ket(alpha) =  Delta r ket(L) + Delta l ket(R) = E r ket(R) + E l ket(L) \ 
=> Delta l = E r; quad Delta r = E l,\
=>  E = plus.minus Delta.
$ 
The corresponding eigenvectors are : 
- $E = Delta: $ $ 
cases(Delta l = Delta r, l^2 + r^2  = 1) => ket(+) = Delta/sqrt(2) ket(R) + Delta/sqrt(2) ket(L). 
$ 
- $E = - Delta: $ $ 
cases(Delta l = - Delta r, l^2 +r^2 =1) => ket(-) = Delta/sqrt(2) ket(R) - Delta/sqrt(2) ket(L) 
$ 
and the statevector in the eigenbasis is $ 
ket(alpha) = r/(sqrt(2) ) (ket(+) + ket(-)) + l/(sqrt(2) ) (ket(+) - ket(-)) = (r+l)/sqrt(2) ket(+) + (r-l)/sqrt(2) ket(-).
$ 
=== 2). 
The time evolution in the eigenbasis is $ 
ket(psi) equiv ket(alpha\, t=t_0\,t) = hat(U) ket(alpha) = frac(r + l , sqrt(2) ) e^(- i Delta t slash hbar)  ket(+) + frac(r - l , sqrt(2) ) e^(i Delta t slash hbar)  ket(-).
$ 
=== 3). 
WIth initial condition now $ket(alpha\,t=0) = ket(R),$ we have $r = 1, l =0.$ Then the statevector becomes $ 
ket(psi) &= 1/sqrt(2) e^(-i theta) ket(+) + 1/sqrt(2) e^(i theta) ket(-), quad (theta equiv Delta t slash hbar) .
$ Re-expressing in the $ket(R), ket(L)$ basis, we have $ 
ket(psi) = (-i sin theta) ket(L) + cos theta ket(R). 
$ 
The probability of measuring $ket(L)$ is thus $ 
 P = abs(braket(L, psi))^2  = sin^2 theta = sin^2 ((Delta t)/hbar). $ 

=== 4). 
Using Schrodinger equation, we have $ 
i hbar partial_t ket(psi(t)) = H ket(psi(t)).
$ Apply $ket(L), ket(R)$ on both sides, respectively, we have $ 
bra(L)( i hbar partial_t ket(psi(t))= bra(L) H ket(psi(t)) => quad i hbar dot(C)_L = Delta C_R, \
bra(R)( i hbar partial_t ket(psi(t))= bra(R) H ket(psi(t)) => quad i hbar dot(C)_R = Delta C_L.
$ 
Taking derivative of the first term, and inserting the second term, we have $ 
i hbar dot.double(C)_L = - Delta^2/ hbar^2 C_L  
$ with solution (letting $theta equiv Delta t slash hbar$ ):$ 
C_L (t) = A cos theta + i B sin theta. 
$ 
Similarily, for $C_R$ we have $ 
C_R (t)= A sin theta + i B cos theta
$ 
Initial condition was $C_L (0) = l, C_R (0) = r,$ so $ 
C_L (0) = A =l, quad C_R (0) = i B = r
$ Then the solution becomes $ 
C_L(t) = l cos theta + r sin theta, quad C_R (t)= l sin theta + r cos theta 
$ 
Comparing from part B, $ 
C_L = braket(L, psi(t)) = frac(r + l , sqrt(2) ) e^(-i theta) braket(L, +) + frac(r - l , sqrt(2) ) e^(i theta) braket(L, -) =1/2((r+l) e^(-i theta) - (r-l) e^(i theta)) = l cos theta + r sin theta \ 
C_R = braket(R, psi(t)) = frac(r + l , sqrt(2) ) e^(-i theta) braket(R, +) + frac(r - l , sqrt(2) ) e^(i theta) braket(R, -) =1/2((r+l) e^(-i theta) + (r-l) e^(i theta)) = r cos theta + l sin theta
$ Exactly as wanted. 


=== 5) 
Taking the erronous Hamiltonian $ 
H' = Delta ketbra(L,R). 
$
Then applying to Schrodinger equation, we have $ 
bra(L) (i hbar partial_t ket(psi)) = braket(L, H', psi)=> i hbar dot(C)_L = Delta C_R ; \ 
bra(R) (i hbar partial_t ket(psi)) = braket(R, H', psi)=> i hbar dot(C)_R = 0  
$ With initial condition $C_L (0) = l, C_R (0) = r,$ we have $
C_R (t) = r, quad C_L (t) = C_L (0) + integral_0^t Delta r/(i hbar) dif t' = l - i Delta r t slash hbar.
$
And the total probability is $ 
P(t) = abs(C_L (t))^2  + abs(C_R)^2 = l^2  + r^2 + frac(Delta^2 r^2 t^2  , hbar^2 ) >1  
$ 
Which violates the conservation of probability, thus unphysical.

#pagebreak()
= 4
#align(
  left,
  rect(inset: 8pt)[#image("assets/2025-10-16-21-06-26.png")]
)
=== 1).

We recite the time-independent solution to 1D infinite potential well: $ 
u_n (x) = braket(x,n) = sqrt(2/L) sin(frac(n pi x , L) ), quad E_n= frac(hbar^2 pi^2 n^2  , 2 m L^2 ) . 
$ 

The time evolution is given by $ 
psi(x,t) = braket(x,alpha\,t) = sum_(n) braket(x,n) braket(n, alpha\, t)  = sum_n u_n (x) bra(n) e^(- i E_n t slash hbar) ket(alpha\,0) = sum_(n)c_n u_n (x) e^(- i E_n t slash hbar) ,
$ 
with $c_n equiv braket(n,alpha\,0) = integral_0^L u^*_n (x) psi(x,t) dif x$ 

From the problem statement, $psi(alpha,0)=braket(x,alpha\,0)$  is known with certainty as $ 
psi(alpha,0) = delta(x-L/2) 
$ and so $ 
c_n = integral_(0)^(L) u^*_n (x) delta(x - L/2) dif x = u_n (L/2)= sqrt(2/L) sin(frac(n pi  , 2,) ) = cases(0 quad n "even", sqrt(2/L) (-1)^((n- 1) / 2) quad n "odd" )
$ 
So for odd n, the time evolution is $ 
psi(x,t)=sum_(n= "odd") 2/L (-1)^((n - 1)/2) sin(frac(n pi x , L) ) e^(- i E_n t slash hbar) .   
$ 

=== 2)
We still have $ 
psi(x,t) = sum_(n) c_n u_n (x)e^(- i E_n t slash hbar) , quad c_n = integral_0 ^L u^*_n psi(x,0) dif x   .
$ 
At time 0, we now have $ 
psi(x,0) equiv braket(x, alpha\,0) = C [H(x - L/2 + epsilon ) - H(x - L/2 - epsilon ) ], 
$ 
where $H(x)$ is the Heaviside step function, and $C$ is the normalization constant. Normalizing gives $ 
integral_(0)^(L) abs(psi(x,0))^2  dif x= c^2 (2 epsilon ) = 1 quad => c = frac(1 , sqrt(2 epsilon ) )   
$ 
and therefore the statefunction $ 
psi(x,0) = cases(1/sqrt(2 epsilon) quad x in [L/2 - epsilon, L/2 + epsilon], 0 quad "else") 
$ 

and the coefficients $c_n$ is $ 
c_n =& integral_(L/2 - epsilon )^(L/2 + epsilon ) sqrt(2/L) sin((n pi x) / L) (1/(sqrt(2 epsilon) )) dif x \ 
& =  -frac(sqrt(L)  , n pi sqrt(epsilon) ) [cos((n pi)/2 + (n pi epsilon)/L) - cos((n pi)/2 - frac(n pi epsilon , L) )]= frac(2 sqrt(L)  ,n pi sqrt(epsilon)  )sin(frac(n pi  , 2) ) sin (frac(n pi epsilon , L) )   
$ 
 
Therefore $ 
psi(x,t) = sum_(n "odd")^infinity frac(2 sqrt(2)  , n pi sqrt(epsilon) ) (-1)^((n-1)/2)  sin (frac(n pi epsilon , L) ) sin(frac(n pi x , L) ) e^(- i E_n t slash hbar) .   
$ 



#pagebreak()
= 5 
#align(
  left,
  rect(inset: 8pt)[#image("assets/2025-10-17-18-28-32.png")]
)

In a delta attractive potential well, the initial state is prepared as $ 
psi_0 (x) = sqrt(kappa) e^(- kappa abs(x))   , quad kappa = m lambda slash hbar^2 .
$ 

Immediately after $t=0,$ the potential is turned off, so the initial state is the same $ 
psi(x,0) = psi_0 (x) = sqrt(frac(m lambda , hbar^2 ) ) exp(- frac(m lambda , hbar^2 ) abs(x)) 
$ 
The evolution of a free particle is given by the 1D free particle propagator to be$ 
 psi(x,t) &= integral_(-infinity)^(infinity) K(x,t ; x', t_0) psi(x',0) dif x \ &= integral_(-infinity)^(infinity) ((frac(m , 2 pi i hbar t))^(1 slash 2) exp[frac(i m(x-x')^2  , 2 hbar t) ]) med sqrt(frac(m lambda , hbar^2 ) ) exp[- frac(m lambda , hbar^2 ) abs(x')] dif x'
$ 



