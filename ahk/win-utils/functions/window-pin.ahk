global PinnedWindows := Map()

TogglePinActiveWindow(*) {
    hwnd := WinGetID("A")
    if !hwnd
        return

    if PinnedWindows.Has(hwnd) {
        WinSetAlwaysOnTop(0, "ahk_id " hwnd)
        PinnedWindows.Delete(hwnd)
        ToolTip("Unpinned")
        SetTimer(() => ToolTip(), -800)
    } else {
        WinSetAlwaysOnTop(1, "ahk_id " hwnd)
        PinnedWindows[hwnd] := true
        ToolTip("Pinned")
        SetTimer(() => ToolTip(), -800)
    }
}