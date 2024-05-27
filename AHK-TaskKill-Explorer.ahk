; AutoHotkey script to manage explorer.exe based on Dota 2 process
#Persistent
#NoEnv
SetTitleMatchMode, 2
DetectHiddenWindows, On
SetTimer, CheckDota2, 1000  ; Check every second

; Variable to track explorer.exe state
explorerClosed := false

CheckDota2:
; Check if dota2.exe is running
Process, Exist, dota2.exe
if (ErrorLevel) {
    ; If explorer.exe is not already closed, close it
    if (!explorerClosed) {
        ; Use TaskKill to close explorer.exe
        Run, taskkill /f /im explorer.exe,, Hide
        explorerClosed := true
    }
} else {
    ; If dota2.exe is not running and explorer.exe was closed, restart it
    if (explorerClosed) {
        Run, explorer.exe
        explorerClosed := false
    }
}
return
