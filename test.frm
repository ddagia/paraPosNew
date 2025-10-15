Off statistics;
S D,[xx],m;
CF FD,fNoL;
Dimension D;
V l,k1,q,k2,v1,v2,k3,v0;
I i1,i2,i3;

L F1 = l(i1)*l(i2);

multiply replace_(l,l+[xx]*k1);
print +s;
.sort
id [xx]^D? =  1/(D+1);

#call createFD0(l)




print +s;
.end
