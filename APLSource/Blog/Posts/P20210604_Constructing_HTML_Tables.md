# [Constructing HTML Tables](/posts/constructing-html-tables)

In my HTML project, I have been constructing HTML tables like so:

~~~
NewTable←{
     ⍝ ⍵ ←→ Namepace
     ⍝      ⍵.Titles (vec of char vecs)
     ⍝      ⍵.Values (Matrix of char vecs)
     ⍝      ⍵.Footer (v/v of footer values)
     ⍝      ⍵.Classes (vec of char vecs)
     ⍝ ← ←→ Table
     ⍺←0
     newRow←{⍺ New'tr'}
     newCell←{New'td'⍵}
     t←⍺ New'table'
     th←t New'thead'
     hr←th newRow 0
     hc←hr{⍺ New'th'⍵}¨⍵.Titles
     hc.class←⍵.Classes
     tb←t New'tbody'
     cd←newCell¨⍵.Values
     r←tb newRow¨⍳≢⍵.Values
     r.Content←↓cd
     r.Content.class←⊂⍵.Classes
     0=⍵.⎕NC'Footer':t
     0=≢⍵.Footer:t
     tf←t New'tfoot'
     fr←tf newRow 0
     fc←fr{⍺ New'th'⍵}¨⍵.Footer
     fc.class←⍵.Classes
     t
 }
~~~

I was not really happy about this, the primary reason being 
the definition of the argument; it seemed somewhat over specified 
for the general style of the project.  When I had to inject additional
class settings into particular rows and columns, I realized I had done it all 
wrong, and now have:

~~~
 NewTable←{
     ⍝ ⍺ ←→ [Parent Element]
     ⍝ ⍵ ←→ Rows, Columns, [Header Rows, [Footer Rows]]
     ⍝ ← ←→ Table
     ⍺←0
     nr nc nh nf←4↑⍵
     newHF←{
         n m←⍵
         n=0:⍬
         e←New ⍺
         r←n New'tr'
         e.Content←r
         r.Content←(n⍴m)New¨⊂'th'
         e
     }
     t←⍺ New'table'
     t.Content,←'thead'newHF nh nc
     tb←t New'tbody'
     r←nr New'tr'
     tb.Content←r
     r.Content←(nr⍴nc)New¨⊂'td'
     t.Content,←'tfoot'newHF nf nc
     t
 }
~~~

Now, the table is initially created with no data, just the properly
structured DOM elements with no cell content, no attributes, no nothing:

~~~
      t←H.NewTable 2 3 1
      H.DOM2HTML t
<table>        
  <thead>      
    <tr>       
      <th></th>
      <th></th>
      <th></th>
    </tr>      
  </thead>     
  <tbody>      
    <tr>       
      <td></td>
      <td></td>
      <td></td>
    </tr>      
    <tr>       
      <td></td>
      <td></td>
      <td></td>
    </tr>      
  </tbody>     
</table>       
~~~

In addition I added a small set of functions for extracting table-specfic elements,
for assigning content, setting attributes, etc.:

~~~
      b←H.BodyCells t
      b.Content←2 3⍴⍕¨⍳6
      h←,H.HeaderCells t 
      h.Content←'Column '∘,¨'One' 'Two' 'Three'
      c←H.Cells t
      c.class←(⍴c)⍴'left' 'right' 'right'
      H.DOM2HTML t
<table>                                  
  <thead>                                
    <tr>                                 
      <th class="left">Column One</th>   
      <th class="right">Column Two</th>  
      <th class="right">Column Three</th>
    </tr>                                
  </thead>                               
  <tbody>                                
    <tr>                                 
      <td class="left">0</td>            
      <td class="right">1</td>           
      <td class="right">2</td>           
    </tr>                                
    <tr>                                 
      <td class="left">3</td>            
      <td class="right">4</td>           
      <td class="right">5</td>           
    </tr>                                
  </tbody>                               
</table>        
~~~

Much better, much lighter, much more freedom for the APL programmer.
