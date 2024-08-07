; Required dependencies:
; - Dark Reader (https://darkreader.org/) - inverts brightness and contrast of the webpage to make ads recognizable
; - VideoSpeed Controller (https://github.com/igrigorik/videospeed) - allows to control the playback speed of HTML5 videos
; Recommended settings:
; - Change the preferred speed of VideoSpeed Controller to the maximum value (16) and add G as a hotkey to toggle the 'preferred speed' - this will make ads as short as possible and mute them
; This is because dark reader recognizes ads as a different element than the video itself, so it thinks the video needs "darkening"
; and the result is that the ad gets completely blacked out.
; - If you dont use a videospeed controller extension - make sure fastforward variable is 0 through setup.ahk or manually through settings.ini
; - The settings.ini file already comes with the recommended settings, but you can change them in the settings.ini file or with Setup.ahk.
;============================
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
SetWorkingDir, %A_ScriptDir%
;============================
Menu, Tray, Icon, scanning.ico
global image_file1 := "Ad_Middle.png"
global image_file2 := "Ad_End.png"
global image_file3 := "Ad_Full.png"
global Toggle := True
global mute
global first_interval
global second_interval
IniRead, mute, settings.ini, Settings, mute, 0
IniRead, fastforward, settings.ini, Settings, fastforward, 1
IniRead, first_interval, settings.ini, Settings, FirstInterval, %first_interval%, int
IniRead, second_interval, settings.ini, Settings, SecondInterval, %second_interval%, int
SetTimer, CheckImage, %first_interval%
Return

F8::
Toggle := !Toggle
If (Toggle) {
   Menu, Tray, Icon, scanning.ico
}
Else {
Menu, Tray, Icon, stopped.ico
}
Return

CheckImage:
If (!Toggle)
   Return
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
Return

CheckImage2:
If (!Toggle)
   Return
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
