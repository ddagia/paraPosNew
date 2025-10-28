#procedure definePropVertex

*taking out 1/[sqrt2]*e^5/(4swcw)^2
id PsiP = 1/2/m * (m*gi_(1) + g_(1, q))*g_(1, 5_);

id EZ(m1?,alpha?) = i_ * (vec * g_(m1, alpha) - ax * g_(m1, alpha)* g_(m1,5_));

id Eprop(m1?,l?) = i_ * (g_(m1,l) + m*gi_(m1))*FD(l,m);
id EpropNew(m1?,l?) = i_ *
            (SigmaVren*g_(m1,l) 
            -SigmaAren*g_(m1,l,5_) 
            +SigmaSren*m*gi_(m1));

id Zprop(l?,alpha?,beta?) = -i_ * d_(alpha,beta)*FD(l,M)
    +i_* l(alpha)*l(beta)/M^2 * (FD(l,M) - FD(l,rtxi*M))
    ;

id EPH(m1?,mu1?) = i_ * g_(m1,mu1);

  
#endprocedure
*id PsiP = 1/2/m * (m*gg(m1) + gg(m1, j301)*q(j301))*gg(m1, five);
*
*id EZ(alpha?) = i_ * vec * gg(m1, alpha) - i_ * ax * gg(m1, alpha)* gg(m1,five);
*#do i = 1,`MAXGAM'
*  if (count(Eprop,1))
*    id once Eprop(l?) = i_ * (gg(m1,j`i')*l(j`i') + m*gg(m1))*FD(l,m);
*#enddo
*
*id Zprop(alpha?,beta?) = -i_ *( d_(alpha,beta)*FD(l,M) 
*    - l(alpha)*l(beta)/M^2 * (FD(l,M) - FD(l,rtxi*M)) ) ;
*
*id EPH(mu1?) = i_ * gg(m1,mu1);
*B gg;
*Collect coeff1
*.sort
*#call trace5D
* id coeff1(a?) = a;
* sum j1,...,j`MAXGAM', j301, alpha, beta;
