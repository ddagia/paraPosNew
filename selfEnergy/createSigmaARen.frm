F EZ, Eprop,Zprop, del, EG, Gprop;
NT gg;
S D, [D-4], m,M, ax, vec, [sqrt2],z1,zi;
V l, q,q1, k1, k2, k3;
I m1,m2, mu1,mu2,mu3,mu4,alpha=0,beta=0, zero=0, five=0;
I <i1=0>,...,<i10=0>;
V v1,...,v10;
CF FD,fNoL, coeff1, coeff2, po, poinv,acc,den;
S [l^2];
S x1,x2,x3, x,y,z, a,b,c,d,xi,rtxi, [1-x1], [1-x2], [1-x3], [1-2*x1],n;
Dimension D:[D-4];
Unittrace D;
#define MAXGAM "30"
#define stepCount "5"
I <j1=0>,...,<j`MAXGAM'=0>;

L EpropNew = EZ(beta) * Eprop(l+q1) * EZ(alpha) *Zprop(l,alpha,beta) ;

id EZ(alpha?) = i_ * vec * g_(1, alpha) - i_ * ax * g_(1, alpha)* g_(1,5_);
id Zprop(l,alpha?,beta?) = -i_ * d_(alpha,beta)*FD(l,M) 
      +i_*l(alpha)*l(beta)/M^2 * (FD(l,M) - FD(l,rtxi*M)) 
    ;
id Eprop(l?) = i_ * (g_(1,l)+m*gi_(1))*FD(l,m);
.sort

L SigmaA = -1/D/q1.q1 *g_(1,q1)*g_(1,5_)*EpropNew;
.sort
if (match(g_(1,5_))==1) discard;

tracen 1;
sum alpha,beta;
.sort
L deltaZA = SigmaA;
.sort
if (expression(deltaZA));
  id q1.q1^a? = m^(2*a);
  id l?!{,q1}.q1^a? = l.q^a;
  argument FD;
    id q1 = q;
  endargument;
elseif(expression(SigmaA));
  id q1.q1^a? = m^(2*a)*[1-2*x1]^a;
  repeat id l?!{,q1}.q1 = l.q - l.k1;
  argument FD;
    id q1 = q-k1;
  endargument;
endif;
.sort
L SigmaAren = SigmaA - deltaZA;
.sort
Drop;
ndrop hard, soft;
L hard = SigmaAren;
L soft = SigmaAren;

inexpression soft;
  #call newExpand(FD(l\,M) ,-1/M^2 , l.l)
  #call newExpand(FD(l\,rtxi*M), -1/xi/M^2,l.l )
endinexpression;


inexpression hard;
  #call newExpand(FD(l+q-k1\,m),1/[l^2],(2*l.q - 2*l.k1 - 2*q.k1))
  #call newExpand(FD(l+q\,m), 1/[l^2], (2*l.q))
*  #call newExpand(FD(l+q1\,m), 1/[l^2], (2*l.q1 + q1.q1 - m^2))
endinexpression;
.sort
id FD(v1?,m?) = fNoL(v1-l,m);
print +s;
.sort
#call createFD0(l)
#call scalarProdNoX
ModuleOption local $vec;
print +s;
.sort
#call onePoint(l,[l^2])
#call scalarProdNoX
print +s;
.sort
S ep;
#call pochtablenew
.sort
#call smallpo

id D = 4-2*ep;
id rtxi^a? = xi^(a/2);
argument;
  id rtxi^a? = xi^(a/2);
endargument;
*id 1/D4 = 1/24 + 5*ep/144 + 19*ep^2/864;
id [D-4] = -2*ep;
id acc(a?) = a;

*B A0, F1,F2,F3,F4;
*print +s;
.sort

id A0(a?) = a/ep - a*(1-ln_(a));

if (count(ep,1)>0) discard;
if (count(M,1)<-4) discard;
B ep;
.sort
#call scalarProdNoX
#call scalarProd(x1)
.sort
L tot = hard + soft;



B ep,ax,vec, g_;
print +s hard, soft, tot;
.end
