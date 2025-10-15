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
endinexpression;
.sort
CF fNoL;

id FD(v1?,m?) = fNoL(v1-l,m);

#call createFD0(l)
#call scalarProdNoX
B F1,F2,F3,F4;
print +s;
ModuleOption local $vec;
.sort

#call onePointNew(l,[l^2])
#call scalarProdNoX
.sort


S ep;
#call pochtablenew
.sort
#call smallpo
id D = 4-2*ep;
*id 1/D4 = 1/24 + 5*ep/144 + 19*ep^2/864;
id [D-4] = -2*ep;
id acc(a?) = a;

if (expression(MEsoft));
  if (count(M,1)<-6) discard;
elseif (expression(MEhard));
  if (count(M,1)<-4) discard;
endif;


if (count(ep,1)>1) discard;
B A0, F1,F2,F3,F4;
print +s;

.end


