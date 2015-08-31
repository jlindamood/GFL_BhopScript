#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Bhop:
*~$Space::
Sleep 31
Loop
{

GetKeyState, SpaceState, Space, P
If SpaceState = U
break

If PerfBypass(100) = 1
continue

Sleep 31
Send, {Blind}{Space}

JumpsToSend = JumpsPerTick(3,6)

Loop, %JumpsToSend% {
Send, {Blind}{Space}
Sleep 1
}
}


PerfBypass(z) { ; returns nothing ; skips a tick 100-z% of the time, or does nothing (script continues)
; BYPASSES BHOP ANTISCRIPT PERF STATISTIC

Random, rand, 0, 100

If (%rand% > z) {
return 1
}
return 0
}



JumpsPerTick(x, y) { ; returns number of jumps to send
; BYPASSES BHOP ANTISCRIPT JUMPSPERTICK MONITORING. Must not be similar numbers, or too high

Random, rand, x, y

return %rand%
}