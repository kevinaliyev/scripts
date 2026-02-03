; Window maximize function

ToggleMaximize() {
    hwnd := WinGetID("A")
    state := WinGetMinMax("ahk_id " hwnd)
    if (state = 1)
        WinRestore("ahk_id " hwnd)
    else
        WinMaximize("ahk_id " hwnd)
}

; Window minimize wrapper to avoid using lambda in hotkeys (guess who has to use a lambda anyways [this guy])

MinimizeActive(*) {
    WinMinimize("A")
}
