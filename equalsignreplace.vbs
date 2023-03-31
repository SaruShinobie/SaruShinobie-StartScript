Set objFS = CreateObject("Scripting.FileSystemObject")
strFile = "variables.txt"
Set objFile = objFS.OpenTextFile(strFile)
Do Until objFile.AtEndOfStream
    strLine = objFile.ReadLine
    If InStr(strLine,"*")> 0 then
        strLine = Replace(strLine,"*","=")
    End If 
    WScript.Echo strLine
Loop    
