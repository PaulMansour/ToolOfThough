# [⎕VFI with ⎕CSV](/posts/vfi-with-csv)

## January 25, 2022

A long-standing problem with [⎕VFI](https://help.dyalog.com/latest/Content/Language/System%20Functions/vfi.htm)
is that it does not accept
the traditional minus sign (only an APL high-minus), nevermind thousand separators,
a plus sign in front of E notation, and a million other things
that Excel users might produce in a CSV file headed your way. It takes
a lot of preprocessing to take outside data and run it through
`⎕VFI`.

The relatively new sytem function
[⎕CSV](https://help.dyalog.com/16.0/Content/Language/System%20Functions/csv.htm) 
handles all the specific cases noted above when converting columns
to numeric. Furthermore it works on in-memory data, so we don't need a file.
This makes it trivial to write an implementation of `⎕VFI` using `⎕CSV`:

~~~
vfi←{
     ⍝ ⎕VFI using ⎕CSV
     ⍝ ⍵ ←→ Char Mat
     ⍝ ← ←→ Num vector
     ⍺←-2*31
     o←⊂'Separator' '⎕'
     o,←⊂'Thousands' ','
     o,←⊂'Fill'⍺
     r←,(⎕CSV⍠o)(,⍵,⎕UCS 13)'S' 3
     v←r≠⍺
     v(v×r)
 }   
~~~

Note:

1. The argument here is a char mat, not a delimited vector like `⎕VFI`.

2. The separator is arbitrary, and should not exist in the argument.
 Probably should check for this.

3. There is currently a bug in `⎕CSV` where it throws an error on a number
 with a thousand separator and no decimal - so don't adapt for production yet!
 (UPDATE: This is is now fixed in version 18.2.45319.0)

4. We should probably test there are no line endings in the argument.

This is almost as fast as `⎕VFI` with no preprocessing, and much faster than a 
solution with `⎕VFI` that requires preprocessing for negative signs and 
thousand separators.

However, there are still things we might want to preprocess for, like
parentheses for a negative number, leading currency characters, and trailing
percentage signs. Here is a first attempt that handles all three cases
which no doubt can be improved:

~~~
vfiPreprocess←{
     ⍝ ⍵ ←→ Char mat
     ⍝   ←→ Modified char mat
     ⎕IO ⎕ML←0 1
     ~∨/'$%('∊⍵:⍵
     m←⍵
     m[⍸m[;0]='$';0]←' '
     lp←m[;0]='('
     ljust←{⍵⌽⍨+/∧\\' '=⍵}
     m[;]←ljust⌽m
     rp←m[;0]=')'
     m[⍸m[;0]='%';0]←' '
     n←⍸lp∧rp
     m[n;0]←' '
     m[;]←ljust⌽m
     m[n;0]←'-'
     m
 }
~~~

Note that `m[;]←` is used rather than `m←` because the former does the assignment in place, 
while the latter makes a copy.

When processing `CSV` files, it is useful to apply `⎕CSV` first with no numeric conversion
bringing everything into the workspace as char columns, and then applying `vfi` to 
the columns we want to convert to numeric. Not only does this technique allow us to 
apply our own custom preprocess function, but it provide the ability to analyze the 
before-and-after conversion.



  
