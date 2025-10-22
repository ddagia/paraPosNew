#procedure onePoint(P,psq)
* P: Loop momentum
* psq: Loop momentum squared, must be defined as a symbol
* implicitly multiplying prefactor of 1/i_/pi(D/2)*Ga(1-2ep)/Ga(1+ep)/Ga(1-ep)^2 for all PaVe.
.sort
S `psq', a, D2;
CF sym;
V v1;
CF A0,fNoL;
I <j1=0>,...,<j10=0>;

if (count(FD,1)>1) goto notallowed;

if (count(l,1)!= multipleof(2)) discard;

id `P'.`P'^a? = `psq'^a;
#do i=1,10
  id once `P'.v1? = `P'(j`i')*v1(j`i');
#enddo

#do i=10,2,-2
  id <`P'(j1)>*...*<`P'(j`i')> = `psq'^(`i'/2)*dd_(j1,...,j`i') * sym(`i');
#enddo

id `psq'^a? *FD(`P',m?) = m^(2*a) * A0(m^2);

*sym(a) = 1/2^(a/2) * Gamma(D/2)/Gamma(D/2+a/2) = 1/2^(a/2) *Gamma(2-ep)/Gamma(2-ep+a/2) = 1/2^(a/2) * po(2,-1)*poinv(2+a/2,-1)
id sym(a?) = 1/2^(a/2) * po(2,-1)*poinv(2+a/2,-1);

Label notallowed;
.sort
sum j1,...,j10;


.sort
#endprocedure
