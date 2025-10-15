#procedure toFormFactors(M,mag)
* input expression: M
* output expression: mag
* do not use any numbered indices especially 0, see https://github.com/form-dev/form/issues/445 
.sort
T T1, T2, T3, T4;
S F1, F2, F3, F4;

L `mag'= 
#do i= 1,4
 + T`i'(mu1,mu2,mu3)*F`i' * `M'(mu1,mu2,mu3)
#enddo
;
.sort

id T1(mu1?,mu2?,mu3?) = (k1(mu3)-k2(mu3) * k1.k3/k2.k3)* (k1(mu2)*k2(mu1)-d_(mu1,mu2)*k1.k2);

id T2(mu1?,mu2?,mu3?) = (k1(mu2)-k3(mu2) * k1.k2/k3.k2)* (k1(mu3)*k3(mu1)-d_(mu1,mu3)*k1.k3);

id T3(mu1?,mu2?,mu3?) = (k2(mu1)-k3(mu1) * k2.k1/k3.k1)* (k2(mu3)*k3(mu2)-d_(mu2,mu3)*k2.k3);

id T4(mu1?,mu2?,mu3?) = k2(mu3)*(k1(mu2)*k3(mu1)-d_(mu1,mu2) *k1.k3)
                       -k1(mu3)*(k3(mu2)*k2(mu1)-d_(mu1,mu2) *k2.k3)
            -d_(mu1,mu3)*k1(mu2)*k2.k3 + d_(mu1,mu3) *k3(mu2) *k1.k2
            +d_(mu2,mu3) * k2(mu1)* k1.k3-d_(mu2,mu3)* k3(mu1)* k1.k2;

.sort
#endprocedure
