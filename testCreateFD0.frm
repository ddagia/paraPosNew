Off statistics;
S D,x,m,[l^2];
CF FD,fNoL;
Dimension D;
V l,k1,q,k2,v1,v2,k3;

L F1 = FD(l+q,m)*FD(l+q+k1,m)*FD(l,m);
L F2 = FD(l+q+k1,m)*FD(l+q+k1+k2,m)*FD(l+q+k1+k2+k3,m)*FD(l+q,m);
L F3 = FD(l+q+k1+k2,m)*FD(l+q+k1+k2,m)*FD(l+q+k1+k2+k3,m)*FD(l+q,m);
L F4 = l.k1*l.k2*l.l*FD(l+q,m);

id FD(v1?,m) = fNoL(v1-l,m);
print +s;
.sort

#call createFD0(l)





print +s;
.end
