F EZ, Eprop,Zprop, del, EG, Gprop;
NT gg;
S D, [D-4], m,M, ax, vec, [sqrt2],z1,zi;
V l, q,q1, k1, k2, k3;
I m1,m2, mu1,mu2,mu3,mu4,alpha=0,beta=0, zero=0, five=0;
I <i1=0>,...,<i10=0>;
V v1,...,v10;
CF FD,coeff1, coeff2, po, poinv,acc,den;
S [l^2];
S x1,x2,x3, x,y,z, a,b,c,d,xi,rtxi, [1-x1], [1-x2], [1-x3],n;
Dimension D:[D-4];
Unittrace D;
#define MAXGAM "30"
#define stepCount "2"
I <j1=0>,...,<j`MAXGAM'=0>,j301=0;


L EpropNew = EZ(beta) * Eprop(l+q1) * EZ(alpha) *Zprop(alpha,beta)
        ;
*
*id EZ(alpha?) = i_ * vec * gg(m2, alpha) + i_ * ax * gg(m2, alpha)* gg(m2,five);
*id Zprop(alpha?,beta?) = -i_ *( d_(alpha,beta)*FD(l,M) 
*      -l(alpha)*l(beta)/M^2 * (FD(l,M) - FD(l,rtxi*M)) )
*    ;
*
*#do i = 1,`MAXGAM'
*  if (count(Eprop,1))
*    id once Eprop(l?) = i_ * (gg(m2,j`i')*l(j`i') + m*gg(m2))*FD(l,m);
*#enddo
*.sort
*L SigmaS = 1/D/m * EpropNew;
*L SigmaV = 1/D/q1.q1 *gg(m2,j301)*q1(j301) *EpropNew ;
*L SigmaA = 1/D/q1.q1 *gg(m2,j301)*q1(j301)*gg(m2,five)*EpropNew;
*.sort
*L EpropNew = Eprop(q1);

id EZ(alpha?) = i_ * vec * g_(1, alpha) - i_ * ax * g_(1, alpha)* g_(1,5_);
id Zprop(alpha?,beta?) = -i_ * d_(alpha,beta)*FD(l,M) 
*      +i_*l(alpha)*l(beta)/M^2 * (FD(l,M) - FD(l,rtxi*M)) 
    ;

#do i = 1,`MAXGAM'
  if (count(Eprop,1))
    id once Eprop(l?) = i_ * (g_(1,j`i')*l(j`i') + m*g_(1))*FD(l,m);
#enddo
.sort
*L SigmaS = 1/D/m * EpropNew;
*L SigmaV = 1/D/q1.q1 *g_(1,j301)*q1(j301) *EpropNew ;
L SigmaA = -1/D/q1.q1 *g_(1,j301)*q1(j301)*g_(1,5_)*EpropNew;
.sort
if (match(g_(1,5_))==1) discard;
*#call trace5D
tracen 1;
.sort
sum <j1>,...,<j`MAXGAM'>,j301;
sum alpha,beta;
.sort
.sort
F FD, deriv;
*L residue = SigmaV + SigmaS;
print +s;
.sort
inexpression residue;
  #call calcDerivative(q1)
endinexpression;
.sort
CF FD;
*L deltaZV = SigmaV - 2*m^2*residue;
L deltaZA = SigmaA;
*L deltam = SigmaV + SigmaS ;
*L prop = gg(m1,q1)*SigmaV - gg(m1,q1)*gg(m1,five)*SigmaA + m*SigmaS;
L prop = 
*g_(1,q1)*SigmaV 
- g_(1,q1)*g_(1,5_)*SigmaA 
*+ m*SigmaS
;
.sort
if (expression(prop)==0);
  id q1.q1^a? = m^(2*a);
  id l.q1^a? = l.q^a;
  argument FD;
    id q1 = q;
*L deltaZV = SigmaV 
*L deltaZA = SigmaA;
  endargument;
endif;
.sort
*L counter = gg(m1,q1)*deltaZV - gg(m1,q1)*gg(m1,five)*deltaZA - m*(deltaZV+ deltam);
L counter = 
*g_(1,q1)*deltaZV 
- g_(1,q1)*g_(1,5_)*deltaZA 
*- m*(deltaZV+ deltam)
;
L renorm = prop-counter;

B gg;
print renorm;
.sort
Drop;
L hard = renorm;
L soft = renorm;
.sort

inexpression soft;
  #call newExpand(FD(l\,M) ,-1/M^2 , l.l)
  #call newExpand(FD(l\,rtxi*M), -1/xi/M^2,l.l )
endinexpression;


inexpression hard;
  #call newExpand(FD(l+q-k1\,m),1/[l^2],(2*l.q - 2*l.k1 - 2*q.k1))
  #call newExpand(FD(l+q\,m), 1/[l^2], (2*l.q+q.q-m^2))
  #call newExpand(FD(l+q1\,m), 1/[l^2], (2*l.q1 + q1.q1 - m^2))
endinexpression;
.sort
CF fNoL;
id FD(v1?,m?) = fNoL(v1-l,m);
#call createFD0(l)
#call scalarProdNoX
ModuleOption Local $vec;
.sort
#call twoPoint(l,[l^2],none)
#call scalarProdNoX
.sort
#call createFD0(l)
#call scalarProdNoX
ModuleOption Local $vec;
.sort

#call onePoint(l,[l^2])
#call scalarProdNoX
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

if (expression(MEsoft));
  if (count(M,1)<-4) discard;
elseif (expression(MEhard));
  if (count(M,1)<-6) discard;
endif;


if (count(ep,1)>1) discard;
*B A0, F1,F2,F3,F4;
*print +s;
.sort
id xi = 1;
id A0(a?) = a/ep - a*(1-ln_(a));
id B0(0,m?,m?) = 1/ep -ln_(m^2);
if (count(ep,1)>0) discard;
if (count(M,1)<-4) discard;
B ep;
print +s;
.sort
S [1-2*x1];
id q1.q1^a? = m^(2*a)*[1-2*x1]^a;
id q1.q = m^2*(1-x1);
id gg(m1,q1) = gg(m1,q)-gg(m1,k1);
repeat id x1/[1-2*x1] = -1/2*([1-2*x1]-1)/[1-2*x1];
id ax^2 = 0;
id vec^2 = 0;
#call scalarProdNoX
id g_(1,q1,5_) = 1;
.sort


B ep,ax,vec, g_;
print +s hard, soft;

.end
