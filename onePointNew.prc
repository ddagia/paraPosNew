#procedure onePointNew(p,psq)
* one point tensor reduction
* loop momentum: p, psq = p.p
* can handle arbitrary positive and negative powers of psq, and upto 10 dot products in p.
* use notation fNoL(v,m) = 1/((p+v)^2-m) with p being the loop momentum 
* does nothing if fNoL(0,m) doesn't exist. call createFD0(p) first

.sort
S `psq', a, D2;
CF sym;
V v1, `p';
CF FD, A0, fNoL;
I <j1=0>,...,<j10=0>;

if (count(fNoL,1) >1) goto notallowed;
if (count(FD,1)>0) goto notallowed;
if (match(fNoL(0,m?))==0) goto notallowed;

if (count(`p',1)!= multipleof(2)) discard;


id `p'.`p'^a? = `psq'^a;

#do i=1,10
  id once `p'.v1? = `p'(j`i')*v1(j`i');
#enddo
#do i=10,2,-2
  id <`p'(j1)>*...*<`p'(j`i')> = `psq'^(`i'/2)*dd_(j1,...,j`i') * sym(`i');
#enddo

id `psq'^a? *fNoL(0,m?) = m^(2*a) * A0(m^2);

*sym(a) = 1/2^(a/2) * Gamma(D/2)/Gamma(D/2+a/2) = 1/2^(a/2) *Gamma(2-ep)/Gamma(2-ep+a/2) = 1/2^(a/2) * po(2,-1)*poinv(2+a/2,-1)
id sym(a?) = 1/2^(a/2) * po(2,-1)*poinv(2+a/2,-1);


Label notallowed;
ModuleOption local $vec;
.sort
sum j1,...,j10;
