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
#define stepCount "6"
I <j1=0>,...,<j`MAXGAM'=0>;

L EPHnew = EZ(2,beta)*Eprop(2,pp+l)*EPH(2,mu)*Eprop(2,p+l)*EZ(2,alpha)*Zprop(l,alpha,beta);

L deltaZA = -1/D/q.q *g_(2,q,5_)* EZ(2,beta)*Eprop(2,q+l)*EZ(2,alpha)*Zprop(l,alpha,beta);

#call definePropVertex
*id FD(?a) = 1;
.sort
L pseudoscalar = 1/D * g_(2,5_)*EPHnew;
L scalar = 1/D *EPHnew;
L vector = 1/D  *g_(2,mu)*EPHnew;
L axial = -1/D^2 *g_(2,mu,5_)*EPHnew;
.sort
if (expression(EPHnew)==0);
  if (match(g_(2,5_))!=0) discard;
  tracen 2;
endif;


*id qq = q-k1;
print +s;
.sort
print +s;
.sort
Drop vector, scalar,pseudoscalar;

id vec^2 = 0;
id ax^2 = 0;
.sort
drop axial deltaZA;
L ren = axial - deltaZA;
.sort
L hard = ren;
L soft = ren;

inexpression soft;
  #call newExpand(FD(l\,M) ,-1/M^2 , l.l)
  #call newExpand(FD(l\,rtxi*M), -1/xi/M^2,l.l )
  multiply replace_(l,l-p);
  if (count(M,1)<-8) discard;
endinexpression;


inexpression hard;
  #call newExpand(FD(l+q-k1\,m),1/[l^2],(2*l.q - 2*l.k1 - 2*q.k1))
  #call newExpand(FD(l+q\,m), 1/[l^2], (2*l.q))
  #call newExpand(FD(l+p\,m), 1/[l^2], (2*l.p+p.p-m^2))
  #call newExpand(FD(l+pp\,m), 1/[l^2], (2*l.pp+pp.pp-m^2))
*  #call newExpand(FD(l+q1\,m), 1/[l^2], (2*l.q1 + q1.q1 - m^2))
  if (count([l^2],2,l,1)<-8) discard;
endinexpression;
.sort
.sort
id FD(v1?,m?) = fNoL(v1-l,m);
.sort
inexpression soft;
  #call createFD0(l)
endinexpression;
#call scalarProdNoX
ModuleOption local $vec;
.sort
id pp = p+k1;
argument;
  id pp = p+k1;
endargument;

.sort
#call twoPoint(l,[l^2],{k1\,})
#call scalarProdNoX
.sort
inexpression soft;
#call createFD0(l)
endinexpression;
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

.end
