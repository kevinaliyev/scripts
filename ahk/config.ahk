; ***General Preferences***


; unique tray icon

Tray_Icon := A_ScriptDir "\assets\icon.png"
TraySetIcon(Tray_Icon)


; ***Function Preferences***


; window management keymaps 

Key_Maximize := "!f"
Key_Minimize := "!h"

; window management functionality 

Hotkey(Key_Maximize, (*) => ToggleMaximize())
Hotkey(Key_Minimize, (*) => MinimizeActive())

; tray manager keymaps

Key_HideToTray := "!+h"  ; Alt+Shift+H

; tray manager functionality

Hotkey(Key_HideToTray, (*) => HideActiveToTray())
