#procedure onePoint(p,psq)
* one point tensor reduction
* loop momentum: p, psq = p.p
* can handle arbitrary positive and negative powers of psq, and upto 10 dot products in p.
* use notation fNoL(v,m) = 1/((p+v)^2-m) with p being the loop momentum 
* does nothing if fNoL(0,m) doesn't exist. call createFD0(p) first

.sort
S `psq', a, D2;
CF sym;
V v1, `p';
CF FD, A0, fNoL, Ainternal;
I <j1=0>,...,<j10=0>;

if (count(fNoL,1) >1) goto notallowed;
if (count(FD,1)>0) goto notallowed;
if (match(fNoL(0,m?))==0) goto notallowed;

id fNoL(0,m?) = Ainternal(m);

#call average(`p',`psq')
Label notallowed;
ModuleOption local $vec;
.sort

id `psq'^a? *Ainternal(m?) = m^(2*a) * A0(m^2);

ModuleOption local $vec;
.sort
sum j1,...,j10;

#endprocedure
