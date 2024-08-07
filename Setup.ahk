;General Optimizations
#SingleInstance, Force
#NoEnv
#HotkeyInterval 99000000
#KeyHistory 0
#MaxHotkeysPerInterval 99000000
DetectHiddenWindows, On
SetTitleMatchMode, 2
SetKeyDelay, -1, -1
SetBatchLines, -1
ListLines Off
Process, Priority, , A
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
;============================
IniRead, mute, settings.ini, Settings, mute
IniRead, FirstInterval, settings.ini, Settings, FirstInterval
IniRead, SecondInterval, settings.ini, Settings, SecondInterval

Gui, Add, Text, x10 y10 w120, Mute (0 or 1):
Gui, Add, Edit, x140 y10 w100 vMuteInput, %mute%
Gui, Add, Text, x10 y40 w120, First Interval (ms):
Gui, Add, Edit, x140 y40 w100 vFirstIntervalInput, %FirstInterval%
Gui, Add, Text, x10 y70 w120, Second Interval (ms):
Gui, Add, Edit, x140 y70 w100 vSecondIntervalInput, %SecondInterval%
Gui, Add, Button, x10 y100 w100 gSaveSettings, Save Settings
Gui, Add, Button, x120 y100 w100 gCancelSettings, Cancel

Gui, Show, w250 h130, Mako Ad Blocker Setup
return

SaveSettings:
Gui, Submit
IniWrite, %MuteInput%, settings.ini, Settings, mute
IniWrite, %FirstIntervalInput%, settings.ini, Settings, FirstInterval
IniWrite, %SecondIntervalInput%, settings.ini, Settings, SecondInterval
MsgBox, , , Settings saved to settings.ini!, 0.8
ExitApp

CancelSettings:
GuiClose:
ExitApp
