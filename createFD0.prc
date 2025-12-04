#procedure createFD0(p)
* loop momentum: p
* does not use id p = p+- $vec; see https://github.com/form-dev/form/issues/608  
* must be followed by .sort before doing any identifications involving the loop momentum or its dot prods
* (replace_ only gets evaluated at .sort)
* declare the following
*.sort
*S m
*V v1,v2;
*CF FD, fNoL;

if ((match(fNoL(v1?$vec,m?))) && (match(fNoL(0,m?))==0));
*shifting all loop momenta
  multiply replace_(`p',`p'-$vec);
*shifting all denominators as the loop momentum is implicit
  id fNoL(v2?,m?) = fNoL(v2-$vec,m);
elseif ((match(fNoL(-v1?$vec,m?))) && (match(fNoL(0,m?))==0));
*shifting all loop momenta
  multiply replace_(`p',`p'+$vec);
*shifting all denominators as the loop momentum is implicit
  id fNoL(v2?,m?) = fNoL(v2+$vec,m);
*  argument FD;
*    id `p' = `p'-$vec;
*  endargument;
endif;

#endprocedure
