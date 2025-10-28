NT gg;
F PsiP, Eprop, EPH, Zprop, EZ, EpropNew;
S D, [D-4], m,M, ax, vec, [sqrt2];
V l, q,q1, k1, k2, k3;
I m1, mu1,mu2,mu3,mu4,alpha,beta, zero=0, five=0;
I i1,...,i10;
V v1,...,v10;
CF FD,fNoL, coeff1, coeff2, po, poinv,acc;
S [l^2], SigmaVren, SigmaAren, SigmaSren;
S x1,x2,x3, x,y,z, a,b,c,d,xi,rtxi,[1-2*x1] ,[1-x1], [1-x2], [1-x3],n;
Dimension D:[D-4];
Unittrace D;
#define MAXGAM "30"
#define stepCount "5"
I <j1=0>,...,<j`MAXGAM'=0>,j301=0;


#include diagE
.sort

#call definePropVertex
.sort

Drop ELoop;
L SigmaA = -1/D/q1.q1*g_(2,q1,5_)*ELoop;
.sort

if (match(g_(m1?,5_))==1) discard;
.sort
tracen 2;
tracen 1;
contract;
.sort

L deltaZA = SigmaA;
.sort
if (expression(deltaZA));
  id q1.q1^a? = m^(2*a);
  id l?!{q1,}.q1 = l.q;
  argument FD;
    id q1 = q;
  endargument;
elseif(expression(SigmaA));
*  id q1.q1^a? = m^(2*a)*[1-2*x1]^a;
*  repeat id l?!{q1,}.q1 = l.q - l.k1;
*  argument FD;
*    id q1 = q-k1;
*  endargument;
endif;
print +s;
.sort
Drop SigmaA, deltaZA;
id SigmaAren = SigmaA-deltaZA;
.sort
id FD(q-k1,m) = -1/2/q.k1;
id FD(q-k1-k2,m) = -1/2/q.k3;
#call scalarProdNoX
id ax*vec = 1;
.sort
#call toFormFactors(ME,magE)
*L magE = ME;
#call scalarProdNoX
.sort



