#procedure threePoint(p,psq,ki)
* P: Loop momentum
* psq: Loop momentum squared, must be defined as a symbol
* ki: external zero momenta, must be inputted as a set.{k1\,k2\,k3}
* implicitly multiplying prefactor of 1/i_/pi(D/2)*Ga(1-2ep)/Ga(1+ep)/Ga(1-ep)^2 for all PaVe.
  .sort
S `psq', a,b D2,[xx],[yy],m;
CF sym;
V v1,v2;
CF B0,fNoL,Cinternal, po, poinv, C0i,C0;
T Cnum;
I <j1=0>,...,<j10=0>;
Autodeclare Symbol cc;
if (count(FD,1)>0) goto notallowed;
if (count(fNoL,1)>3) goto notallowed;

id fNoL(v1?,m?)*fNoL(v2?,m?)*fNoL(0,m?) = Cinternal(v1,v2,m,m);
id fNoL(0,m?)*fNoL(v1?,m?)*fNoL(0,m?) = Cinternal(0,v1,m,m);
id fNoL(0,m?)*fNoL(0,m?)*fNoL(0,m?) = Cinternal(0,0,m,m);

id `p'.`p'^a? = `psq'^a;

ToTensor, nosquare, `p', Cnum;
La notallowed;
.sort
repeat;
  id `psq'*Cinternal(v1?,v2?,m?,m?) = fNoL(v1,m)*fNoL(v2,m) + m^2*Cinternal(v1,v2,m,m);

  id Cnum(?a,v1?vector_,?b)*Cinternal(v1?vector_,v2?,m,m) = 1/2*Cnum(?a,?b)*(fNoL(0,m)*fNoL(v2,m) - fNoL(v1,m)*fNoL(v2,m) - v1.v1*Cinternal(v1,v2,m,m));
  id Cnum(?a,v2?vector_,?b)*Cinternal(v1?,v2?vector_,m,m) = 1/2*Cnum(?a,?b)*(fNoL(0,m)*fNoL(v1,m) - fNoL(v1,m)*fNoL(v2,m) - v2.v2*Cinternal(v1,v2,m,m));

  id Cnum(?a,v1?vector_,?b)*Cinternal(-v1?vector_,v2?,m,m) = -1/2*Cnum(?a,?b)*(fNoL(0,m)*fNoL(v2,m) - fNoL(v1,m)*fNoL(v2,m) - v1.v1*Cinternal(v1,v2,m,m));
  id Cnum(?a,v2?vector_,?b)*Cinternal(v1?,-v2?vector_,m,m) = -1/2*Cnum(?a,?b)*(fNoL(0,m)*fNoL(v1,m) - fNoL(v1,m)*fNoL(v2,m) - v2.v2*Cinternal(v1,v2,m,m));

  id Cnum(?a,v1?vector_,?b)*Cinternal(0,v1?vector_,m,m) = 1/2*Cnum(?a,?b)*(fNoL(0,m)*fNoL(0,m) - fNoL(v1,m)*fNoL(0,m) - v1.v1*Cinternal(0,v1,m,m));
  id Cnum(?a,v1?vector_,?b)*Cinternal(0,-v1?vector_,m,m) = -1/2*Cnum(?a,?b)*(fNoL(0,m)*fNoL(0,m) - fNoL(v1,m)*fNoL(0,m) - v1.v1*Cinternal(0,v1,m,m));
endrepeat;
.sort
Tovector, Cnum, `p';
.sort

id `psq'^a? = `p'.`p'^a;
print +s;
.sort

*#if (`ki' != none)
*  if (match(Cinternal(v1?`ki'$vec1,v2?`ki'$vec2,m?,m?)));
*   multiply replace_(`p',`p'-$vec1*[xx]-$vec2*[yy]);
*   id Cinternal($vec1,$vec2,m,m) = Cinternal(0,0,m,m);
*
*  elseif (match(Cinternal(-v1?`ki'$vec1,v2?`ki'$vec2,m?,m?)));
*   multiply replace_(`p',`p'+$vec1*[xx]-$vec2*[yy]);
*   id Cinternal(-$vec1,$vec2,m,m) = Cinternal(0,0,m,m);
*
*  elseif (match(Cinternal(v1?`ki'$vec1,-v2?`ki'$vec2,m?,m?)));
*   multiply replace_(`p',`p'-$vec1*[xx]+$vec2*[yy]);
*   id Cinternal($vec1,-$vec2,m,m) = Cinternal(0,0,m,m);
*
*  elseif (match(Cinternal(-v1?`ki'$vec1,-v2?`ki'$vec2,m?,m?)));
*   multiply replace_(`p',`p'+$vec1*[xx]+$vec2*[yy]);
*   id Cinternal(-$vec1,-$vec2,m,m) = Cinternal(0,0,m,m);
*
*  endif;
*#endif

.sort
if (count(Cinternal,1)==1);
id `p'.`p'^a? = `psq'^a;
#do i = 1,10
  once `p'.v1? = `p'(j`i')*v1(j`i');
#enddo
endif;

ModuleOption local $vec1, $vec2;
.sort
id [xx]^a?pos_ = 1/(a+1);
id [yy]^a?pos_ = 1/(a+1);

if (match(Cinternal(0,0,m?,m?)));
  #call average(`p',`psq') 
  repeat id `psq'*Cinternal(0,0,m?,m?) = fNoL(0,m)*fNoL(0,m) + m^2*Cinternal(0,0,m,m);
endif;
.sort

T Cnum, v1prod, v2prod,v0prod;
V v1internal,v2internal;
if (count(Cinternal,1)==1)
  ToTensor, nosquare, `p', Cnum;
.sort
#define cargs "v1.v1,v2.v2,v1.v1+2*v1.v2+v2.v2,m^2,m^2,m^2"
if (match(Cinternal(v1?$vec1,v2?$vec2,m?,m?)));
  id Cnum(j1)*Cinternal(v1?,v2?,m?,m?) = C0i(cc1,`cargs')*v1(j1)*C0i(cc2,`cargs')*v2(j2);

  id Cnum(j1,...,j2)*Cinternal(v1?,v2?,m?,m?) = C0i(cc22,`cargs')*v2(j1)*v2(j2)
                                              + C0i(cc12,`cargs')*distrib_(1,1,v1prod,v2prod,j1,j2)
                                              + C0i(cc11,`cargs')*v1(j1)*v2(j1)
                                              + C0i(cc00,`cargs')*d_(j1,j2);

  id Cnum(j1,...,j3)*Cinternal(v1?,v2?,m?,m?) = C0i(cc222,`cargs')*distrib_(1,0,v0prod,v2prod,j1,...,j3)
                                              + C0i(cc122,`cargs')*distrib_(1,1,v1prod,v2prod,j1,...,j3)
                                              + C0i(cc112,`cargs')*distrib_(1,2,v1prod,v2prod,j1,...,j3)
                                              + C0i(cc111,`cargs')*distrib_(1,3,v1prod,v2prod,j1,...,j3)
                                              + C0i(cc002,`cargs')*distrib_(1,2,v0prod,v2prod,j1,...,j3)
                                              + C0i(cc001,`cargs')*distrib_(1,2,v0prod,v1prod,j1,...,j3);

  id Cnum(j1,...,j4)*Cinternal(v1?,v2?,m?,m?) = C0i(cc2222,`cargs')*distrib_(1,0,v0prod,v2prod,j1,...,j4)
                                              + C0i(cc1222,`cargs')*distrib_(1,1,v1prod,v2prod,j1,...,j4)
                                              + C0i(cc1122,`cargs')*distrib_(1,2,v1prod,v2prod,j1,...,j4)
                                              + C0i(cc1112,`cargs')*distrib_(1,3,v1prod,v2prod,j1,...,j4)
                                              + C0i(cc1112,`cargs')*distrib_(1,4,v1prod,v2prod,j1,...,j4)
                                              + C0i(cc0022,`cargs')*distrib_(1,2,v0prod,v2prod,j1,...,j4)
                                              + C0i(cc0011,`cargs')*distrib_(1,2,v0prod,v1prod,j1,...,j4)
                                              + C0i(cc0000,`cargs')*distrib_(1,4,v0prod,v1prod,j1,...,j4);
  ToVector v1prod,v1internal;
  ToVector v2prod,v2internal;
  multiply replace_(v1internal,$vec1,v2internal,$vec2);
  id v0prod(?a) = dd_(?a);
endif;
ModuleOption local, $vec1, $vec2;
#undefine cargs
.sort


sum j1,...,j10;
.sort
if (count(`p',1)==0);
  id Cinternal(v1?,v2?,m?,m?) = C0(v1.v1,v2.v2,v1.v1+2*v1.v2+v2.v2,m^2,m^2,m^2);
  id Cinternal(0,v2?,m?,m?) = C0(0,v2.v2,v2.v2,m^2,m^2,m^2);
  id Cinternal(0,0,m?,m?) = C0(0,0,0,m^2,m^2,m^2);
endif;
.sort
#endprocedure
