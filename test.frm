Off statistics;
S D,[xx],m;
Dimension D;
CF FD,fNoL, po, poinv, acc, ep,sym;
V l,k1,q,k2,v1,v2,v3,k3,v0;
I i1,i2,i3, <j1=0>,...,<j10=0>;
S [l^2],a,b;

Vector p1,p2;
#call pochtablenew

Local test = fNoL(k2,m)*l.q^2*l.l;
.sort
#call createFD0(l)
print +s;
.sort
#call onePoint(l,[l^2])
.sort
id k1.k1 = 0;
#call smallpo
id acc(a?) = a;
if (count(ep,1)>0) discard;
sum j1,...,j10;
B [l^2];
Print;
.sort
.end
