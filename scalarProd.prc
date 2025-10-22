#procedure scalarProd(A)
* performs scalar products for all the external momenta that show up in pPs->3Ga
* `A' can be x,y,z or x1,x2,x3. It converts scalar prods to one or the other (default:x,y,z)
*id k1(0) = x1*m;
*id k2(0) = x2*m;
*id k3(0) = x3*m;
*id q(0) = m;
id k3.q^c? = (x3*m^2)^c;
id k1.q^c? = (x1*m^2)^c;
id k2.q^c? = (x2*m^2)^c;

id k1.k2^a? = z^a;
id k2.k3^a? = y^a;
id k1.k3^a? = x^a;

id k1.k1 = 0; 
id k2.k2 = 0;
id k3.k3 = 0;
id q.q = m^2;

#if (`A' == "x1" || `A' == "x2" || `A' == "x3")
  id x^a?pos0_ = (2*m^2)^a*(1-x2)^a;
  id y^a?pos0_ = (2*m^2)^a*(1-x1)^a ;
  id z^a?pos0_ = (2*m^2)^a*(1-x3)^a;
  id x^a?neg_ = (2*m^2)^a*[1-x2]^a;
  id y^a?neg_ = (2*m^2)^a*[1-x1]^a ;
  id z^a?neg_ = (2*m^2)^a*[1-x3]^a;
#elseif (`A' == "x" || `A' == "y" || `A' == "z")
  id x1^a? = (1 - y/(2*m^2))^a;
  id x2^a? = (1 - x/(2*m^2))^a;
  id x3^a? = (1 - z/(2*m^2))^a;
#else
#endif
#endprocedure
