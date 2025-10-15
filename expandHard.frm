  #include propAndTrace.frm

  #call newExpand(FD(l+q-k1\,m),1/[l^2],(2*l.q - 2*l.k1 - 2*q.k1))

  .sort
  #call scalarProdNoX

  #call onePoint(l,[l^2]);
  #call scalarProdNoX

  id rtxi^a? = xi^(a/2);
  id 1/D2 = 1/D;
.sort
S ep;
#call pochtablenew
.sort
#call smallpo
id D = 4-2*ep;
id 1/D4 = 1/24 + 5*ep/144 + 19*ep^2/864;
id [D-4] = -2*ep;
id acc(a?) = a;

if (count(M,1)<-6) discard;
if (count(ep,1)>1) discard;
B A0, F1,F2,F3,F4;
print +s;

.end

