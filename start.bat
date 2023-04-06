@echo off

set fastModeQuestionAnswered==false
set desktopQuestionAnswered==false
set devMode==false
set firstRunComplete==false
set fastMode==false

for /f "tokens=* delims=: " %%G in (variables.txt) do set %%G



title Console - Saru's SPT Auto Start Script
:checkforkey
    cd /D %~dp0 && cd dev
    if exist sarushinobie.debugkey set devMode==true && echo: && echo: && echo Developer Mode Enabled. && echo: && echo:
    cd /D %~dp0



rem This program is free software: you can redistribute it and/or modify
rem it under the terms of the GNU General Public License as published by
rem the Free Software Foundation, either version 3 of the License, or
rem (at your option) any later version.

rem This program is distributed in the hope that it will be useful,
rem but WITHOUT ANY WARRANTY; without even the implied warranty of
rem MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
rem GNU General Public License for more details.

rem You should have received a copy of the GNU General Public License
rem along with this program. If not, see <https://www.gnu.org/licenses/>.



rem I SERIOUSLY RECOMMEND GOING THROUGH AND COLLAPSING ALL OF THE `:xxxx` TITLES FROM THE TOP DOWN IF YOU CAN.
rem THERE ARE CODE COMMENTS ABOVE EACH CATEGORY TO EXPLAIN WHAT THE CODE DOES, ALONG WITH NOTES AND DISCLAIMERS.



:temporaryscripts
echo Creating Temp Scripts...
    rem long and brute script to delete vbs scripts in all the directories they're made in - too many.
    :tmpkiller
        echo @echo off> tmpkiller.bat
        echo set /a counter^=0 ^&^& cscript /nologo TMPsleep.vbs "1000">> tmpkiller.bat
        echo ^:check>> tmpkiller.bat
        echo wmic process where name^="cmd.exe" ^| find "cmd.exe" /c^> TMPcmdinstances.txt>> tmpkiller.bat
        echo cls ^&^& echo Checks Performed^: %%counter%% ^&^& echo Don't close this window, it will close itself.>> tmpkiller.bat
        echo set /p cmdinstances= ^< TMPcmdinstances.txt>> tmpkiller.bat
        echo cscript /nologo TMPsleep.vbs "1000">> tmpkiller.bat
        echo if %%cmdinstances%% leq 1 ^(>> tmpkiller.bat
        echo    del TMPprograminstances.txt ^&^& del TMPvariablereplace.vbs ^&^& del TMPloadingwheel.vbs ^&^& del TMPshortcutscript.vbs ^&^& del TMPvariablereformat.vbs ^&^& del TMPservershortcutscript.vbs ^&^& del TMPsleep.vbs ^&^& del TMPcmdinstances.txt>> tmpkiller.bat
        echo    cd /D %%~dp0 ^&^& cd .. ^&^& cd .. ^&^& cd .. ^&^& del TMPservershortcutscript.vbs ^&^& del TMPsleep.vbs ^&^& cd /D %%~dp0>> tmpkiller.bat
        echo    cd EscapeFromTarkov_Data ^&^& del TMPsleep.vbs>> tmpkiller.bat
        echo    ^(goto^) ^2^>nul ^& del "%%~f0" ^& exit>> tmpkiller.bat
        echo ^)>> tmpkiller.bat
        echo set /a counter^=counter+1 ^&^& goto ^:check>> tmpkiller.bat



    :TMPsleep
        rem script to pause, designed to replace timeout command to avoid dropping nul files to hide cmd prompt messages and NOT TRIGGER VIRUSTOTAL??
        echo WScript.Sleep WScript.Arguments^(0^)> TMPsleep.vbs

        echo  ^| Created temporary pause script one.
        cscript /nologo TMPsleep.vbs "20"

        cd .. && cd .. && cd ..
        echo WScript.Sleep WScript.Arguments^(0^)> TMPsleep.vbs

        cd EscapeFromTarkov_Data
        echo WScript.Sleep WScript.Arguments^(0^)> TMPsleep.vbs
        cd /D %~dp0

        echo  ^| Created temporary pause script two.
        cscript /nologo TMPsleep.vbs "20"



    :TMPservershortcutscript
        rem creates shortcut to server file so it starts minimized.
        cd /D %~dp0
        cd .. && cd .. && cd ..

        echo Set objShell = WScript.CreateObject^("WScript.Shell"^)>> TMPservershortcutscript.vbs
        echo strCurDir = objShell.CurrentDirectory>> TMPservershortcutscript.vbs
        echo Set lnk = objShell.CreateShortcut^("Aki.Server.Shortcut.lnk"^)>> TMPservershortcutscript.vbs
        echo lnk.TargetPath = strCurDir ^& "\Aki.Server.exe">> TMPservershortcutscript.vbs
        echo lnk.Description = "SPT Server Shortcut - Minimized">> TMPservershortcutscript.vbs
        echo lnk.WindowStyle = "7">> TMPservershortcutscript.vbs
        echo lnk.WorkingDirectory = strCurDir>> TMPservershortcutscript.vbs
        echo lnk.Save>> TMPservershortcutscript.vbs

        cd /D %~dp0

            echo  ^| Created temporary server shortcut creation script.
            cscript /nologo TMPsleep.vbs "20"



    :TMPshortcutscript
        rem creates shortcut to this file and sends it to the desktop.
        echo dynamicDirectory = CreateObject^("Scripting.FileSystemObject"^).GetParentFolderName^(WScript.ScriptFullName^)> TMPshortcutscript.vbs
        echo Set WshShell = CreateObject^("WScript.Shell"^)>> TMPshortcutscript.vbs
        echo strDesktopPath = WshShell.SpecialFolders^("Desktop"^)>> TMPshortcutscript.vbs
        echo Set objShortcutUrl = WshShell.CreateShortcut^(strDesktopPath ^& "\SinglePlayerTarkov.lnk"^)>> TMPshortcutscript.vbs
        echo objShortcutUrl.TargetPath = dynamicDirectory ^& "\start.bat">> TMPshortcutscript.vbs
        echo objShortcutUrl.Description = "Start SPT">> TMPshortcutscript.vbs
        echo objShortcutUrl.IconLocation = dynamicDirectory ^& "\logo.ico">> TMPshortcutscript.vbs
        echo objShortcutUrl.Save>> TMPshortcutscript.vbs

        echo  ^| Created temporary shortcut creation script.
        cscript /nologo TMPsleep.vbs "20"



    :TMPvariablereplace
        rem should replace variable in variables.txt file, but i dont believe its used as of now. better to have it than not.
        echo Set objFS = CreateObject^("Scripting.FileSystemObject"^)> TMPvariablereplace.vbs
        echo strFile = "variables.txt">> TMPvariablereplace.vbs
        echo Set objFile = objFS.OpenTextFile^(strFile^)>> TMPvariablereplace.vbs
        echo Do Until objFile.AtEndOfStream>> TMPvariablereplace.vbs
        echo strLine = objFile.ReadLine>> TMPvariablereplace.vbs
        echo If InStr^(strLine,"firstthing"^)^> 0 then>> TMPvariablereplace.vbs
        echo strLine = Replace^(strLine,"firstthing","secondthing"^)>> TMPvariablereplace.vbs
        echo End If>> TMPvariablereplace.vbs
        echo WScript.Echo strLine>> TMPvariablereplace.vbs
        echo Loop>> TMPvariablereplace.vbs

        echo  ^| Created temporary variable replace script.
        cscript /nologo TMPsleep.vbs "20"



    :TMPvariablereformat
        rem replace all of one character or string with another character/string. 
        echo Set objFS = CreateObject^("Scripting.FileSystemObject"^)> TMPvariablereformat.vbs
        echo strFile = "variables.txt">> TMPvariablereformat.vbs
        echo Set objFile = objFS.OpenTextFile^(strFile^)>> TMPvariablereformat.vbs
        echo Do Until objFile.AtEndOfStream>> TMPvariablereformat.vbs
        echo strLine = objFile.ReadLine>> TMPvariablereformat.vbs
        echo If InStr^(strLine,"\"^)^> 0 then>> TMPvariablereformat.vbs
        echo strLine = Replace^(strLine,"\","/"^)>> TMPvariablereformat.vbs
        echo End If>> TMPvariablereformat.vbs
        echo WScript.Echo strLine>> TMPvariablereformat.vbs
        echo Loop>> TMPvariablereformat.vbs

        echo  ^| Created temporary variable reformat script.
        cscript /nologo TMPsleep.vbs "20"



    :TMPloadingwheel
        rem loading animation script without 'Loading...' message
        echo WScript.StdOut.Write^(chr^(8^) ^& WScript.Arguments^(0^)^)> TMPloadingwheel.vbs

        echo  ^| Created temporary loading wheel ^(#1^) script.
        cscript /nologo TMPsleep.vbs "20"



    :TMPloadingwheelwithmessage
        rem script behind the loading progress animation... not used enough. looks good. use more. 
        echo WScript.StdOut.Write^(chr^(8^) ^& chr^(8^) ^& chr^(8^) ^& chr^(8^) ^& chr^(8^) ^& chr^(8^) ^& chr^(8^) ^& chr^(8^) ^& chr^(8^) ^& chr^(8^) ^& chr^(8^) ^& chr^(8^) ^& WScript.Arguments^(0^)^)> TMPloadingwheel.vbs
        
        echo  ^| Created temporary loading wheel ^(#2^) script.
        cscript /nologo TMPsleep.vbs "40"



    :endscriptcreation
        echo:
        echo All scripts have been saved.
        echo:



:serverFileShortcutCreate
    rem pre-creates shortcut to server file 
    cd /D %~dp0
    cd .. && cd .. && cd ..
    cscript /nologo TMPservershortcutscript.vbs
    cd /D %~dp0
    cscript /nologo TMPsleep.vbs "500"
    echo Created server shortcut.



:tempfilekiller
    rem starts tmpkiller.bat
    if %devMode%==true cscript /nologo TMPsleep.vbs "1500"
    @start /min tmpkiller.bat
    echo Started temporary script cleaner.
    if %devMode%==true cscript /nologo TMPsleep.vbs "1000"



:start
    rem checks for variables.txt file... not very much point right now?
    rem all checks seem to work okay without any intervention. leaving as a just-in-case.
    cd /D %~dp0
    if exist variables.txt (
        echo Retrieving saved settings...
        echo:
        goto :disclaimer
    ) else if NOT exist variables.txt (
        echo No saved variables detected, starting setup process...
        echo:
        goto :disclaimer
    )



:disclaimer
        rem skips disclaimer if dev mode is on & if first run is complete skip delays
        if %devMode%==true  goto :directorythings
    cscript /nologo TMPsleep.vbs "2000"
    cls
    echo:
    echo:
    echo:
    echo:
    echo ==============================
    echo:
    echo Start Script SETUP - Copyright^(C^) ^2023 - SaruShinobie
    echo:
    echo This program comes with ABSOLUTELY NO WARRANTY.
    echo This is free software, and you are welcome to redistribute it
    echo under certain conditions detailed in the GNUPL Version 3.0 ^(link below.^)
    echo You can view this document at ^(https://www.gnu.org/licenses/gpl-3.0^),
    echo or, in the 'LICENSE' file included with this program.
    echo:
    if %firstRunComplete%==false cscript /nologo TMPsleep.vbs "2000"
    echo:
    echo This is version *2.0.0,* the third release of this program.
    echo If you encounter bugs or workarounds, you can email me or message me on Discord.
    echo:
    echo Email - sarushinobie@gmail.com 
    echo Discord - SaruShinobie#8639  ^(**FASTER^)
    echo:
    echo ==============================
    echo:
    echo:

    if not %firstRunComplete%==true (
        cscript /nologo TMPsleep.vbs "6000"
        pause 
        cls
        goto :directorythings
    )
    if %firstRunComplete%==true (
        cscript /nologo TMPsleep.vbs "3000"
        cls
        goto :directorythings
    )



rem points to the folder that the batch file is in, and goes up three folders in the path to get to the spt root folder.
:directorythings
    rem essentially, C:/spt/user/mods/startscriptmodfolder
    rem                  ^  batch file here ^
    rem       point here ^
    if exist variables.txt goto :enddirectorysetup

    cd /D %~dp0
    set modFolderDirectory=%cd%

    cd .. && cd .. && cd ..
    set installFolderDirectory=%cd%

    cd /D %modFolderDirectory%
        echo ; This file contains your saved settings. If you plan on modifying this, just ensure that you format it correctly.> variables.txt
        echo ; For example; "thisSettingIsStupid=yourValueHere">> variables.txt
        echo modFolderDirectory=%modFolderDirectory%>> variables.txt
        echo installFolderDirectory=%installFolderDirectory%>> variables.txt



:enddirectorysetup
    cd %installFolderDirectory%
    echo: && echo Pointing to "%cd%" && echo:



rem error for when directory is invalid.
:firsterror-dir
    if errorlevel 1 (
        cls
        title Console - Saru's SPT Auto ^Start Script - *ERROR, FILEPATH*
        echo Could not find your SPT root folder. The directory is either invalid, or doesn't exist.
        echo:
        echo Check that your mod folder ^("SaruShinobie-StartScript-x.x.x"^) was put into the
        echo "...{SinglePlayerTarkov}/user/mods" folder, and that you have SPT installed.
        echo:
        echo Press a key to close this window when ready.
        echo          __
        echo   _     / /
        echo  ^(_^)   / / 
        echo       / /  
        echo   _  / /   
        echo  ^(_^)/ /    
        echo    /_/ 
        echo:
        echo "%modFolderDirectory%" is the current directory of the mod folder.
        echo Exit code %errorlevel%, Error 01 - Invalid Directory.
        echo:
        echo ==============================
        echo:
        goto :endscript-error
    )
    echo Valid directory found.
    cscript /nologo TMPsleep.vbs "120"



rem error - cant find server file.
:seconderror-server
    if not exist Aki.Server.exe (
        cls
        title Console - Saru's SPT Auto ^Start Script - *ERROR, SERVER*
        echo Could not find the 'Aki.Server.exe' file.
        echo:
        echo Check that your mod folder ^("SaruShinobie-StartScript-x.x.x"^) was put into the
        echo "...{SinglePlayerTarkov}/user/mods" folder, and that you have SPT installed.
        echo:
        echo Press a key to close this window when ready.
        echo          __
        echo   _     / /
        echo  ^(_^)   / / 
        echo       / /  
        echo   _  / /   
        echo  ^(_^)/ /    
        echo    /_/ 
        echo:
        echo "%modFolderDirectory%" is the current directory of the mod folder.
        echo Exit code %errorlevel%, Error 02 - Server File Not found.
        echo:
        echo ==============================
        echo:
        goto :endscript-error
    )
    echo Valid server file found.
    cscript /nologo TMPsleep.vbs "120"



rem error - cant find launcher file.
:thirdderror-launcher
    if not exist Aki.Launcher.exe (
        cls
        title Console - Saru's SPT Auto ^Start Script - *ERROR, LAUNCHER*
        echo Could not find the 'Aki.Launcher.exe' file.
        echo:
        echo Check that your mod folder ^("SaruShinobie-StartScript-x.x.x"^) was put into the
        echo "...{SinglePlayerTarkov}/user/mods" folder, and that you have SPT installed.
        echo:
        echo Press a key to close this window when ready.
        echo          __
        echo   _     / /
        echo  ^(_^)   / / 
        echo       / /  
        echo   _  / /   
        echo  ^(_^)/ /    
        echo    /_/ 
        echo:
        echo "%modFolderDirectory%" is the current directory of the mod folder.
        echo Exit code %errorlevel%, Error 03 - Launcher File Not found.
        echo:
        echo ==============================
        echo:
        goto :endscript-error
    )
    echo Valid launcher file found.
    cscript /nologo TMPsleep.vbs "120"



:randomfilecheck
    rem uses the data files in EscapeFromTarkov_Data and their numbering to check if the install is legit.
    rem uses a random number generator to pick a number between the first and last data file numbers and checks if the two files picked exist in the user's directory.
    rem some file numbers are just... skipped. because BSG. Two checks are necessary because of it, to prevent false flags.
    echo:
    echo Picking random files...
    cd %installFolderDirectory%
    set /a randomnumber1=%random% %%400
    set tarkovfile1=sharedassets%randomnumber1%.assets

    set /a randomnumber2=%random% %%400
    set tarkovfile2=sharedassets%randomnumber2%.asset
    
    cscript /nologo TMPsleep.vbs "100"
    echo  ^| %tarkovfile1% is your first random file.
    cscript /nologo TMPsleep.vbs "100"
    echo  ^| %tarkovfile2% is your second random file.
    cscript /nologo TMPsleep.vbs "200"
    echo Checking that files exist...

        cd EscapeFromTarkov_Data
        if not exist %tarkovfile1% (
            echo  ^| **First check failed. Filename: %tarkovfile1%
            cscript /nologo TMPsleep.vbs "250"
            if not exist %tarkovfile2% (
                echo  ^| **Second check failed. Filename: %tarkovfile2%

                cls
                title Console - Saru's SPT Auto ^Start Script - *ERROR, FILE CHECK FAILED*
                echo Could not find the random data file.
                echo:
                echo Check that you have a legitimate copy of Escape From Tarkov/SPT installed.
                echo This check may sometimes fail despite your install being fully functional,
                echo although this is extremely rare as there are two separate checks. 
                echo If this happens, you can simply retry.
                echo:
                echo Press a key to close this window when ready.
                echo          __
                echo   _     / /
                echo  ^(_^)   / / 
                echo       / /  
                echo   _  / /   
                echo  ^(_^)/ /    
                echo    /_/ 
                echo:
                echo "%tarkovfile1%" and "%tarkovfile2%" are the random files chosen.
                echo If you want to help me fix the issue, send the file names to me. Contact info below.
                echo ^("SaruShinobie#8639" on discord / "sarushinobie@gmail.com"^)
                echo:
                echo Exit code %errorlevel%, Error 04 - File Check Failed.
                echo:
                echo ==============================
                echo:
                goto :endscript-error
            )
        )

    if exist %tarkovfile1% echo  ^| First check passed.
    cscript /nologo TMPsleep.vbs "150"
    if exist %tarkovfile2% echo  ^| Second check passed.
    cscript /nologo TMPsleep.vbs "150"
    del TMPsleep.vbs
    cd %modFolderDirectory%

    echo Files found. Install is legitimate.
    echo:
    echo ==============================
    echo:
    cscript /nologo TMPsleep.vbs "250"



if %desktopQuestionAnswered%==true goto :startup
:desktopshortcut
    rem create desktop shortcut.
    echo **WOULD YOU LIKE TO CREATE A SHORTCUT TO SPT ON YOUR DESKTOP?**
    echo:
    echo This program can send a shortcut to itself to your desktop,
    echo so you can start Tarkov as easily as possible.
    echo This will not show up on any other user's desktops on your device.
    echo:
    :choice2
        set choice2=
        set /p choice2=Would you like to create a desktop shortcut to Single Player Tarkov? [Y/N] 
        if /I %choice2%==y (
            echo desktopQuestionAnswered=true>> variables.txt
            echo:
            echo Creating shortcut...
            cd /D %~dp0
            cscript /nologo TMPshortcutscript.vbs
            cscript /nologo TMPsleep.vbs "2000"
            cd %installFolderDirectory%
            goto :startup
        )
        if /I %choice2%==n (
            echo desktopQuestionAnswered=true>> variables.txt
            echo A shortcut will not be created.
            cd %installFolderDirectory%
            goto :startup
        )
        echo Your answer was invalid. You can enter 'y' for yes or 'n' for no.
        pause
        cls
        goto :desktopshortcut



:startup
    rem start server, use shortcut so it starts minimized.
    rem netstat program writes to nul file... so using a sleep script is kinda stupid now. maybe fix? maybe not?
    rem added check to skip the startup process if the server is already up.
    cd %installFolderDirectory%
    echo Starting Server ^(Aki.Server.exe^)...
    @start Aki.Server.Shortcut.lnk

    cd %modFolderDirectory%



:loop
    rem loading animation.
    netstat -o -n -a | findstr 6969 >nul 2>&1 && if %ERRORLEVEL%==0 goto :endloop
    cscript //nologo TMPloadingwheel.vbs "Loading... \" 
        cscript //nologo TMPsleep.vbs "400"
    cscript //nologo TMPloadingwheel.vbs "Loading... |"
        cscript //nologo TMPsleep.vbs "400"
    cscript //nologo TMPloadingwheel.vbs "Loading... /"
        cscript //nologo TMPsleep.vbs "400"
    cscript //nologo TMPloadingwheel.vbs "Loading... -"
        cscript //nologo TMPsleep.vbs "400"
    goto :loop



:endloop

    wmic process where name="Aki.Server.exe" | find "Aki.Server.exe" /c> TMPprograminstances.txt
    set /p programinstances= < TMPprograminstances.txt
    if %programinstances% gtr 1 (
        echo More than one process detected, closing all and restarting...

        :killtask
        taskkill /IM Aki.Server.exe> nul
        wmic process where name="Aki.Server.exe" | find "Aki.Server.exe" /c> TMPprograminstances.txt
        cscript //nologo TMPsleep.vbs "100"
        set /p programinstances= < TMPprograminstances.txt
        if %programinstances% gtr 1 goto :killtask
        if %programinstances%==0 goto :startup
        goto :killtask
    )

    echo Server started.

    cd %installFolderDirectory%
    echo Starting launcher ^(Aki.Launcher.exe^)...
    @start Aki.Launcher.exe
    cscript //nologo TMPsleep.vbs "5000"

    echo Launcher started.



:endstartup
    cd %modFolderDirectory%
    echo:
    echo All processes finished.



if %fastModeQuestionAnswered%==true goto :finalsplashscreen
:fastmode
    if %devMode%==false cscript /nologo TMPsleep.vbs "2000"
    echo:
    echo ==============================
    echo:
    echo **WOULD YOU LIKE TO ENABLE FAST MODE?**
    echo:
    echo Fast mode significantly cuts down on
    echo excess delays to streamline startups,
    echo but normal mode looks and feels a whole lot nicer.
    echo:
    echo If you're seeing this message, this is your
    echo first time running this program.
    echo:
    :choice3
        set choice3=
        set /p choice3=Would you like to enable fast mode? [Y/N] 
        if /I %choice3%==y (
            echo fastModeQuestionAnswered==true>> variables.txt
            echo fastMode=true>> variables.txt
            echo:
            echo Variables saved. Fast mode will be enabled next time you run the program.
            goto :finalsplashscreen
        )
        if /I %choice3%==n (
            echo fastModeQuestionAnswered==true>> variables.txt
            echo fastMode=false>> variables.txt
            echo Variables saved. Fast mode will not be enabled.
            echo:
            goto :finalsplashscreen
        )
        echo Your answer was invalid. You can enter 'Y' for yes or 'N' for no.
        echo:
        pause
        cls
        goto :fastmode



:finalsplashscreen
    rem ascii splash art - happy playing
            rem i promise it looks better in the console.
            echo:
            echo ======================================================================================================
            echo:
            echo   _    _            _____   _____ __     __  _____   _             __     __ _____  _   _   _____  _ 
            echo  ^| ^|  ^| ^|    /\    ^|  __ \ ^|  __ \\ \   / / ^|  __ \ ^| ^|         /\ \ \   / /^|_   _^|^| \ ^| ^| / ____^|^| ^|
            echo  ^| ^|__^| ^|   /  \   ^| ^|__^) ^|^| ^|__^) ^|\ \_/ /  ^| ^|__^) ^|^| ^|        /  \ \ \_/ /   ^| ^|  ^|  \^| ^|^| ^|  __ ^| ^|
            echo  ^|  __  ^|  / /\ \  ^|  ___/ ^|  ___/  \   /   ^|  ___/ ^| ^|       / /\ \ \   /    ^| ^|  ^| . ` ^|^| ^| ^|_ ^|^| ^|
            echo  ^| ^|  ^| ^| / ____ \ ^| ^|     ^| ^|       ^| ^|    ^| ^|     ^| ^|____  / ____ \ ^| ^|    _^| ^|_ ^| ^|\  ^|^| ^|__^| ^|^|_^|
            echo  ^|_^|  ^|_^|/_/    \_\^|_^|     ^|_^|       ^|_^|    ^|_^|     ^|______^|/_/    \_\^|_^|   ^|_____^|^|_^| \_^| \_____^|^(_^)
            echo:
            echo:
            echo ======================================================================================================
            echo:
    echo Server and Launcher should both be up and running, this window will automatically close in a moment.
    echo All that's left now is for you to press play in the launcher and enjoy the game! :^)



:endscript-clean
    if %firstRunComplete%==false (
        echo firstRunComplete=true>> variables.txt
    )
    cscript /nologo TMPsleep.vbs "6000"
    exit



:endscript-error
    echo Encountered error, closing window.
    cscript /nologo TMPsleep.vbs "3000"
    pause
    exit
