#procedure calcDerivative(p)
* NF del, FD, deriv;

id `p'.`p'^a? = deriv(`p'.`p'^a);

id  l?!{`p',}.`p'^b? = deriv(l.`p'^b);

Multiply left del(`p'.`p');


repeat;
  id del(`p'.`p')*FD(l,M?) =  FD(l,M)*del(`p'.`p');
  id del(`p'.`p')*FD(l+`p',m?) = FD(l+`p',m)^2*(2*l.`p'/`p'.`p' + 1) 
                                       + FD(l+`p',m)*del(`p'.`p');
  id del(`p'.`p')*deriv(`p'.`p'^a?) = a*`p'.`p'^(a-1) 
                                       + `p'.`p'^a*del(`p'.`p');
  id del(`p'.`p')*deriv(l.`p'^a?) = a/2*l.`p'^a/`p'.`p'
                                       + l.`p'^a*del(`p'.`p');
endrepeat;
id del(`p'.`p') = 0;
id deriv(a?) = a;

#endprocedure
