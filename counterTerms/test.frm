Autodeclare S cc;
CF f,f1,f2;
T dot, vprod;
V v1;
Autodeclare Index i;
L F = f(i1,...,i5);

id f(?a) = 
  + distrib_(0,2,dd_,vprod,?a)
;
#do i=1,11,2
id dd_(i1?,...,i`i'?) = 0;
#enddo
tovector vprod v1;
print ;
.end
