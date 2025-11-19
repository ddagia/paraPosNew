#procedure twoPoint(p,psq,ki)
* P: Loop momentum
* psq: Loop momentum squared, must be defined as a symbol
* ki: external zero momenta, must be inputted as a set.{k1\,k2\,k3}
* implicitly multiplying prefactor of 1/i_/pi(D/2)*Ga(1-2ep)/Ga(1+ep)/Ga(1-ep)^2 for all PaVe.
  .sort
S `psq', a,b D2,[xx];
CF sym;
V v1;
CF B0,fNoL,Binternal, po, poinv, B0i;
I <j1=0>,...,<j10=0>;
Autodeclare Symbol bb;
if (count(FD,1)>0) goto notallowed;
if (count(fNoL,1)>2) goto notallowed;

id fNoL(v1?,m?)*fNoL(0,m?) = Binternal(v1,m,m);
id fNoL(0,m?)*fNoL(0,m?) = Binternal(0,m,m);

id `p'.`p'^a? = `psq'^a;

La notallowed;
.sort

repeat;
  id `psq'*Binternal(v1?,m?,m?) = fNoL(v1,m) + m^2*Binternal(v1,m,m);
  id `psq'*Binternal(0,m?,m?) = fNoL(0,m) + m^2*Binternal(0,m,m);
  id `p'.v1?*Binternal(v1?vector_,m?,m?) = 1/2*fNoL(0,m) - 1/2*fNoL(v1,m) - 1/2*v1.v1*Binternal(v1,m,m);
  id `p'.v1?*Binternal(-v1?vector_,m?,m?) = -1/2*fNoL(0,m) + 1/2*fNoL(-v1,m) + 1/2*v1.v1*Binternal(-v1,m,m);
endrepeat;
.sort

id `psq'^a? = `p'.`p'^a;

#if (`ki'!=none)
  if (match(Binternal(v1?`ki'$vec,m,m)));
    multiply replace_(`p', `p'-$vec*[xx]);
    id Binternal($vec,m,m) = Binternal(0,m,m);
  elseif (match(Binternal(-v1?`ki'$vec,m,m)));
    multiply replace_(`p', `p'+$vec*[xx]);
    id Binternal(-$vec,m,m) = Binternal(0,m,m);
  endif;
#endif

ModuleOption local $vec;
.sort
if (count(Binternal,1)==1);
  #do i=1,10
    id once `p'.v1?!{`p',} = `p'(j`i')*v1(j`i');
  #enddo
endif;

.sort
id [xx]^a?pos_ = 1/(a+1);
if (match(Binternal(0,m?,m?)));
  #call average(`p',`psq')
  repeat id once `psq'*Binternal(0,m?,m?) = fNoL(0,m) + m^2*Binternal(0,m,m);
endif;
.sort
T numB, v1prod;
V vinternal;
#define bargs "v1.v1,m^2,m^2"

if (count(`p',1)==0) id Binternal(0,m?,m?) = B0(0,m^2,m^2);

if(count(Binternal,1)==1)
  ToTensor,nosquare, `p', numB;

.sort
if (match(Binternal(v1?$vec,m?,m?)));
  id numB(j1?)*Binternal(v1?,m?,m?) = B0i(bb1,`bargs')*v1(j1);

  id numB(j1?,j2?)*Binternal(v1?,m?,m?) = B0i(bb11,`bargs')*v1(j1)*v1(j2)
                                      + B0i(bb00,`bargs')*d_(j1,j2);

  id numB(j1?,...,j3?)*Binternal(v1?,m?,m?) = B0i(bb111,`bargs')*distrib_(1,0,dd_,v1prod,j1,...,j3) 
                                          + B0i(bb001,`bargs')*distrib_(1,2,dd_,v1prod,j1,...,j3);

  id numB(j1?,...,j4?)*Binternal(v1?,m?,m?) = B0i(bb1111,`bargs')*distrib_(1,0,dd_,v1prod,j1,...,j4)
                                          + B0i(bb0011,`bargs')*distrib_(1,2,dd_,v1prod,j1,...,j4)
                                          + B0i(bb0000,`bargs')*distrib_(1,4,dd_,v1prod,j1,...,j4);

  id numB(j1?,...,j5?)*Binternal(v1?,m?,m?) = B0i(bb11111,`bargs')*distrib_(1,0,dd_,v1prod,j1,...,j5)
                                          + B0i(bb00111,`bargs')*distrib_(1,2,dd_,v1prod,j1,...,j5)
                                          + B0i(bb00001,`bargs')*distrib_(1,4,dd_,v1prod,j1,...,j5);

  id numB(j1?,...,j6?)*Binternal(v1?,m?,m?) = B0i(bb111111,`bargs')*distrib_(1,0,dd_,v1prod,j1,...,j6)
                                          + B0i(bb001111,`bargs')*distrib_(1,2,dd_,v1prod,j1,...,j6)
                                          + B0i(bb000011,`bargs')*distrib_(1,4,dd_,v1prod,j1,...,j6)
                                          + B0i(bb000000,`bargs')*distrib_(1,6,dd_,v1prod,j1,...,j6);
  ToVector v1prod vinternal;
  multiply replace_(vinternal,$vec);
endif;

#undefine bargs
ModuleOption local $vec;
.sort
if (count(`p',1)==0) id Binternal(v1?,m?,m?) = B0(v1.v1,m^2,m^2);

.sort
sum j1,...,j10;
.sort




#endprocedure
