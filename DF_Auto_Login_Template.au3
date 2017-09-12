#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=icon_for_df_auto_logger.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <IE.au3>
#include <MsgBoxConstants.au3>
#include <Date.au3>
#include <WindowsConstants.au3>


$date = @MON & "/" & @MDAY & "/" & @YEAR

_NowTime () ; Grabs the current time

Local $sAlts = Int(1) ; number of alts you want to log in
Local $Completed = Int(0) ; number of sucessful completions
Local $iTimeout = 0

;-------------------------------------Let the Auto Logging Begin!!!!
Call ("SignIn_1")
Func SignIn_1() ; As Your User name (Placeholder is MstrSMART)

	Global $oIE = _IECreate ("http://fairview.deadfrontier.com/onlinezombiemmo/ExternalLoginReg.php") ;Opens up a new Internet Browser Page
	Send("{CTRLDOWN}a{CTRLUP}"); TO SELECT ALL TEXT IN TEXT BOX
	Send("{BS}"); DELETE EVERYING IN CURRENT TEXTBOX

 ; input username one letter at a time---> Case sensitive, Number Snsitive, Space Sensitive, etc
	Send("{M}")
	Send("{s}")
	Send("{t}")
	Send("{r}")
	Send("{S}")
	Send("{M}")
	Send("{A}")
	Send("{R}")
	Send("{T}")
		;Send("{M}")
	;
	Local $password = _IEGetObjByName ($oIE, "passwrd")
	_IEFormElementSetValue ($password, "Your super secret Password")
	Send("{ENTER}"); To complete log in!

	Sleep(6000); Waits 6 seconds for the page to load.

	If _IEPropertyGet($oIE,"locationurl") = "http://fairview.deadfrontier.com/onlinezombiemmo/index.php" Then ;To check if current URL is the DF outpost
		Local $button = _IEGetObjByName ($oIE, "logout") ;Finds the logout button Internally
		_IEAction ($button, "click") ; Clicks on it
	EndIf
	$Completed += 1
		Sleep(5000); Waits 5 seconds for the page to load
		_IEQuit($oIE);Closes Internet Explorer
EndFunc

;-------------------------After everything ends-----------------------------------------------
$file = FileOpen("results.txt", 2)
FileWrite($file, "The last auto log process was completed during: " & @CRLF)
FileWrite($file, "------------" & @CRLF)
FileWrite($file, _Now() & @CRLF)
FileWrite($file, "------------" & @CRLF)
FileWrite($file, "With the results of " & @CRLF)
FileWrite($file, "Total Alts: " & $sAlts & @CRLF)
FileWrite($file, "Total Successful Logins: " & $Completed & @CRLF)
FileWrite($file, "------------" & @CRLF)
FileWrite($file, "You should run the script again after said time & date to increase your farming accurately." & @CRLF)
FileWrite($file, "Thanks for using my script!" & @CRLF)
FileClose($file)

;Local $done = 1

;Once all Done, A message will pop up letting you know how many alts you've inputed and how many alts succeeded of loggin in.
;This is intended for Debugging reasons.

MsgBox($MB_OK, "This script's done!", "Hello! Just to let you know that the DF's ALT AUTO LOGGER's done! Here's the stats. Total Alts: " & $sAlts & " Total Successful Logins: " & $Completed & " These results will be outputted to the results.txt file.", $iTimeout)









