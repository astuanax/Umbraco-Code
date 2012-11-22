astuanax.uLog4Js

A client-side javascript logger for Umbraco

Options available in the astuanax.config file:

- logEnabled: true / false
- logFormat: "URL: http://{0} - ID: {1} - ERROR: {2} - LINE: {3} - BR/OS: {4} - DATETIME: {5}"

Manual installation:

Files
- /config/astuanax.config
- /bin/astuanax.uLog4Js.dll
- /xslt/astuanax.uLog4Js.xslt

Macros
- Create a macro astuanax.uLog4Js with 
the following  parameter

alias : pageid
name: Page ID
Type: number

which you can then reference in the <HEAD> of your master pages:
```HTML
<head runat="server">
<umbraco:Macro pageid="[#pageID]" Alias="astuanax.uLog4Js" runat="server"/>
</head>
```
Please make sure to run this code before any other JavaScript

The source code for this package can be found on GitHub:
https://github.com/astuanax/Umbraco-Code

Please feel free to use and modify the code as you see fit. 
Please use GitHub or our.umbraco.org to report bugs or feature requests.

Created by Len dierickx  @ Astuanax - 2012
