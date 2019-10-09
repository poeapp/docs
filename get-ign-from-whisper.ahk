!LButton::
  MouseClick, left
  Var := Clipboard
  Clipboard := RegExReplace( Var,"(\s+).*$","$1" )
  SoundBeep
return
