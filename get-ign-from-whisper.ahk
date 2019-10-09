; Hover over the whisper button and press alt+left click to capture just
; IGN of the player.

!LButton::
  MouseClick, left
  Var := Clipboard
  Clipboard := RegExReplace( Var,"(\s+).*$","$1" )
  ;SoundBeep
return
