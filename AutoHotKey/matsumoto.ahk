#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
;#Include IME.ahk
;#InstallKeybdHook


SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

buf_Toggle   := 1
buf_IMEMode := 0

;F1の無効化 ##################################################
F1:: return

;半角・全角でIME　ON ##################################################
vkF3::IME_SET(1)
vkF4::IME_SET(1)
Return

;無変換でIME　OFF ##################################################
vk1D::IME_SET(0)
Return


;メールアドレスの入力#######################
:O:nog::norihiko.matsmoto@gmail.com
Return
:O:nos::norihiko.matsmoto@i.softbank.jp
Return


:O:osewa::
strbk = %clipboard%
Clipboard = 様`nお世話になっています。松本です。`n
Sleep 100
Send,^v

Send,{Up}{Left}
Return

;IEの処理
#IfWinActive , ahk_class IEFrame
{

;IEだと何故かAlt＋全角・半角でないと日本語が有効にならないので対応
;半角・全角でIME　ON ##################################################
;vkF3::!vkF3
;vkF4::!vkF4
Return
}
#IfWinActive

;エクセル以外でもCntr＋Shift + ；で日付入力
^+;::
FormatTime,TimeString,,yyyy/MM/dd
Send,%TimeString%
Return

;Ctrl + Shift + ; でAs/Rでクリップボードのパスを開く（メールでパスを貰ったときとか###
^+o::

;改行を除去する。
str = %clipboard%
str := RegExReplace(str , "\n|\r","")
Run,C:\Asr\AsrLoad.exe %str%

Return


;コピーした内容に>を先頭に追加する。##################################################
^+>::
add = >
strbk = %clipboard%
str = %clipboard%
Loop, Parse, str, `n
{
	if str_row =
		str_row = %add%%A_LoopField%
	else
		str_row = %str_row%`n%add%%A_LoopField%
	
}
clipboard = %str_row%
Send,^v
Sleep 60
clipboard = %strbk%
str = 
strbk = 
str_row =
Return

; OUTLOOKのスケジューラに関する処理##################################################
#IfWinActive ahk_class rctrl_renwnd32
{
; フォルダビューを表示するかどうか切り替え##################################################
 ^+v::
	If ( buf_Toggle )
	{
		Send,!vfn
		buf_Toggle := 0
	}
	Else
	{
		Send,!vfm
		buf_Toggle := 1
	}
Return
 ;日付を挿入##################################################
 ^;:: 
	FormatTime,TimeString,,yyyy/MM/dd
	Send,%TimeString%
Return



getIMEMode := IME_Get()  
if (%getIMEMode% = 0)  
{  
    
    Send,{Home}
    Sleep 30
    Send,<
    Sleep 30
    Send,{End}
    Sleep 30
    Send,>
    Sleep 30
    Send,{Enter}
    return  
}  
else  
{  
	IME_SET(0)
	Sleep 30
	Send,{Home}
	Sleep 30
	Send,<
	Sleep 30
	Send,{End}
	Sleep 30
	Send,>
	Sleep 30
	Send,{Enter}

	Sleep 30
	IME_SET(1)!
	return  
}  
 



Return
		
}
#IfWinActive 

;エクセルの処理
#IfWinActive , ahk_class XLMAIN
{

 ^+v::Send,!hvs　;形式を選択して貼り付け
 ^+r::Send,!hw ;折り返し表示


Return

;該当のファイルが格納されているフォルダをSVNリポジトリブラウザで開く
 ^+q::
		str = 
		Send,^+f
		Sleep 30
		str ="C:\Program Files\TortoiseSVN\bin\TortoiseProc.exe " /command:repobrowser /path:"%Clipboard%"
		Run,%str%
;MsgBox,%str%

Return

;数値書式にする
^+0::Send,^1{Tab}{Down}{Enter}

;該当のファイルが格納されているフォルダをAS/Rで開く




;エクセルでIMEの制御を考慮した行選択
<+Space::  
getIMEMode := IME_Get()  
if (%getIMEMode% = 0)  
{  
    
    Send,+{Space}
    return  
}  
else  
{  
	IME_SET(0)
	Sleep 30
	Send,+{Space}
	Sleep 30
	IME_SET(1)
	return  
}  
Return

#IfWinActive 		
}


;AS/Rの処理
#IfWinActive , ahk_class  {0F04AF43-7B85-46A5-A0A7-6D323A84AD7C}
{


Return

#IfWinActive



}
;エクスプローラの時ファイル名取得
#IfWinActive , ahk_class CabinetWClass
^+F::
clipboard := Explorer_GetSelected()
return

^+S::
clipboard := Explorer_GetPath()
return
	;		path := Explorer_GetPath()
	;		all := Explorer_GetAll()
	;		sel := Explorer_GetSelected()
		;	MsgBox % path
		;	MsgBox % all
		;	MsgBox % sel
		return


Explorer_GetPath(hwnd="")
{
	if !(window := Explorer_GetWindow(hwnd))
		return ErrorLevel := "ERROR"
	if (window="desktop")
		return A_Desktop
	path := window.LocationURL
	path := RegExReplace(path, "ftp://.*@","ftp://")
	StringReplace, path, path, file:///
	StringReplace, path, path, /, \, All

	; thanks to polyethene
	Loop
		If RegExMatch(path, "i)(?<=%)[\da-f]{1,2}", hex)
			StringReplace, path, path, `%%hex%, % Chr("0x" . hex), All
		Else Break
	return path
}

Explorer_GetAll(hwnd="")
{
	return Explorer_Get(hwnd)
}

Explorer_GetSelected(hwnd="")
{
	return Explorer_Get(hwnd,true)
}

Explorer_GetWindow(hwnd="")
{
	; thanks to jethrow for some pointers here
    WinGet, process, processName, % "ahk_id" hwnd := hwnd? hwnd:WinExist("A")
    WinGetClass class, ahk_id %hwnd%

	if (process!="explorer.exe")
		return
	if (class ~= "(Cabinet|Explore)WClass")
	{
		for window in ComObjCreate("Shell.Application").Windows
            ; Some window objects do not have the hwnd property and throw an
            ; exception below.
            ; try
            ; if (window.hwnd!="")
            ; foo = window.Name
            ; IfInString, foo, Windows Explorer
            ; {
                ; MsgBox abcde
            if (window.hwnd==hwnd)
                return window
            ; }
	}
	else if (class ~= "Progman|WorkerW")
		return "desktop" ; desktop found
}

Explorer_Get(hwnd="",selection=false)
{
	if !(window := Explorer_GetWindow(hwnd))
		return ErrorLevel := "ERROR"
	if (window="desktop")
	{
		ControlGet, hwWindow, HWND,, SysListView321, ahk_class Progman
		if !hwWindow ; #D mode
			ControlGet, hwWindow, HWND,, SysListView321, A
		ControlGet, files, List, % ( selection ? "Selected":"") "Col1",,ahk_id %hwWindow%
		base := SubStr(A_Desktop,0,1)=="\" ? SubStr(A_Desktop,1,-1) : A_Desktop
		Loop, Parse, files, `n, `r
		{
			path := base "\" A_LoopField
			IfExist %path% ; ignore special icons like Computer (at least for now)
				ret .= path "`n"
		}
	}
	else
	{
		if selection
			collection := window.document.SelectedItems
		else
			collection := window.document.Folder.Items
		for item in collection
			ret .= item.path "`n"
	}
	return Trim(ret,"`n")
}

; AutoHotkey.ahkをctrl+sで保存した時にリロードする(sakuraだと効かない)

SetTitleMatchMode,2

#IfWinActive, matsumoto.ahk

^s::

    Send,^s

    Sleep,250

    Reload

return

#IfWinActive
