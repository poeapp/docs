; HOWTO: https://autohotkey.com/docs/Tutorial.htm#s12

;SingleInstance force
;SetTitleMatchMode, 3

; https://autohotkey.com/board/topic/35660-url-encoding-function/#entry294368

UriEncode(Uri, Enc = "UTF-8")
{
  StrPutVar(Uri, Var, Enc)
  f := A_FormatInteger
  SetFormat, IntegerFast, H
  Loop
  {
    Code := NumGet(Var, A_Index - 1, "UChar")
    If (!Code)
      Break
    If (Code >= 0x30 && Code <= 0x39 ; 0-9
        || Code >= 0x41 && Code <= 0x5A ; A-Z
        || Code >= 0x61 && Code <= 0x7A) ; a-z
      Res .= Chr(Code)
    Else
      Res .= "%" . SubStr(Code + 0x100, -1)
  }
  SetFormat, IntegerFast, %f%
  Return, Res
}

StrPutVar(Str, ByRef Var, Enc = "")
{
  Len := StrPut(Str, Enc) * (Enc = "UTF-16" || Enc = "CP1200" ? 2 : 1)
  VarSetCapacity(Var, Len, 0)
  Return, StrPut(Str, &Var, Enc)
}

#ifWinActive, Path of Exile

; F8 can be changed to whatever hotkey works best for you.
; https://autohotkey.com/docs/Hotkeys.htm#Symbols

F8::
clipPrev := Clipboard
Send, ^c
itemContents := UriEncode(Clipboard)
Clipboard := clipPrev
Run, https://poeapp.com/item-import/%itemContents%
return

#ifWinActive
