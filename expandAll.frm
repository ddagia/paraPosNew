#include propAndTrace.frm
B F1,F2,F3,F4;
print +s;
.sort
Drop magE;
L MEsoft = magE;
L MEhard = magE;
.sort
S z1, zi;

inexpression MEsoft;
  #call newExpand(FD(l\,M) ,-1/M^2 , l.l)
  #call newExpand(FD(l\,rtxi*M), -1/xi/M^2,l.l )
endinexpression;


inexpression MEhard;
  #call newExpand(FD(l+q-k1\,m),1/[l^2],(2*l.q - 2*l.k1 - 2*q.k1))
  #call newExpand(FD(l+q+k2\,m),1/[l^2],(2*l.q + 2*l.k2 + 2*q.k2))
  #call newExpand(FD(l+q\,m), 1/[l^2], (2*l.q))
endinexpression;
.sort
CF fNoL;

id FD(v1?,m?) = fNoL(v1-l,m);

#call createFD0(l)
#call scalarProdNoX
*8B F1,F2,F3,F4;
*8print +s;
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

if (expression(MEsoft));
  if (count(M,1)<-4) discard;
elseif (expression(MEhard));
  if (count(M,1)<-6) discard;
endif;


if (count(ep,1)>1) discard;
*B A0, F1,F2,F3,F4;
*print +s;
.sort
id A0(a?) = a/ep - a*(1-ln_(a));
if (count(ep,1)>0) discard;
.sort
Drop;
ndrop MEtot;
L MEtot = MEhard + MEsoft;
.sort

.sort
id F1 = -y/(2*x*z^3);
id F2 = 0;
id F3 = 0;
id F4 = -1/(4*x*z^2);
.sort
#call scalarProd(x1)
.sort
#call reduceX1(4)

B ep;
print +s;

.end
if (match(1/[1-x2]) && (match(1/[1-x3]))) id x1 = [1-x2] + [1-x3];

if (match(1/[1-x1]) && match(1/[1-x2])) id x3 = [1-x1] + [1-x2];

if ((match(1/[1-x1])) && match(1/[1-x3])) id x2 = [1-x1] + [1-x3];

id [1-x1] = 1 - x1;
id [1-x2] = 1 - x2;
id [1-x3] = 1 - x3;
.sort
if (match(1/[1-x1]));
  id x1 = -[1-x1] + 1;
endif;
if (match(1/[1-x2]));
  id x2 = -[1-x2] + 1;
endif;
if (match(1/[1-x3]));
  id x3 = -[1-x3] + 1;
endif;
.sort
id [1-x1] = 1 - x1;
id [1-x2] = 1 - x2;
id [1-x3] = 1 - x3;
.sort


