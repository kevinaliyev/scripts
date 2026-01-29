; window maximize function

ToggleMaximize() {
    hwnd := WinGetID("A")
    state := WinGetMinMax("ahk_id " hwnd)
    if (state = 1)
        WinRestore("ahk_id " hwnd)
    else
        WinMaximize("ahk_id " hwnd)
}
