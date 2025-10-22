Off statistics;
S m,D,[xx];
Dimension D;
CF FD,fNoL, po, poinv, acc, ep;
V l,k1,q,k2,v1,v2,k3,v0;
I i1,i2,i3;
S [l^2];

Vector p1,p2;
#call pochtablenew

Local test = l.q*l.q* l.l*fNoL(0,m)*fNoL(k1,m);
.sort

#call twoPoint(l, [l^2], {k1\, k2\, k3})
.sort
#call createFD0(l)
print +s;
.sort
#call onePoint(l, [l^2])
.sort
#call smallpo
id acc(a?) = a;
if (count(ep,1)>0) discard;
id k1.k1 = 0;
Print;
.sort
Drop;
.sort
L test = l.q^2*fNoL(k1,m);
#call createFD0(l)




print +s;
.end
