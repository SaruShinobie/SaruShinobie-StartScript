Set objFS = CreateObject("Scripting.FileSystemObject")
strFile = "variables.txt"
Set objFile = objFS.OpenTextFile(strFile)
Do Until objFile.AtEndOfStream
    strLine = objFile.ReadLine
    If InStr(strLine,"firstRunComplete=false")> 0 Then
        strLine = Replace(strLine,"firstRunComplete=false","firstRunComplete=true")
    End If 
    WScript.Echo strLine
Loop