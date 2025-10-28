#include propAndTrace.frm
*B F1,F2,F3,F4;
.sort
Drop magE;
L MEsoft = magE;
L MEhard = magE;
.sort
S z1, zi;

id FD(v1?,m?) = fNoL(v1-l,m);
.sort

inexpression MEsoft;
  #call newExpand(fNoL(0\,M) ,-1/M^2 , l.l)
  #call newExpand(fNoL(0\,rtxi*M), -1/xi/M^2,l.l )
  if (count(M,1)<-8) discard;
endinexpression;

inexpression MEhard;
  #call newExpand(fNoL(q-k1\,m),1/[l^2],(2*l.q - 2*l.k1 - 2*q.k1))
  #call newExpand(fNoL(q\,m), 1/[l^2], (2*l.q))
  #call newExpand(fNoL(q1\,m), 1/[l^2], (2*l.q1+q1.q1-m^2))
  if (count([l^2],2,l,1)<-8) discard;
endinexpression;
.sort


#call createFD0(l)
#call scalarProdNoX
ModuleOption local $vec;
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


if (count(ep,1)>1) discard;
*B A0, F1,F2,F3,F4;
*print +s;
.sort
id A0(a?) = a/ep - a*(1-ln_(a));
*id B0(0,a?,a?) = 1/ep - ln_(a);
if (count(ep,1)>0) discard;
if (count(M,1)<-4) discard;
.sort
id q1.q1^a? = m^(2*a)*[1-2*x1]^a;
id l?!{q1,}.q1 = (l.q - l.k1);
.sort

.sort
*id F1 = -y/(2*x*z^3);
*id F2 = 0;
*id F3 = 0;
*id F4 = -1/(4*x*z^2);
.sort
#call scalarProd(x1)
.sort
B ep;
print +s;
.sort
Drop;
L MEtot = MEsoft + MEhard;

B ep;
print +s;
.sort
*#call toFormFactors(MEtot, MagEtot);
L P1 = MEtot;
L P4 = MEtot;
if (expression(P1));
  id F1 = -y/2/x/z^3;
  id F2 = 0;
  id F3 = 0;
  id F4 = 01/4/x/z^2;
elseif (expression(P4));
  id F1 = -1/4/x/z^2;
  id F2 = 1/4/x^2/z;
  id F3 = -1/4/y^2/z;
  id F4 = -1/2/x/y/z;
endif;
#call scalarProd(x1)
.sort
#call reduceX1(4)
.sort
B ep;
print +s P1, P4;
.sort



.end


