#procedure twoPoint(p,psq)
* P: Loop momentum
* psq: Loop momentum squared, must be defined as a symbol
* implicitly multiplying prefactor of 1/i_/pi(D/2)*Ga(1-2ep)/Ga(1+ep)/Ga(1-ep)^2 for all PaVe.
  .sort
S `psq', a, D2;
CF sym;
V v1;
CF B0,fNoL;
I <j1=0>,...,<j10=0>;

if (count(FD,1)>0) goto notallowed;
if (count(fNoL,1)>0) goto notallowed;

id fNoL(v1?,m?)*fNoL(0,m?) = fNoL(v1,m,m);

id `p'.`p'^a? = `psq'^a;

repeat;
  id `psq'^a?*fNoL(v1?,m?,m?) = fNoL(v1,m) + m^2*fNoL(v1,m,m);
  id `p'.v1?*fNoL(v1?,m?,m?) = 1/2*fNoL(l,m) - 1/2*fNoL(l+v1,m) + 1/2*v1.v1*fNoL(v1,m,m);
  id `p'.v1?*fNoL(-v1?,m?,m?) = -1/2*fNoL(l,m) + 1/2*fNoL(l-v1,m) - 1/2*v1.v1*fNoL(-v1,m,m);
endrepeat;

#do i=1,10
  id once `p'.v1? = `p'(j`i')*v1(j`i');
#enddo

if (match(fNoL(v1?{k1,k2,k3},m,m));

endif;



Label notallowed;
.sort
  
#endprocedure
