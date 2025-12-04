
S D, [D-4], m,M, ax, vec, [sqrt2],z1,zi;
Dimension D:[D-4];
Unittrace D;
F EZ, Eprop,Zprop, del, EG, Gprop,PsiP,EpropNew,EPH, EPHNew,
NT gg;
V l, q,q1, k1, k2, k3;
S SigmaVren, deltaZAren, SigmaSren, SigmaAren, LambdaVren, LambdaAren;
V v1,...,v10,qq,pp,p;
CF FD,fNoL, coeff1, coeff2, po, poinv,acc,den;
S [l^2];
S x1,x2,x3, x,y,z, a,b,c,d,xi,rtxi, [1-x1], [1-x2], [1-x3], [1-2*x1],n;
I m1,m2, mu1,mu2,mu3,mu4,alpha,beta, zero=0, five=0;
I <i1=0>,...,<i10=0>,mu;
#define MAXGAM "30"
#define stepCount "5"
I <j1=0>,...,<j`MAXGAM'=0>;

L LoopNew = PsiP*EZ(1,beta)*Eprop(1,l+q-k1-k2)*EPH(1,mu2)*Eprop(1,l+q-k1)*EPH(1,mu1)*Eprop(1,l+q)*EZ(1,alpha)*Zprop(l,alpha,beta);
.sort

#call definePropVertex
*id FD(?a) = 1;
print +s;
.sort
if (match(g_(1,5_))!=0) discard;
.sort
tracen 1; 
#call toFormFactors(LoopNew, LoopNewFF)
.sort
Drop LoopNew, LoopNewFF;
L hard = LoopNewFF;
L soft = LoopNewFF;
.sort

inexpression soft;
  #call newExpand(FD(l\,M) ,-1/M^2 , l.l)
  #call newExpand(FD(l\,rtxi*M), -1/xi/M^2,l.l )
  multiply replace_(l,l-q);
  if (count(M,1)<-8) discard;
endinexpression;


inexpression hard;
  #call newExpand(FD(l+q\,m), 1/[l^2], (2*l.q))
  if (count([l^2],2,l,1)<-6) discard;
  #call newExpand(FD(l+q-k1\,m),1/[l^2],(2*l.q - 2*l.k1 - 2*q.k1))
  if (count([l^2],2,l,1)<-6) discard;
  #call newExpand(FD(l+q-k1-k2\,m),1/[l^2],(2*l.q - 2*l.k1 - 2*l.k2 - 2*q.k1 -2*q.k2 + k1.k2))
*  #call newExpand(FD(l+q1\,m), 1/[l^2], (2*l.q1 + q1.q1 - m^2))
  if (count([l^2],2,l,1)<-6) discard;
endinexpression;
.sort
id FD(v1?,m?) = fNoL(v1-l,m);
.sort
inexpression soft;
  id l.q = -1/2*(l.k1+l.k2+l.k3);
  #call createFD0(l)
  id l.k2*fNoL(-k1-k2,m)*fNoL(0,m) = -1/2 * (fNoL(0,m) - fNoL(-k1-k2,m) + 2*(l.k1+k1.k2)*fNoL(0,m)*fNoL(-k1-k2,m));
  #call createFD0(l)
endinexpression;
#call scalarProdNoX
ModuleOption local $vec;
print +s;
.sort
#call threePoint(l,[l^2])
.sort
#call createFD0(l)
#call scalarProdNoX
ModuleOption local $vec;
.sort
#call twoPoint(l,[l^2],{k1\,k2})
#call scalarProdNoX
.sort
#call createFD0(l)
#call scalarProdNoX
ModuleOption local $vec;
.sort
#call onePoint(l,[l^2])
#call scalarProdNoX
print +s;
.sort
S ep;
#call pochtablenew
.sort
#call smallpo

id [D-4] = D-4;
id D = 4-2*ep;
id D^-1 = 1/4 + ep/8 +ep^2/16;
id rtxi^a? = xi^(a/2);
argument;
  id rtxi^a? = xi^(a/2);
endargument;
*id 1/D4 = 1/24 + 5*ep/144 + 19*ep^2/864;
id acc(a?) = a;

.sort

id A0(a?) = a/ep - a*(1-ln_(a));
id B0(0,a?,a?) = 1/ep - ln_(a);

if (count(ep,1)>0) discard;
if (count(M,1)<-4) discard;
B ep;
print +s;
.sort

*B A0, F1,F2,F3,F4;
*print +s;
.sort
Drop hard soft;
L tot = hard + soft;
.sort
B ep;
print +s;
.end
