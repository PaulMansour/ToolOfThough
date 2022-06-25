# [Building Namespace Scripts](/posts/building-namespace-scripts)

Keeping APL source code in text files is good for many obvious reasons.
Maintaining APL source code in large classes or namespace scripts is not good for 
less obvious reasons. In APL, the ***function*** is the most 
import unit of work and thought. Classes and large namespace scripts obscure this. 

When working day-to-day on an APL project, the first thing we want to know
in the morning is what functions have been recently changed? 
It is much less useful to know that a 3,000 line
class has changed. We then need special APL aware tools to tell us which functions
in the class are the ones that have contributed to the change in the overall class.
When we keep each function in a separate file, 
the basic features of Git do the work for us. 
                                      
Having many small files, however, also has problems. Operating systems don't like
many small files. Innefficiences arise. Distributing source code is difficult.

Thus there are various trade-offs between few large files and many small files.
Is there a way to have the advantages of many small files for development and 
few (or one) large files for distribution?

A solution to this is the namespace script. Here is a first attempt at 
building a single namespace script from an arbitrary namespace residing
in a workspace:

~~~
  BuildNSS←{
     ⍝ ⍺ ←→ Named namespace
     ⍺←1
     n←↑⌽{⍵⊆⍨'.'≠⍵}⍕⍵
     '['=↑n:''
     t←{16::'' ⋄ ⎕SRC ⍵}⍵
     0<≢t:t
     r←⊂':Namespace ',⍺/n
     r,←⊂'⎕IO ⎕ML←',⍕⍵.⎕IO ⍵.⎕ML
     q←{(⊂'∇',↑⍵),(1↓⍵),⊂,'∇'}
     r,←↑,/q¨⍵.⎕NR¨⍵.⎕NL-3.1 4.1
     r,←↑,/⍵.⎕NR¨⍵.⎕NL-3.2 4.2
     s←⍵{⍵[⍋⍺.⎕NC ⍵]}⍵.⎕NL-9.1 9.4 9.5
     0=≢s:r,⊂':EndNamespace'
     r,←↑,/∇¨⍵⍎¨s
     r,⊂':EndNamespace'
 }
~~~

With this we can take a project that contains thousands of functions across
many nested namespaces and create a single text file, easily zipped, emailed,
and then almost instantaneously fixed in the interpreter version of choice.

> N.B. It should also be possible to build this script directly from source 
> files on disk, but not sure that is worth the effort, given that we already
> have tools like Acre and Link to check, verify and fix code into the workspace.

Some rough stats: For an application containing just over
6,700 functions spread across 5 packages, it takes about 120 milliseconds to 
create a 114,000 line vector of vectors containing a namespace script,
and then about 1.5 seconds to `⎕FIX` it. The script takes about 3 MB on disk,
and zips down to 750 KB. An equivalent saved workspace is about 13 MB. 
        
Unfortunately, there are
[currently problems with namespace scripts](/posts/the-problem-with-namespace-scripts)
that prevent this from working perfectly.  



