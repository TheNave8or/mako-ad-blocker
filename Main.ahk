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
global image_file1 := "Ad_Middle.png"
global image_file2 := "Ad_End.png"
global image_file3 := "Ad_Full.png"
global mute
global first_interval
global second_interval
IniRead, mute, settings.ini, Settings, mute, 1
IniRead, first_interval, settings.ini, Settings, FirstInterval, %first_interval%, int
IniRead, second_interval, settings.ini, Settings, SecondInterval, %second_interval%, int
SetTimer, CheckImage, %first_interval%
Return

CheckImage:
ImageSearch, OutX, OutY, 0, 0, A_ScreenWidth, A_ScreenHeight, *100 %image_file1%
If (ErrorLevel = 0) {
   Gosub, ImageFound
}
Else {
   ImageSearch, OutX, OutY, 0, 0, A_ScreenWidth, A_ScreenHeight, *100 %image_file2%
   If (ErrorLevel = 0) {
      Gosub, ImageFound
   }
   Else {
      ImageSearch, OutX, OutY, 0, 0, A_ScreenWidth, A_ScreenHeight, *100 %image_file3%
      If (ErrorLevel = 0) {
         Gosub, ImageFound
         }
      }
}
return

CheckImage2:
ImageSearch, OutX, OutY, 0, 0, A_ScreenWidth, A_ScreenHeight, *100 %image_file1%
If (ErrorLevel = 1) {
   ImageSearch, OutX, OutY, 0, 0, A_ScreenWidth, A_ScreenHeight, *100 %image_file2%
   If (ErrorLevel = 1) {
      ImageSearch, OutX, OutY, 0, 0, A_ScreenWidth, A_ScreenHeight, *100 %image_file3%
      If (ErrorLevel = 1) {
         Gosub, ImageNotFound
         }
      }
}
Return

ImageFound:
If (mute)
   SoundSet, 1,, Mute
sleep 50
Send, {G}
SetTimer, CheckImage, Off
SetTimer, CheckImage2, %second_interval%
Return

ImageNotFound:
If (mute)
   SoundSet, 0,, Mute
sleep 500
Send, {G}
SetTimer, CheckImage2, Off
SetTimer, CheckImage, %first_interval%
Return

!F10::
Tooltip, Exiting app
sleep 300
ExitApp