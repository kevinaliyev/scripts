global Hidden := Map()  ; hwnd -> title

; automatically hide namecheap dynamic dns client on startup

global AlwaysHideExe := "Dynamic DNS Client.exe"


Tray_Init(*) {
    ; Submenu that will list hidden windows
    global HiddenMenu := Menu()

    A_TrayMenu.Add()
    A_TrayMenu.Add("Show Hidden Windows", HiddenMenu)
    A_TrayMenu.Add("Restore Last Hidden", RestoreLastHidden)
    A_TrayMenu.Add("Restore All Hidden", RestoreAllHidden)
    A_TrayMenu.Add("Clear Hidden List", ClearHiddenList)
    A_TrayMenu.Add()

    RefreshHiddenMenu()

    ; Re-hide the always-hide app if it becomes visible again
    SetTimer(AutoHideTick, 750)

    ; Failsafe: restores windows on clean exit, force exits will need manual intervention
    OnExit(RestoreAllHidden)
}

HideActiveToTray(*) {
    hwnd := WinGetID("A")
    if hwnd
        HideSpecificHwnd(hwnd)
}

HideSpecificHwnd(hwnd) {
    global Hidden
    if !WinExist("ahk_id " hwnd)
        return

    title := WinGetTitle("ahk_id " hwnd)
    if (title = "")
        title := "Untitled"

    WinHide("ahk_id " hwnd)
    Hidden[hwnd] := title
    RefreshHiddenMenu()
}

RestoreHiddenByHwnd(hwnd, *) {
    global Hidden
    if !Hidden.Has(hwnd)
        return

    if WinExist("ahk_id " hwnd) {
        WinShow("ahk_id " hwnd)
        WinActivate("ahk_id " hwnd)
    }
    Hidden.Delete(hwnd)
    RefreshHiddenMenu()
}

RestoreLastHidden(*) {
    global Hidden
    last := 0
    for hwnd, _ in Hidden
        last := hwnd
    if last
        RestoreHiddenByHwnd(last)
}

RestoreAllHidden(*) {
    global Hidden
    keys := []
    for hwnd, _ in Hidden
        keys.Push(hwnd)

    for _, hwnd in keys {
        if WinExist("ahk_id " hwnd)
            WinShow("ahk_id " hwnd)
    }
    Hidden.Clear()
    RefreshHiddenMenu()
}

; Used by OnExit as a failsafe
RestoreAllHiddenOnExit(ExitReason, ExitCode) {
    RestoreAllHidden()
}

ClearHiddenList(*) {
    global Hidden
    Hidden.Clear()
    RefreshHiddenMenu()
}

RefreshHiddenMenu(*) {
    global Hidden, HiddenMenu

    HiddenMenu.Delete()

    ; prune dead windows
    dead := []
    for hwnd, _ in Hidden
        if !WinExist("ahk_id " hwnd)
            dead.Push(hwnd)
    for _, hwnd in dead
        Hidden.Delete(hwnd)

    if (Hidden.Count = 0) {
        HiddenMenu.Add("(none)", (*) => 0)
        return
    }

    for hwnd, title in Hidden
        HiddenMenu.Add(title, RestoreHiddenByHwnd.Bind(hwnd))
}

AutoHideTick(*) {
    global AlwaysHideExe

    crit := "ahk_exe " AlwaysHideExe

    if !WinExist(crit)
        return

    hwnd := WinGetID(crit)
    if !hwnd
        return

    ; If visible, hide it and track it.
    ; WS_VISIBLE = 0x10000000
    style := WinGetStyle("ahk_id " hwnd)
    if (style & 0x10000000)
        HideSpecificHwnd(hwnd)
}
