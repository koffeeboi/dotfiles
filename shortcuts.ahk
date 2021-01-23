#n:: 
Run, notepad.exe
return

ChangeWindowFocus(keyToOverride, numberKey) 
{
    Send {LWin down}%numberKey%
    While GetKeyState("LWin","P")
    {
        KeyWait, %keyToOverride%, D T0.4
        If !ErrorLevel ; if you do press q
        {
            Send {Blind}%numberKey%
            KeyWait, %keyToOverride%
        }
    }
    Send {LWin up}
}
#z::
ChangeWindowFocus("z", 1)
return
#x::
ChangeWindowFocus("x", 2)
return
#c::
ChangeWindowFocus("c", 3)
return
#v::
ChangeWindowFocus("v", 4)
return
#a::
ChangeWindowFocus("a", 5)
return
#s::
ChangeWindowFocus("s", 6)
return

