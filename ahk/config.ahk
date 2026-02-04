; ***General Preferences***
;-------------------------------------------------------------
; unique tray icon
;-------------------------------------------------------------

Tray_Icon := A_ScriptDir "\assets\icon.png"
TraySetIcon(Tray_Icon)

;-------------------------------------------------------------
; ***Function Preferences***
;-------------------------------------------------------------
; window management keymaps 
;-------------------------------------------------------------

Key_Maximize := "!f"    ; Alt + f
Key_Minimize := "!h"    ; Alt + h

Key_Close := "!q"      ; Alt + q
Key_Kill  := "!+q"     ; Alt + Shift + q

;-------------------------------------------------------------
; window management functionality 
;-------------------------------------------------------------

Hotkey(Key_Maximize, (*) => ToggleMaximize())
Hotkey(Key_Minimize, (*) => MinimizeActive())

Hotkey(Key_Close, (*) => CloseActive())
Hotkey(Key_Kill,  (*) => KillActiveWindow())

;-------------------------------------------------------------
; tray manager keymaps
;-------------------------------------------------------------

Key_HideToTray := "!+h"     ; Alt + Shift + H

;-------------------------------------------------------------
; tray manager functionality
;-------------------------------------------------------------

Hotkey(Key_HideToTray, (*) => HideActiveToTray())
