On shortstats;
NT gg;
S D;
Dimension D;
Unittrace D;
#define COUNTG5 "1"
I mu1,...,mu10,five,m1,alpha;
V v1,...,v10;
********************************************************************************
* test 1:
*tr(gamma5) = 0
********************************************************************************
L F1 = gg(m1,five,mu1,mu2,mu3)*gg(m1,mu4,five); 
#call trace5D
print +s;
.sort
Drop F1;
.sort
********************************************************************************
* test 2:
*tr(ga_mu * gamma5) = 0
********************************************************************************
L F2 = gg(m1,mu1)*gg(m1,five);
#call trace5D
print +s;
.sort
Drop F2;
.sort
********************************************************************************
* test 3:
*tr(ga_mu1*ga_mu2*ga_mu3*ga_mu4* gamma5) = D*e_(mu1,mu2,mu3,mu4)
********************************************************************************
L F2 = gg(m1,mu1)*gg(m1,mu2)*gg(m1,mu3)*gg(m1,mu4)*gg(m1,five);
#call trace5D
print +s;
.sort
Drop F2;
.sort
*******************************************************************************
* test 5:
*tr(ga_mu1*ga_mu2*ga_mu3*ga_mu4*ga_mu5*ga_mu6*gamma5) = 10 terms
********************************************************************************
L F2 = <gg(m1,mu1)>*...*<gg(m1,mu6)>*gg(m1,five);
#call trace5D
print +s;
.sort
Drop F2;
.sort
*******************************************************************************
* test 6:
*tr(ga_mu1*ga_mu2*ga_mu3*ga_mu4*ga_mu5*ga_mu6*gamma5) = 10 terms
********************************************************************************
#redefine COUNTG5 "2"
L F2 = gg(m1,mu1)*gg(m1,mu2)*gg(m1,mu3)*gg(m1,five)
      *gg(m1,mu4)*gg(m1,mu5)*gg(m1,mu6)*gg(m1,five);
#call trace5D
contract;
B D;
print +s;
.sort
Drop F2;
.sort
*******************************************************************************
* test 7:
*tr(ga_mu1*ga_mu2*ga_mu3*ga_mu4*ga_mu5*ga_mu6*gamma5) = 10 terms
********************************************************************************
#redefine COUNTG5 "3"
L F2 = gg(m1,mu1)*gg(m1,mu2)*gg(m1,five)*gg(m1,mu3)*gg(m1,mu4)*gg(m1,five)*gg(m1,mu5)*gg(m1,mu6)*gg(m1,five);

#call trace5D
B D;
print +s;
.sort
Drop F2;
.sort
*******************************************************************************
* test 8:
*tr(ga_mu1*ga_mu2*ga_mu3*ga_mu4*ga_mu5*ga_mu6*gamma5) = 10 terms
********************************************************************************
L F2 = gg(m1,mu1)*gg(m1,mu2,mu3,mu4)*gg(m1,five)*gg(m1,mu3)*gg(m1,mu4,mu6,mu9,mu10)*gg(m1,five)*gg(m1,mu5)*gg(m1,mu6)*gg(m1,five);

#call trace5D
B D;
print +s;
.sort
Drop F2;
.end


