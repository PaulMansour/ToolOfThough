# [The Constant Operator](/posts/the-constant-operator)

Having neglected moving to version 18 for obvious reasons I was surprised
by this expression from ngn over at the APL Orchard: 

~~~
⍬⍨¨v
~~~

The new constant operator, which simply returns it's left operand. I think
it is exaclty equivalent to:

~~~
{⍺⍺}
~~~

Comparing to creating a vector of empty vectors in more traditional ways,
the contstant operator is certainly the shortest, and more or less as fast
as most of the others:

~~~
      v←⍳10000000
      cmpx '(≢v)⍴⊂⍬' '⍬⍨¨v' '{⍬}¨v'  '⍬∘⊣¨v' 'v⊢¨⊂⍬'
  (≢v)⍴⊂⍬ → 2.7E¯2 |     0% ⎕⎕                                      
  ⍬⍨¨v    → 2.8E¯2 |    +4% ⎕⎕                                      
  {⍬}¨v   → 4.4E¯1 | +1569% ⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕
  ⍬∘⊣¨v   → 2.6E¯2 |    -4% ⎕⎕                                      
  v⊢¨⊂⍬   → 2.6E¯2 |    -1% ⎕⎕
~~~

> NB. That Dfn is very expensive!

However:

~~~
        v←⍳10000000 ⋄ r←v    
        cmpx '(≢v)⍴⊂⍬' '⍬⍨¨v' 'r⊣r[]←⊂⍬'
  (≢v)⍴⊂⍬  → 2.7E¯2 |   0% ⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕
  ⍬⍨¨v     → 2.6E¯2 |  -2% ⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕ 
  r⊣r[]←⊂⍬ → 2.4E¯2 | -11% ⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕    
~~~

Never underestimate the usefulness of bracket indexing.
