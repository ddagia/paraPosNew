Off statistics;
S D, [D-4], m,M, ax, vec, [sqrt2];
Dimension D:[D-4];
Unittrace D;
NT gg;
F PsiP, Eprop, EPH, Zprop, EZ, EpropNew, EPHNew;
V l, q,k1, k2, k3, q1,q2,q3;
I m1, mu1,mu2,mu3,mu4,alpha,beta, zero=0, five=0;
I i1,...,i10;
V v1,...,v10;
CF FD,fNoL, coeff1, coeff2, po, poinv,acc, dot;
S [l^2], SigmaVren, SigmaAren, SigmaSren, LambdaVren, LambdaAren;
S x1,x2,x3, x,y,z, a,b,c,d,xi,rtxi,[1-2*x1],[1-2*x3] ,[1-x1], [1-x2], [1-x3],n;
#define MAXGAM "30"
#define stepCount "6"
I <j1=0>,...,<j`MAXGAM'=0>;

#ifndef `diag'
  #define diag "D"
#endif

#include diag`diag'
.sort

#call definePropVertex
.sort

Drop `diag'Loop;

*L SigmaA = i_/D/q1.q1*g_(2,q1,5_)* ELoop

*making SigmaA global as it is used by multiple diagrams.
L SigmaA = -1/D/q1.q1*g_(2,q1,5_)* EZ(2,beta) * Eprop(2,l+q1) * EZ(2,alpha) *Zprop(l,alpha,beta);

#if (`diag'=="D")
  L LambdaA = -1/D^2 *g_(2,mu2,5_)* DLoop;
#elseif (`diag'== "C")
  L LambdaA = -1/D^2 *g_(2,mu1,5_)* CLoop;
#endif;

*EZ(2,beta)*Eprop(2,q2+l)*EPH(2,mu2)*Eprop(2,q3+l)*EZ*(2,alpha)*Zprop(l,alpha,beta);
.sort

#call definePropVertex
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
id SigmaAren = -i_*(SigmaA -deltaZA);
#if (`diag'== "D" || `diag' == "C")
  id LambdaAren = LambdaA - deltaZA;
#endif;
.sort
id FD(q-k1,m) = -1/2/q.k1;
id FD(q-k1-k2,m) = -1/2/q.k3;
#call scalarProdNoX
id ax*vec = 1;
.sort
#call toFormFactors(M`diag',mag`diag')
*L magE = ME;
#call scalarProdNoX
.sort



