#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; TO USE: INSTALL AUTOHOTKEY, AND GO  TO DESKTOP, RIGHT CLICK, CREATE AUTOHOTKEY SCRIPT. 
; COPY AND PASTE THIS SCRIPT (all, including these comments) in, save, double click.
; HOLD SPACE, WIN. Will not proc GFL anticheat or VAC.

;
;  This script is made for GFL servers.
;  GFL uses a very easily bypassable antiscript. I created this script because half the admins script themselves,
;  and don't ban obvious scripters.
;
;  They insist on their antiscript (which is just a stat recorder) solely, despite the obviousness of cheaters.
;  Anyway, here's a free, AHK, stat-bypassing script I made in 20 minutes.
;  ENJOY.
;
;  In the main BHOP function, change PerfBypass(40) to a higher value if you want more consistency.
;  At ~60 (the script fails by default about 20% of the time,) you will not go over .4 (they will not ban).
;


Bhop:
*~$Space::
Sleep 31
Loop
{

GetKeyState, SpaceState, Space, P
If SpaceState = U
break

If PerfBypass(60) = 1
continue

Sleep 31
Send, {Blind}{Space}

JumpsToSend = JumpsPerTick(3,10)

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