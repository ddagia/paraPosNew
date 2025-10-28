#procedure reduceX1(cnt)
.sort
S x1,x2,x3, [1-x1], [1-x2], [1-x3],n;
Set xset: x1,x2,x3;
Set cycX: x2,x3,x1;
Set cycX2: x3,x1,x2;
Set oneMinX: [1-x1],[1-x2],[1-x3];
Set cycOneMinX: [1-x2],[1-x3],[1-x1];
Set cycOneMinX2: [1-x3],[1-x1],[1-x2];

#do i = 1,`cnt'
  id x1/[1-2*x1] = -1/2*([1-2*x1]-1)/[1-2*x1];
  id x?xset[n] /y?cycOneMinX[n] /z?cycOneMinX2[n] = (y + z)/y/z;
  id x?oneMinX?xset = x;

  id x?xset[n] / y?cycX[n] / z?cycOneMinX2[n] = (1 - y + z)/y/z;
  id x?oneMinX?xset = x;

  id x?xset[n] / y?cycOneMinX[n] / z?cycX2[n] = (y + 1 - z)/y/z;
  id x?oneMinX?xset = x;

  id x?xset[n] / y?cycOneMinX[n] / z?cycX[n] = (y + 1 - cycX2[n] )/y/z;
  id x?oneMinX?xset = x;

  id x?xset[n] / y?cycOneMinX2[n] / z?cycX2[n] = (y + 1 - cycX[n] )/y/z;
  id x?oneMinX?xset = x;

  id x?xset[n]/y?oneMinX[n] = ( 1 - y)/y;
  id x?oneMinX?xset = x;

  id x?xset[n]*y?cycX[n]/z?cycOneMinX2 = (z+1-y)*y/z;
  id x?oneMinX?xset = x;

  id x?xset[n]*y?cycX2[n]/z?cycOneMinX = (z+1-y)*y/z;
  id x?oneMinX?xset = x;

  .sort
  S [x1+x2-1], [x1+x2-2];
  id x3 = 2-x1-x2;
  id x3^a?neg_ = sign_(a)*[x1+x2-2]^a;
  id 1/[1-x3] = 1/[x1+x2-1];
  .sort
repeat id x2/[x1+x2-1] = ([x1+x2-1]-x1+1)/[x1+x2-1];
repeat id x2/[x1+x2-2] = ([x1+x2-2]-x1+2)/[x1+x2-2];
.sort
repeat  id 1/[x1+x2-2]/[x1+x2-1] = 1/[x1+x2-2] - 1/[x1+x2-1];
repeat id 1/[1-x2]/[x1+x2-1] = - 1/x1/[1-x2] + 1/x1/[x1+x2-1];
repeat id 1/[1-x1]/[x1+x2-1] = - 1/x2/[1-x1] + 1/x2/[x1+x2-1];
repeat id 1/x1*1/[1-2*x1] = 1/x1 +2/[1-2*x1];
  .sort
#enddo

#endprocedure
