NT gg;
F PsiP, Eprop, EPH, Zprop, EZ;
S D, [D-4], m,M, ax, vec, [sqrt2];
V l, q,q1, k1, k2, k3;
I m1, mu1,mu2,mu3,mu4,alpha,beta, zero=0, five=0;
I i1,...,i10;
V v1,...,v10;
CF FD,coeff1, coeff2, po, poinv,acc;
S [l^2];
S x1,x2,x3, x,y,z, a,b,c,d,xi,rtxi, [1-x1], [1-x2], [1-x3],n;
Dimension D:[D-4];
Unittrace D;
#define MAXGAM "30"
#define stepCount "2"
I <j1=0>,...,<j`MAXGAM'=0>,j301=0;

#include diagE

*taking out 1/[sqrt2]*e^5/(4swcw)^2

id PsiP = 1/2/m * (m*gg(m1) + gg(m1, j301)*q(j301))*gg(m1, five);

id EZ(alpha?) = i_ * vec * gg(m1, alpha) + i_ * ax * gg(m1, alpha)* gg(m1,five);
#do i = 1,`MAXGAM'
  if (count(Eprop,1))
    id once Eprop(l?) = i_ * (gg(m1,j`i')*l(j`i') + m*gg(m1))*FD(l,m);
#enddo

id Zprop(alpha?,beta?) = -i_ *( d_(alpha,beta)*FD(l,M) 
    - l(alpha)*l(beta)/M^2 * (FD(l,M) - FD(l,rtxi*M)) ) ;

id EPH(mu1?) = i_ * gg(m1,mu1);
B gg;
.sort
Collect coeff1;
.sort
#call trace5D
contract;
.sort
if (count(e_,1)!=0) discard;
.sort
id coeff1(a?) = a;
.sort
sum j1,...,j`MAXGAM',j301;
.sort

* subtracting counter term, it turns out that the only contribution is ax*vec. There is no scalar contrib; thus just the mass renormalization is enough
* wave function renormalization isn't necessary.
* Here Sigma_1loop^R (q1) = Sigma_1loop(q1) - Sigma_1loop(m)
* with Sigma_1loop^R (m) = 0 = Sigma^1loop(m) - Sigma_1loop(m)

L MEctr(mu1,mu2,mu3) = ME(mu1,mu2,mu3);
.sort
inexpression MEctr;
  multiply replace_(q1,q);
endinexpression;

inexpression ME;
  multiply replace_(q1,q-k1);
*  argument FD;
*    id q1 = q-k1;
*  endargument;
*  id q1 = q-k1;
endinexpression;
*print +s;
.sort
Drop;
ndrop MErenorm;
L MErenorm(mu1,mu2,mu3) = ME(mu1,mu2,mu3) - MEctr(mu1,mu2,mu3);


.sort
id FD(q-k1,m) = -1/2/q.k1;
id FD(q-k1-k2,m) = -1/2/q.k3;
#call scalarProdNoX

#call toFormFactors(MErenorm,magE)
Drop;
ndrop magE;
#call scalarProdNoX
.sort

.sort


