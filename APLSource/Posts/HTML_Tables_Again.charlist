# [HTML Tables Again](/posts/html-tables-again)

#### June 6, 2021

The previous post was operative for less than 24 hours.
Experience soon proved it silly to provide the dimensions rather
than the data as the argument; it just led to more code.
Let's try again: 

~~~
NewTable←{
     ⍝ ⍺ ←→ [Parent Element]
     ⍝ ⍵ ←→ BodyContent [HeaderContent [FooterContent]]
     ⍝ ← ←→ Table
     ⍺←0
     c←∊'thead' 'tbody' 'tfoot'{
         0=≢⍵:⍬
         d←↑,↓⍵
         e←New ⍺
         r←e New¨{'tr'⍵}¨⍳≢d
         t←(⍺≡'tbody')⊃'th' 'td'
         e⊣r.Content←↓New¨{t ⍵}¨d
     }¨3↑⍬ ⍬,⍨(⊂⍣(2=≡⍵))⍵
     ⍺ New'table'c
}
~~~

It's shorter too. We get rid of a lot of code by recognizing that
the `thead`, `tbody`, and `tfoot` elements are (almost) indentically structured.

`BodyContent`, `HeaderContent`, and `FooterContent` are matrices or vectors of 
simple text vectors. Vectors are treated as one-row matrices.
`BodyContent` is required, `HeaderContent` and `FooterContent` are both
optional. If `FooterContent` is provided but `HeaderContent` is not, 
a `⍬` placeholder is needed.

The class specification is still left out, as using the utility functions
`Cells`, `BodyCells`, `HeaderCells` and `FooterCells` is a much better way 
to specify classes, or any other attributes or additional content.

I usually avoid nested multi-line dfns
(especially in application-specfic code),
but I make exceptions for tightly designed utility functions.

The parentheses required for the power operator are annoying (`⍣`).

Let's see how long this function lasts. 
