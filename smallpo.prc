#procedure smallpo
  id po(a?,b?)*poinv(a?,b?) = 1;
  id po(1,a?) = 1;
  id poinv(1,a?) = 1;

  id po(a?pos_,0) = fac_(a-1);
  id poinv(a?pos_,0) = invfac_(a-1);

  id po(x1?neg0_,x2?) = acc(PO(x1,x2)/x2/ep);
  id poinv(x1?neg0_,x2?) = acc(POINV(x1,x2)*x2*ep);
  
  id many po(x1?,x2?) = acc(PO(x1,x2));
  id many poinv(x1?,x2?) = acc(POINV(x1,x2));
  
#endprocedure
