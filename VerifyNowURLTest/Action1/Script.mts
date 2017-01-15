Set oShell = CreateObject( "WScript.Shell" )
Set objEnv = oShell.Environment("USER")

TEXT_TO_SEARCH = objEnv("TEXT_TO_SEARCH")
TEST_URL = objEnv("TEST_URL")


Call TEXT_Verification(TEXT_TO_SEARCH,TEST_URL)

Function TEXT_Verification(TEXT_TO_SEARCH,TEST_URL)

Tittle = "Find a String in a webpage"

Set IE = CreateObject("InternetExplorer.Application")
IE.Visible = True
Set objFSO = CreateObject("Scripting.FileSystemObject")
IE.navigate(TEST_URL)

While IE.ReadyState <> 4

'Wscript.sleep 5

Wend 

TEXT_On_User_Page= IE.document.documentElement.innerText

CaptureScreenshot "ScreenShot"

IE.Quit

Set IE = Nothing

Set objRegex = new RegExp

objRegex.Pattern = TEXT_TO_SEARCH

objRegex.Global = False

objRegex.IgnoreCase = True

Set Matches = objRegex.Execute(TEXT_On_User_Page)

For Each Match in Matches

TEXT_Verification = True 
'MsgBox "We found this word : " &vbCr& StrConvert(Match.Value) & "  in  " & StrConvert(TEST_URL),64,Tittle

NEXT

End Function

Function StrConvert(strIn)

StrConvert = Chr(34) & strIn & Chr(34)

End Function

function CaptureScreenshot(pScreenshotName)
strScreenshotsFolder = Environment("TestDir")

Set fso = CreateObject("Scripting.FileSystemObject")
If Not fso.FolderExists(strScreenshotsFolder & "\Screenshots") Then 
Set f = fso.GetFolder(strScreenshotsFolder)
Set fc = f.SubFolders
fc.Add("Screenshots")
End If

strScreenshotName = strScreenshotsFolder & "\Screenshots\" & pScreenshotName & ".png"
Desktop.CaptureBitmap strScreenshotName, True    
End Function

