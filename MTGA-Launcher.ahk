#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force ; ensures no multiple runs at the same time
SetTitleMatchMode, 3  ; ensures that Title matches exactly WinTitle

; Display SplashScreen (Image)
	SplashImage, C:\Users\adria\Meine Ablage\03 - IT\GitHub\MTGA-Launcher\splash-mtg.jpg, B1

; Starting Up the Apps
	;Run, C:\Program Files (x86)\Overwolf\OverwolfLauncher.exe, , Min
	Run, C:\Users\adria\AppData\Local\Programs\untapped-companion\Untapped.gg Companion.exe, , Min
	Run, C:\Users\adria\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\17Lands.com\17Lands MTGA Client.appref-ms
	Run, D:\Wizards of the Coast\MTGA\MTGALauncher\MTGALauncher.exe
; Launch BorderlessGaming without Admin through CMD
	;run, %comspec% /c "set __COMPAT_LAYER=RunAsInvoker && start "" ^"D:\Borderless Gaming\BorderlessGaming.exe^""

Sleep, 5000
WinClose, Untapped.gg
;WinClose, Overwolf Appstore
;WinClose, MTGA Assistant
Sleep, 1000
SplashImage, Off
WinActivate, MTGA
;Sleep, 5000
;WinClose, MTGA Assistant

; By exiting MTGA → closing all the Apps
	WinWaitClose, MTGA
	Sleep, 500
	; ask, if Addons should be killed
	MsgBox, 1, , Press OK to close MTGA Addons
IfMsgBox, OK
	{
	;Process, Close, Overwolf.exe
	Process, Close, Untapped.gg Companion.exe
	Process, WaitClose, Untapped.gg Companion.exe
	;Process, Close, BorderlessGaming.exe
	;Process, WaitClose, BorderlessGaming.exe
	Process, Close, 17Lands MTGA Client.exe
	Process, WaitClose, 17Lands MTGA Client.exe
	}
IfMsgBox, Cancel
    {
	;WinActivate, MTGA Assistant
	ExitApp
	}
	
; ...and refresh Windows Tray Symbols (Taskbar Right = tray bottom right)
  ; move mouse slowly is shit

Return