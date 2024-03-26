;;; Media Controls
;<^>!Space::Media_Play_Pause
;<^>!Left::Media_Prev
;<^>!Right::Media_Next

;;; Characters extensions
<^>!\::`
<^>!+\::~

;;; Explorer Utils
<^>!L::DllCall("user32.dll\LockWorkStation")

; When in explorer, if Ctrl+H is pressed, show hidden files
#IfWinActive ahk_class CabinetWClass
^h::
  ToggleShowHiddenFiles()
  Send {F5}
return
#IfWinActive

ToggleShowHiddenFiles()
{
    RegRead, HiddenFiles_Status, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden
    if HiddenFiles_Status = 2
    {
        RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 1
    }
    else
    {
        RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 2
    }
    ; WinGetClass, eh_Class,A
    ; if (eh_Class = "#32770") ;If the active window is the "Folder Options" window
    ; {
    ;     ControlClick, Button2 ;click the "OK" button
    ; }
    ; else
    ; {
    ;     PostMessage, 0x111, 28931,,, A ;send the WM_COMMAND message to the desktop
    ; }
}
