# [Session Configuration](/posts/session-configuration)

When I get a new version of Dyalog (Windows), I go to the configuration dialog box
and manually set some options. This is painful, error prone and a general waste of time.
In addition, I increase the session font size, and save the session file. 
This is even worse, as saving the session file can have other deleterious effects.
It has never been clear to me why it is necessary to save the session file simply to remember
session font size. Anyway, it is way past time to change this entire routine.

Dyalog 18.0 introduced some new features, techniques, and options
for session configuration. The most important is the introduction of 
configuration files. Dyalog 18.2 brings some enhancments to these features.
There is now a plethora of ways to intialize settings, configure things, and run 
code on starting the interpreter.

When a new version of Dyalog is installed, I want to 
specify at most one thing: The UserConfigFile parameter. This parameter
will point to my confuration file and, indirectly, its parent folder.
This parent folder is my **user configuration folder**; it contains
the configuration file itself, as well as any other assets for configuring the sesssion
like custom user commands and code that execute on startup.

The user config file, and its encompassing user config folder, should be completely
portable, which means that any file or path specified inside the config file
should be relative to the location of the config file itself.

Currently it looks like some parameters that take file names or paths 
as values will accept relative paths, but not all. The most important one
for me that does not accept relative paths is the SALT/CommandFolder that
specifies where to look for user commands. (I could probably hack this,
but if I start looking at the APL code in `⎕SE`, the urge to rewrite the entire
user command framework will be overwhelming - must not do that!) Thus I am stuck with a unportable
configuration file that looks something like:

~~~
{ 
  Settings: {
             Default_IO: 0,
             Default_ML: 3, 
             ClassicMode: 1,
             ClassicModeSavePosition: 1,
             SingleTrace: 1,
             AutoPW: 1, 
             SessionOnTop: 1,                          
             Log_Size: "8M",
             MaxWS: "8G",
             PropertyExposeRoot: 1,
             Load: "startup.apln",   
             SALT: {
                    CommandFolder: "c:/APLStartup/;[dyalog]/SALT/spice",                 
                   },
             Colours: {
                       SchemeName: "Back in Black",  
                      },
            }
}
~~~

We should be able to write something like:

~~~
  SALT: {
            CommandFolder: "[configfolder];[dyalog]/SALT/spice",                 
        },
~~~


## Fixing and Executing Code on Startup

There are at least four ways to fix and excute code on startup:

1. The user command framework using a **setup.dyalog** file.

2. The **DyalogStartup** parameter.

3. The **DyalogStartupSE** parameter. 

4. The **Load** (and **LX**) configuration parameter.

Option 1 requires placing setup.dyalog in a specific place, this is a no go.
Option 2 requires highjacking LINK, and the DyalogStartupSE parameter which we probably
don't want to do.
Option 3 requires either putting code in some specific place that dyalog knows about
or specifying a fully qualified path. Furthermore, there is a heirarchy of folders that are searched,
which may be too clever by half, and lead to a lot of confusion.
That leaves Option 4, the `Load` parameter. Luckily it respects relative paths,
and will look in the same location as the config file.
The code can expunge itself after executing, and not clutter the root or introduce a 
name conflict. Here, for example, is a very simple startup routine that increases the font size,
and specifies that the session window should be maximized:

~~~
:Namespace startup
     ⎕SE.FontObj[1]←28
     ⎕SE.State←2
     Run←{
         #.⎕EX 'startup'
     }
:EndNamespace
~~~

Of course we could do much more here, like set PFKeys, load code into ⎕SE,
mess around with menus, etc.

It is not clear to me what precisely Dyalog envisioned as use-cases for the `Load` parameter.
It accepts, workspaces, functions, namespace and class scripts and even,
new in 18.2, a folder that is then automatically LINKed. For developement purposes,
it seems ideal to use `Load` for session configuration. 




