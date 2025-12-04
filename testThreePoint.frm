V l,v1,v2,k1,k2,k3,p1;
S [l^2],m,ep,a,z;
CF FD,fNoL,acc;

#call pochtablenew
.sort
L f1 = fNoL(k1,m)*fNoL(0,m)*fNoL(k2,m)*l.l^2;

#call threePoint(l,[l^2],{k1\,k2\,k3})
.sort
#call createFD0(l)
.sort
#call twoPoint(l,[l^2],{k1\,k2\,k3})
.sort
#call createFD0(l)
.sort
#call onePoint(l,[l^2])
.sort
#call smallpo
id acc(a?) = a;
id ep = 0;
id k1.k1=0;
id k2.k2 = 0;
id k3.k3=0;
id k1.k2 = z;
argument;
  id k1.k1=0;
  id k2.k2 = 0;
  id k1.k2 = z;
  id k3.k3=0;
endargument;
B B0i,C0i,B0,C0,A0;
print;
.end
