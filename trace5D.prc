#procedure trace5D
* traces5D, Larin scheme, inspired by Moch
* write all spin lines as m\d
* 
* ensure only indices occir in gg(), otherwise the pattern matching may not be exhaustive.
.sort:reducing all but one g5;

#ifndef `MAXGAM'
  #define MAXGAM "30"
#endif
#ifndef `COUNTG5'
  #define COUNTG5 "3"
#endif
I m1;
Autodeclare I i=0;
NT gg,Ga,G1,G2;

*removes all gamma5's except for one
#do i = 0, `COUNTG5'-2
  if ((match(gg(m1?,five))>1) || (match(gg(m1?,alpha?,five))>1));
    if (match(gg(m1?,alpha?)*gg(m1?,five)));
      id once gg(m1?,alpha?)*gg(m1?,five) = invfac_(3)* gg(m1, i{1+3*`i'},i{2+3*`i'},i{3+3*`i'})
                              *e_(alpha,i{1+3*`i'},i{2+3*`i'},i{3+3*`i'});
    else;
      id once gg(m1?,alpha?,five) = invfac_(3)* gg(m1, i{1+3*`i'},i{2+3*`i'},i{3+3*`i'})
                              *e_(alpha,i{1+3*`i'},i{2+3*`i'},i{3+3*`i'});
    endif;
  endif;
#enddo

*once gg(m1,beta, five ) = invfac_(3)* gg(m1, i4,i5,i6)*e_(beta,i4,i5,i6);

.sort:chainin and moving fives to the end;
repeat;
  id gg(m1?, ?a)*gg(m1?, ?b) = gg(m1,?a,?b);
endrepeat;
id gg(m1?, ?a, five, ?b) = Ga(m1, ?b, ?a, five);

.sort:contract;
*contracts all levi-civita's here as there's no "repeated" indices yet, all levi-civitas have different i'i'

contract;
.sort

sum i1,...,i{3*`COUNTG5'+1};
.sort: removing odd gammas;

#do i = `MAXGAM'-1,3,-2
  id Ga(m1?,<i1?>,...,<i{`i'}?>, five) = 0;
#enddo
  id Ga(m1?, i1?, i2?, five) = 0;
  id Ga(m1?, i1?, five) = 0;
  id Ga(m1?, five) = 0;
.sort:start distrib;


repeat;
  id once Ga(m1?,?a, mu1?,five) = distrib_(-2,3,G1,G2,?a)*Ga(mu1,five);
  id G2(i1?,i2?,i3?)*Ga(i4?,five) = e_(i1,...,i4);
endrepeat;
.sort:tracen w g5;
repeat;
  if (count(G1,1));
    id once G1(?a) = g_(1,?a);
    tracen,1;
  endif;
endrepeat;

.sort:tracen wo g5;
#do i = 1,3
id once gg(m1?,?a) = g_(`i',?a);
tracen `i';
#enddo

contract;
.sort

sum i1,...,i{3*`COUNTG5'+1};
.sort

.sort

#endprocedure
