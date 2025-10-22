#procedure twoPoint(p,psq,ki)
* P: Loop momentum
* psq: Loop momentum squared, must be defined as a symbol
* ki: external zero momenta, must be inputted as a set.{k1\,k2\,k3}
* implicitly multiplying prefactor of 1/i_/pi(D/2)*Ga(1-2ep)/Ga(1+ep)/Ga(1-ep)^2 for all PaVe.
  .sort
S `psq', a,b D2,[xx];
CF sym;
V v1;
CF B0,fNoL,Binternal, po, poinv;
I <j1=0>,...,<j10=0>;
if (count(FD,1)>0) goto notallowed;
if (count(fNoL,1)>2) goto notallowed;

id fNoL(v1?,m?)*fNoL(0,m?) = Binternal(v1,m,m);

id `p'.`p'^a? = `psq'^a;

repeat;
  id `psq'*Binternal(v1?,m?,m?) = fNoL(v1,m) + m^2*Binternal(v1,m,m);
  id `p'.v1?*Binternal(v1?,m?,m?) = 1/2*fNoL(0,m) - 1/2*fNoL(v1,m) - 1/2*v1.v1*Binternal(v1,m,m);
  id `p'.v1?*Binternal(-v1?,m?,m?) = -1/2*fNoL(0,m) + 1/2*fNoL(-v1,m) + 1/2*v1.v1*Binternal(-v1,m,m);
endrepeat;
  id `psq'^a? = `p'.`p'^a;
if (count(Binternal,1)=1);
  #do i=1,10
    id once `p'.v1? = `p'(j`i')*v1(j`i');
  #enddo
endif;

#if (`ki'!=none)
  if (match(Binternal(v1?`ki'$vec,m,m)));
    multiply replace_(`p', `p'-$vec*[xx]);
    id Binternal($vec,m,m) = Binternal(0,m,m);
  elseif (match(Binternal(-v1?`ki'$vec,m,m)));
    multiply replace_(`p', `p'+$vec*[xx]);
    id Binternal(-$vec,m,m) = Binternal(0,m,m);
  endif;
#endif

Label notallowed;
ModuleOption local $vec;
print +s;
.sort
id [xx]^a?pos_ = 1/(a+1);

if (match(Binternal(0,m,m)));
  #call average(`p',`psq')
  repeat id once `psq'*Binternal(0,m?,m?) = fNoL(0,m) + m^2*Binternal(0,m,m);
endif;
print +s;

if (count(l,1)==0)
  id Binternal(0,m,m) = B0(0,m,m);

  print +s;
.sort
sum j1,...,j10;
print +s;
.sort




#endprocedure
