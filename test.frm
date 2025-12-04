#-
I mu1,mu2;
Vector l,k1,k2,p1,p2;

Local expr = e_(p1,p2,mu1,mu2)*e_(p1,p2,mu1,mu2)*invfac_(4-2);
id p1 = -k1;
id p2 = -k1-k2;
contract ;
id k1.k1 = 0;
id k2.k2 = 0;
print +s;
.end
