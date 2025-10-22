#procedure smallpo
  id po(a?,b?)*poinv(a?,b?) = 1;
  id po(1,a?) = 1;
  id poinv(1,a?) = 1;

  id po(a?pos_,0) = fac_(a-1);
  id poinv(a?pos_,0) = invfac_(a-1);

  id po(a?neg0_,b?) = acc(PO(a,b)/b/ep);
  id poinv(a?neg0_,b?) = acc(POINV(a,b)*b*ep);
  
  id many po(a?,b?) = acc(PO(a,b));
  id many poinv(a?,b?) = acc(POINV(a,b));
  
#endprocedure
