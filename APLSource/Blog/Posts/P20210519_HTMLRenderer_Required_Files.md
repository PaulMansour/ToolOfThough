# [HTMLRenderer Required Files](/posts/htmlrenderer-required-files)

The Dyalog documentation lists the required CEF files for distributing the 
HTMLRenderer. It is not entirely accurate. This list below is what Dyalog gives
(I have added the * Required *, * Size *, and * Comment * columns):

|File/Folder            |Size(kb) |Required|Comment|
|:======================|========:|:======|:======|
|htmlrenderer.dll       |  3,364  |Yes    |       |
|cef.pak                |  2,734  |Yes    |       |
|cef_100_percent.pak    |    642  |Yes    |       |
|cef_200_percent.pak    |    739  |Yes    |       |
|cef_extensions.pak     |  1,679  |Yes    |       |
|cef_sandbox.lib        | 90,176  |No!!!  |       |
|chrome_elf.dll         |    947  |Yes    |       |
|d3dcompiler_43.dll     |      0  |No     |HTML5 accelerated content|
|d3dcompiler_47.dll     |  4,245  |No     |HTML5 accelerated content|
|devtools_resources.pak |  6,281  |No     |For developer tools like inspect, etc.|
|icudtl.dat             | 10,183  |Yes    |       |
|libEGL.dll             |    365  |No     |HTML5 accelerated content|
|libGLESv2.dll          |  7,818  |No     |HTML5 accelerated content|
|libcef.dll             |114,124  |Yes    |       |
|libcef.lib             |     37  |Yes    |       |
|locales                | 15,600  |Yes    |This is a folder|
|natives_blob.bin       |      1  |Yes    |       |
|snapshot_blob.bin      |    227  |Yes    |       |
|swiftshader            |  3,970  |No     |This is a folder, for HTML5 accelerated content|
|v8_context_snapshot.bin|    619  |Yes    |       |

The most important thing to note is that the 90 MB file **cef_sandbox.lib**
is *** not *** required, and it appears (and I have asked Dyalog to verify)
that there is no functionality lost by omitting it. 

The comment regarding HTML5 accelerated content refers to 2D canvas, 3D CSS and WebGL.
Presumably this functionality will be lost by not including these files/folders.
Many business apps probably don't this functionality and can so safely omit another
15 MB from the distribution.
                                                                                    

                                                                                    



