#include propAndTrace.frm
*B F1,F2,F3,F4;
.sort
drop;
ndrop M`diag'soft, M`diag'hard;
L M`diag'soft = mag`diag';
L M`diag'hard = mag`diag';
.sort
S z1, zi;

repeat;
  id FD(v1?,m?) = fNoL(v1-l,m);
endrepeat;
.sort

inexpression M`diag'soft;
  #call newExpand(fNoL(0\,M) ,-1/M^2 , l.l)
  #call newExpand(fNoL(0\,M*rtxi), -1/xi/M^2,l.l )
  if (count(M,1)<-8) discard;
endinexpression;

inexpression M`diag'hard;
  #call newExpand(fNoL(q-k1\,m),1/[l^2],(2*l.q - 2*l.k1 - 2*q.k1))
  #call newExpand(fNoL(q\,m), 1/[l^2], (2*l.q))
  #do i = 1,3
    #call newExpand(fNoL(q`i'\,m), 1/[l^2], (2*l.q`i'+q`i'.q`i'-m^2))
  #enddo
  if (count(M,1,l,1,[l^2],2)<-8) discard;
endinexpression;
.sort



#call createFD0(l)
#call scalarProdNoX
ModuleOption local $vec;
.sort
#if (`diag'=="D")
*   id q2 = q-k1; alternatively, q2 = q3-k1;
*   id q3 = q;
  id q2 = q3-k1;
  id q3 = q;
  argument;
    id q2 = q3-k1;
    id q3 = q;
  endargument;
#elseif (`diag'== "C")
*   id q2 = q-k1-k2; q2 = k3-q alternatively q2 = q3-k2;
*   id q3 = q-k1;
  id q2 = q3-k2;
  argument; 
    id q2 = q3-k2;
  endargument;
#endif
.sort

#call twoPoint(l,[l^2],{k1\,k2\,k3})
#call scalarProdNoX
.sort
#call createFD0(l)
#call scalarProdNoX
ModuleOption local $vec;
.sort
#call onePoint(l,[l^2])
#call scalarProdNoX
.sort

#if (`diag'== "E")
  id q1.q1^a? = m^(2*a)*[1-2*x1]^a;
  id v1?!{q1,}.q1 = (v1.q - v1.k1);
  argument fNoL;
    id q1 = q-k1;
  endargument;
#elseif (`diag'== "C")
  id q3.q3^a? = m^(2*a)*[1-2*x1]^a;
  id v1?!{q3,}.q3 = (v1.q - v1.k1);
  argument fNoL;
    id q3 = q-k1;
  endargument;
#endif;
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


if (count(ep,1)>1) discard;
*B A0, F1,F2,F3,F4;
*print +s;
.sort
id A0(a?) = a/ep - a*(1-ln_(a));
id B0(0,a?,a?) = 1/ep - ln_(a);
*id B0(0,a?,a?) = 1/ep - ln_(a);
if (count(ep,1)>0) discard;
if (count(M,1)<-4) discard;
.sort
.sort

.sort
*id F1 = -y/(2*x*z^3);
*id F2 = 0;
*id F3 = 0;
*id F4 = -1/(4*x*z^2);
.sort
#call scalarProd(x1)
.sort
#call reduceX1(4)
.sort
B ep;
print +s;
.sort
Drop;
L M`diag'tot = M`diag'soft + M`diag'hard;

B ep;
print +s;
.sort
*#call toFormFactors(MEtot, MagEtot);
.end
L P1 = M`diag'tot;
L P4 = M`diag'tot;
if (expression(P1));
  id F1 = -y/2/x/z^3;
  id F2 = 0;
  id F3 = 0;
  id F4 = 01/4/x/z^2;
elseif (expression(P4));
  id F1 = -1/4/x/z^2;
  id F2 = 1/4/x^2/z;
  id F3 = -1/4/y^2/z;
  id F4 = -1/2/x/y/z;
endif;
#call scalarProd(x1)
.sort
#call reduceX1(4)
.sort
B ep;
print +s P1, P4;
.sort



.end


