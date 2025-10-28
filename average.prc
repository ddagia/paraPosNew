#procedure average(p,psq)

if (count(`p',1)!= multipleof(2)) discard;

id `p'.`p'^a? = `psq'^a;

#do i=1,10
  id once `p'.v1? = `p'(j`i')*v1(j`i');
#enddo
#do i=10,2,-2
  id <`p'(j1)>*...*<`p'(j`i')> = `psq'^(`i'/2)*dd_(j1,...,j`i') * sym(`i');
#enddo

id sym(a?) = 1/2^(a/2) * po(2,-1)*poinv(2+a/2,-1);
*sym(a) = 1/2^(a/2) * Gamma(D/2)/Gamma(D/2+a/2) = 1/2^(a/2) *Gamma(2-ep)/Gamma(2-ep+a/2) = 1/2^(a/2) * po(2,-1)*poinv(2+a/2,-1)

#endprocedure
