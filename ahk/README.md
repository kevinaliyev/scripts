# AHK AIO Windows User Utilities

A collection of AHK scripts meant to improve the workflow of a user on windows.
---
## Usage 

Simply run the main.ahk script 
**(Make sure you have AHK v2 installed, v1 will not work.)**

Additionally, if you want initialization on startup, (Create &) add a shortcut for the main.ahk file in the windows startup apps folder. 

	( win+r -> shell:startup -> drag main.lnk into the folder )
---
## Configuration

Script functionality has been broken into their own function ahk files. For bigger utilities like window management, or taskbar management, you can choose which you wish to include (or rather exclude) by simply <u>commenting</u> out their include statement found in main.ahk, or simply commenting out their keybind in config.ahk if you want to retain some of the scripts functionality.

<b><u>Do not comment out the config.ahk include, or remove it from the top of the stack,</b></u> otherwise the entire thing breaks!

for more customization options, or key remapping look into config.ahk. 
(reference the ahk documentation for keymap and modkey syntax)

Additionally, included in config.ahk are labeled "functionalities", 

these are snippets that could / would be contained in / near their functions definitions that i chose to merge into config.ahk for easier reference when altering keybinds and <b><u>should not be altered</u></b> unless you are going to also alter their references found in their respective /ahk/functions/example.ahk file


