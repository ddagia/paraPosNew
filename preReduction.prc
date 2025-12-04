#procedure preReduction
#if (`diag' == "B")
  #do i = 1,3;
    repeat id once fNoL(q-k`i',m)*l.k`i' = -1/2*(1 - fNoL(q-k`i',m)*(-l.l-2*l.q+2*k`i'.q));
  #enddo


  #do i = 1,3;
    repeat id once fNoL(k`i'-q,m)*l.k`i' = +1/2*(1 - fNoL(k`i'-q,m)*(-l.l-2*l.q+2*k`i'.q));
  #enddo

*  repeat id once fNoL(q,m)*l.q = 1/2*(1 - l.l*fNoL(q,m));
#endif

*  repeat id once l.l*fNoL(0,M) = 1 + M^2*fNoL(0,M);
*  repeat id once l.l*fNoL(0,rtxi*M) = 1 + xi*M^2*fNoL(0,rtxi*M);
*
*  if ((count(l,1)!=0) && ( (match(fNoL(v1?,m?))==0) && (match(fNoL(0,m?))==0))) discard;

#endprocedure
