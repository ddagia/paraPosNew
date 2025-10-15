#include propAndTrace.frm

#call newExpand(FD(l\,M) ,-1/M^2 , l.l)
#call newExpand(FD(l\,rtxi*M), -1/xi/M^2,l.l )
.sort

#call shiftMomentum(l,l-q+k1)
#call scalarProdNoX

.sort
#call onePoint(l,[l^2]);
#call scalarProdNoX
.sort
S ep;
#call pochtablenew
.sort
#call smallpo

id rtxi^a? = xi^(a/2);
.sort
id D = 4-2*ep;
id [D-4] = -2*ep;
id acc(a?) = a;

if (count(M,1)<-4) discard;
if (count(ep,1)>1) discard;
B A0, F1,F2,F3,F4;
print +s;
.end
:
