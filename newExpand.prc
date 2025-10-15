#procedure newExpand(input, result, expandParam)
#ifndef `stepCount'
  #define stepCount "3"
#endif
id `input' = `result'*sum_(zi,0,`stepCount', sign_(zi)*z1^zi);
repeat id z1 = `result' * `expandParam';

#endprocedure
