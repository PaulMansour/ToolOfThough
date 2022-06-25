# [A New Workspace File Format](/posts/a-new-workspace-file-format)

I have documented how namespace scripts are a
[practical and efficient](/posts/building-namespace-scripts)
way to store and transport source code. 
I have also documented that
[they have problems](/posts/the-problem-with-namespace-scripts)
that prevent using them to their full potential.

When we are able to define both scripted and unscripted namespaces,
and when we are able to define the root namespace, all in a script,
many very useful possibilites follow effortlessly.

First the Dyalog interpreter should be able to simply open a script
that defines the root. Thus if we have a simple text file `myworksapce.apln`:

~~~
:Namespace #
   ⎕IO←0
   A←⍳10
   :Namespace MySpace 
   :Type unscripted
       f←{+/⍵}
   :EndNamespace 
:EndNamespace
~~~

Then in the session all we need to do is:

~~~
      )load myworkspace.apln
~~~

In other words, we have a new, non-binary file format for the workspace. Furthermore,
it zips up very well, so we could have, say, `.dwsx` files that are compressed
text versions of dws files, analagous to Microsoft Excel `.xls` and `.xlsx` files.
(In my sample, a 13 MB binary workspace is 750 KB as compressed text.)

All sorts of possibilites arise with a zipped `.dwsx` file format, as it can contain,
like `.xlsx` files, multiple files and folders. 
For example, it could contain a [configuration file](https://help.dyalog.com/18.0/#UserGuide/Installation%20and%20Configuration/Configuration%20Files.htm#Configuration_Files).   
It could have multiple namespace scripts and only load and fix code on demand.

A `.dwsx` would probably not be appropriate for developement, as it would have the same
drawbacks as a binary `.dws` file, but for sharing code, transport and application distribution
it may be ideal. A non-zipped `.apln` file, however, may be quite useful for development:
Open a clear workspace, start coding, `)saveastext` and
have a text file representation of the workspace.
