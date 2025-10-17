# Parapositronium

Prop and Trace:
  1. Defines Propagators and vetices.
  2. Takes Trace5D using the Larin scheme.
  3. removes levi-civita symbols (they vanish for this problem)
  4. Subtracts counter term, here it subtracts q1->q
  5. Simplifies denominators independent of loop momentum l.

expandAll:
  1. Defines soft and hard region and performs different series approximations for both.
  2. Shifts momentum appropriately to create at least one $\frac{1}
    {[l^2-\{M,m\}^2]}$
  3. performs oneLoop TID
  4. reduces pochammer symbols originating from symmetrization
  5. Drops terms with $<M^{-6}$ and ${\epsilon > 1}$
  6. Tries to cancel identical x1,x2,x3.

use expandAll to run everything, I prefer using 
```
tform -w12 expandAll > out.txt
```
