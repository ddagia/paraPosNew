NT gg;
F PsiP, Eprop, EPH, Zprop, EZ;
S D, [D-4], m,M, ax, vec, [sqrt2];
V l, q, k1, k2, k3;
I m1, mu1,mu2,mu3,mu4,alpha,beta, zero=0, five=0;
I i1,...,i10;
V v1,...,v10;
CF FD,coeff1, coeff2, po, poinv,acc;
S [l^2];
S x1,x2,x3, x,y,z, a,b,c,d,xi,rtxi;
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
id FD(q-k1,m) = -1/2/q.k1;
id FD(q-k1-k2,m) = -1/2/q.k3;
#call scalarProdNoX

#call toFormFactors(ME,magE)
Drop ME;
#call scalarProdNoX
.sort

.sort


