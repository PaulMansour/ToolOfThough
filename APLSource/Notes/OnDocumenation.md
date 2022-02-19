# On Documentation

Documenation projects. In Git. Just another projects, versioned,
may be included as a dependency. Markdown files. Eas

## Built-in Support for Object Model Reference

Objects, methods, properties. Cross reference links, etc.

How to do this easy? Flat, nested? 

## Built-in Support for Function References (or any alphabetical list of things).

## Automatic or Custom TOC.

## Automatic Index


## Sample Structure


## Dictionary Sections

Dictionary style stuff that is just long list of alphabetical stuff:

/Functions
    foo1
    foo2
    foo3
    ...
    
Automatic categorization of items (ie. string functions, numeric function, financial functions, etc.
In each md file, a tag that lists the categories.

## Object Sections

We have objects, properties, methods. How to structure?

Flat? I think so.

/Database_Class.md
/Database_Method_DeleteTable.md
/Database_Property_Name.md

If Object name is first, then what it is (object itself, method, or prop) all 
will sort in nice order for viewing in APL session or file system.
Thought Methods will be listed first then the object, then the props. If we use the
word "class", it will show up first!

Easy to parse and categorize.  The existance of a file determines what is what.

Take all the file names, and produce all the formal links in the Object header
that list all the props and methods. 

Decision: Do we provide for one file for method that applied to many objects?
If so need a place to list what applies to what, now the file name ... bad idea.
We can easily find all objects that support method-X.

## User Guide Sections   (Manual)

Collections of pages that are not naturally ordered, need a place to 
keep TOC and structure. Why not right in the file name? Then no other 

Convention over configuration, but later could 

The Structure of the files in the repo does not need to reflect
the structure after a buiild. However it is very useful for defaulting everything.

Every folder is flat. No further nesting.

Each folder can have an index.md file that holds a default page to display
for the folder. 
                 
Could be arbitrarily nested folders of sections.                 

/UserGuide - a series of chapters
       /index.md   if this does not exist, its just a list of the topics/chapters.
       /Intro.md                            
       /DataColums.md
       /Tables.md                        
       /Databases.md
       /etc.md
     
       /need an optional ordering thing a TOC just text file with the names
        in a particular order. 
       
       toc.charlist  ⍝ defaults to complete list of .md files. 
       
/OtherStuff - a series of other things
           

/FunctionReference    
                  /foo1
                  /foo2
/ObjectReference
                  /Ob1_Object
                  /Ob1_Method_1    


## The Build process:

A docs project may be standalone or just a folder in a larger project.

Build could work on disk or on a namespace. Both?

There needs to be a targetfolder for the build, or just a temp folder , named

Is this even a project? Or just part of Abacus?

Build can create different structures. So that URLs are nice e.g.

/Docs/ObjectReference/Objects/Database/Methods/DeleteTable

If there are _Object, _Method_, then its a objection reference sections
otherwise it's just a regular section, of there is a toc

## Object Model URLs:

Two options for build: flat or nested, links automatically adjusted as needed.
 


Nested

/Functions
/ObjectReference                    ⍝ List of objects 
/ObjectReference/Database           ⍝ The Database Object
/ObjectReference/Database/Members   ⍝ List of methods and properties
/ObjectReference/Database/CreateTable-Method
/ObjectReference/Database/Methods/CreateTable  
    

Flat

/Database-Object
/Database-Name-Property
/Database- 


BuildWebSite                      
         



