@echo off

:script_presetup
    cd /D %~dp0
    set modFolderDirectory=%cd%
    cd .. && cd .. && cd ..
    set installFolderDirectory=%cd%

    cd %modFolderDirectory%

    set fastModeQuestionAnswered==false
    set desktopQuestionAnswered==false
    set devMode==false
    set firstRunComplete==false
    set fastMode==false

    for /f "tokens=* delims=: " %%G in (variables.txt) do set %%G

    title Console - Saru's SPT Auto Start Script



:dev_checkforkey
    cd dev> nul
    if exist sarushinobie.debugkey set devMode==true && echo: && echo: && echo Developer Mode Enabled. && echo: && echo:
    cd %modFolderDirectory%



:disclaimer_legal_code
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



:tempscripts_create 
    echo Creating Temp Scripts...
    rem long and brute script to delete vbs scripts in all the directories they're made in - too many.
    :tempscripts_create_tmpfilekiller
        echo @echo off> tmpkiller.bat
        echo set /a counter^=0 ^&^& cscript /nologo TMPsleep.vbs "1000">> tmpkiller.bat
        echo ^:check>> tmpkiller.bat
        echo wmic process where name^="cmd.exe" ^| find "cmd.exe" /c^> TMPcmdinstances.txt>> tmpkiller.bat
        echo cls ^&^& echo Checks Performed^: %%counter%% ^&^& echo Don't close this window, it will close itself.>> tmpkiller.bat
        echo set /p cmdinstances= ^< TMPcmdinstances.txt>> tmpkiller.bat
        echo cscript /nologo TMPsleep.vbs "1000">> tmpkiller.bat
        echo if %%cmdinstances%% leq 1 ^(>> tmpkiller.bat
        echo    del TMPserverinstances.txt ^&^& del TMPvariablereplace.vbs ^&^& del TMPloadingwheel.vbs ^&^& del TMPshortcutscript.vbs ^&^& del TMPvariablereformat.vbs ^&^& del TMPservershortcutscript.vbs ^&^& del TMPsleep.vbs ^&^& del TMPcmdinstances.txt>> tmpkiller.bat
        echo    cd /D %%~dp0 ^&^& cd .. ^&^& cd .. ^&^& cd .. ^&^& del TMPservershortcutscript.vbs ^&^& del TMPsleep.vbs ^&^& cd /D %%~dp0>> tmpkiller.bat
        echo    cd EscapeFromTarkov_Data ^&^& del TMPsleep.vbs>> tmpkiller.bat
        echo    ^(goto^) ^2^>nul ^& del "%%~f0" ^& exit>> tmpkiller.bat
        echo ^)>> tmpkiller.bat
        echo set /a counter^=counter+1 ^&^& goto ^:check>> tmpkiller.bat



    :tempscripts_create_sleep
        rem script to pause, designed to replace timeout command to avoid dropping nul files to hide cmd prompt messages and NOT TRIGGER VIRUSTOTAL??
        echo WScript.Sleep WScript.Arguments^(0^)> TMPsleep.vbs

        echo  ^| Created temporary pause script one.
        cscript /nologo TMPsleep.vbs "20"

        cd .. && cd .. && cd ..
        echo WScript.Sleep WScript.Arguments^(0^)> TMPsleep.vbs

        cd EscapeFromTarkov_Data
        echo WScript.Sleep WScript.Arguments^(0^)> TMPsleep.vbs
        cd %modFolderDirectory%

        echo  ^| Created temporary pause script two.
        cscript /nologo TMPsleep.vbs "10"



    :tempscripts_create_shortcutcreation
        rem creates shortcut to this file and sends it to the desktop.
        echo dynamicDirectory = CreateObject^("Scripting.FileSystemObject"^).GetParentFolderName^(WScript.ScriptFullName^)> TMPshortcutscript.vbs
        echo Set WshShell = CreateObject^("WScript.Shell"^)>> TMPshortcutscript.vbs
        echo strDesktopPath = WshShell.SpecialFolders^("Desktop"^)>> TMPshortcutscript.vbs
        echo Set objShortcutUrl = WshShell.CreateShortcut^(strDesktopPath ^& "\SinglePlayerTarkov.lnk"^)>> TMPshortcutscript.vbs
        echo objShortcutUrl.TargetPath = dynamicDirectory ^& "\start.bat">> TMPshortcutscript.vbs
        echo objShortcutUrl.Description = "Start SPT">> TMPshortcutscript.vbs
        echo objShortcutUrl.IconLocation = dynamicDirectory ^& WScript.Arguments^(0^)>> TMPshortcutscript.vbs
        echo objShortcutUrl.Save>> TMPshortcutscript.vbs

        echo  ^| Created temporary shortcut creation script.
        cscript /nologo TMPsleep.vbs "10"



    :tempscripts_create_variablereplacestring_unused
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
        cscript /nologo TMPsleep.vbs "10"



    :tempscripts_create_variablereformat_unused
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
        cscript /nologo TMPsleep.vbs "10"



    :tempscripts_create_loadingwheel
        rem script behind the loading progress animation... not used enough. looks good. use more. 
        echo WScript.StdOut.Write^(chr^(8^) ^& chr^(8^) ^& chr^(8^) ^& chr^(8^) ^& chr^(8^) ^& chr^(8^) ^& chr^(8^) ^& chr^(8^) ^& chr^(8^) ^& chr^(8^) ^& chr^(8^) ^& chr^(8^) ^& WScript.Arguments^(0^)^)> TMPloadingwheel.vbs
        
        echo  ^| Created temporary loading wheel ^(#2^) script.
        cscript /nologo TMPsleep.vbs "20"



    :tempscripts_create_end
        echo:
        echo All scripts have been saved.
        echo:



:tempscripts_tmpkiller_start
    rem starts tmpkiller.bat
    @start /min tmpkiller.bat && echo Started temporary script cleaner.
    cscript /nologo TMPsleep.vbs "20"



:variablefile_check
    rem checks for variables.txt file... not very much point right now?
    rem all checks seem to work okay without any intervention. leaving as a just-in-case.
    cd %modFolderDirectory%
    if exist variables.txt (
        echo Retrieving saved settings...
        echo:
        goto :disclaimer_legal_console
    ) else if NOT exist variables.txt (
        echo No saved variables detected, starting setup process...
        echo:
        goto :disclaimer_legal_console
    )



:disclaimer_legal_console
    rem skips disclaimer if dev mode is on & if first run is complete skip delays
    if %devMode%==true  goto :variablefile_startbuild
    cscript /nologo TMPsleep.vbs "500"
        cls
        echo:
        echo:
        echo:
        echo ============================================================
        echo:
        echo Start Script SETUP - Copyright^(C^) ^2023 - SaruShinobie
        echo:
        echo This program comes with ABSOLUTELY NO WARRANTY.
        echo This is free software, and you are welcome to redistribute it
        echo under certain conditions detailed in the GNUPL Version 3.0 ^(link below.^)
        echo You can view this document at ^(https://www.gnu.org/licenses/gpl-3.0^),
        echo or, in the 'LICENSE' file included with this program.
        echo:
        echo ============================================================

    
    if %firstRunComplete%==true (
        cscript /nologo TMPsleep.vbs "1200"
        cls
        goto :disclaimer_bugs_console
    )

    cscript /nologo TMPsleep.vbs "3500"
    pause
    cls
    goto :disclaimer_bugs_console



:disclaimer_bugs_console
    if %devMode%==true  goto :variablefile_startbuild
        echo:
        echo:
        echo:
        echo ============================================================
        echo:
        echo Start Script SETUP - Copyright^(C^) ^2023 - SaruShinobie
        echo:
        echo This is version *2.0.0,* the second official release of this program.
        echo If you encounter bugs or workarounds, you can email me or message me on Discord.
        echo:
        echo The process will be much easier if you're prepared with your list of
        echo mods ^(text or screenshot^), and a quick, clear description of your issue.
        echo:
        echo Email - sarushinobie@gmail.com 
        echo Discord - SaruShinobie#8639  ^(**FASTER^)
        echo:
        echo ============================================================

    if %firstRunComplete%==true (
        cscript /nologo TMPsleep.vbs "1200"
        cls
        goto :variablefile_startbuild
    )

    cscript /nologo TMPsleep.vbs "5000"
    pause
    cls
    goto :variablefile_startbuild



:variablefile_startbuild
    rem points to the folder that the batch file is in, and goes up three folders in the path to get to the spt root folder.
    rem essentially, C:/spt/user/mods/startscriptmodfolder
    rem                  ^  batch file here ^
    rem       point here ^
    if exist variables.txt goto :verify_directory

    cd /D %modFolderDirectory%
        echo ; This file contains your saved settings. If you plan on modifying this, just ensure that you format it correctly.> variables.txt
        echo ; For example; "thisSettingIsStupid=yourValueHere">> variables.txt
        echo ;>> variables.txt
        echo ; vv variables below vv>> variables.txt
        echo ;>> variables.txt
        echo modFolderDirectory=%modFolderDirectory%>> variables.txt
        echo installFolderDirectory=%installFolderDirectory%>> variables.txt



:verify_directory
    cd %installFolderDirectory%
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
        echo ============================================================
        echo:
        goto :script_end_error
    )
    echo: && echo Pointing to "%cd%" && echo:
    cscript /nologo TMPsleep.vbs "10"
    echo Valid directory found.
    cscript /nologo TMPsleep.vbs "90"



:verify_serverfile
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
        echo ============================================================
        echo:
        goto :script_end_error
    )
    echo Valid server file found.
    cscript /nologo TMPsleep.vbs "90"



:verify_launcherfile
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
        echo ============================================================
        echo:
        goto :script_end_error
    )
    echo Valid launcher file found.
    cscript /nologo TMPsleep.vbs "90"



:verify_datafiles
    rem uses the data files in EscapeFromTarkov_Data and their numbering to check if the install is legit.
    rem uses a random number generator to pick a number between the first and last data file numbers and checks if the two files picked exist in the user's directory.
    rem some file numbers are just... skipped. because BSG. Two checks are necessary because of it, to prevent false flags.
    echo:
    echo Picking random files...
    cd %installFolderDirectory%
    set /a randomnumber1=%random% %%400
    set tarkovfile1=sharedassets%randomnumber1%.assets

    set /a randomnumber2=%random% %%400
    set tarkovfile2=sharedassets%randomnumber2%.assets

    echo  ^| %tarkovfile1% is your first random file.
    cscript /nologo TMPsleep.vbs "20"
    echo  ^| %tarkovfile2% is your second random file.
    cscript /nologo TMPsleep.vbs "20"
    echo Checking that files exist...

    cd EscapeFromTarkov_Data

    if not exist %tarkovfile1% (
        echo  ^| First check failed. ^(%tarkovfile1%^)
        set /a filecheck1=0
        cscript /nologo TMPsleep.vbs "20"
    )
    if exist %tarkovfile1% (
        echo  ^| First check passed. ^(%tarkovfile1%^)
        set /a filecheck1=1
        cscript /nologo TMPsleep.vbs "20"
    )
    if not exist %tarkovfile2% (
        echo  ^| Second check failed. ^(%tarkovfile2%^)
        set /a filecheck2=0
        cscript /nologo TMPsleep.vbs "20"
        )
    if exist %tarkovfile2% (
        set /a filecheck2=1
        echo  ^| Second check passed. ^(%tarkovfile2%^)
        cscript /nologo TMPsleep.vbs "20"
    )

    set /a filecheck_total=filecheck1+filecheck2
    if %filecheck_total%==0 (
        cls
        title Console - Saru's SPT Auto ^Start Script - *ERROR, SERVER*
        echo Could not find Escape from Tarkov data files.
        echo:
        echo Check that your have SPT and a legitimate copy of EFT installedm
        echo and that your mod folder is placed in the correct install directory.
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
        echo Random file 1: %tarkovfile1%
        echo Random file 2: %tarkovfile2%
        echo Exit code %errorlevel%, Error 04 - Install Check Failed.
        echo:
        echo ============================================================
        echo:
        goto :script_end_error
    )

    cd %modFolderDirectory%

    echo Files found. Install is legitimate.
    echo:
    echo:
    cscript /nologo TMPsleep.vbs "90"



:desktopshortcut_userprompt
    if %desktopQuestionAnswered%==true goto :fastmode_userprompt
    rem create desktop shortcut.
    echo **WOULD YOU LIKE TO CREATE A SHORTCUT TO SPT ON YOUR DESKTOP?**
    echo:
    echo This program can send a shortcut to itself to your desktop,
    echo so you can start Tarkov as easily as possible.
    echo This will not show up on any other user's desktops on your device.
    echo:
    echo Answer 'LIGHT' for an icon better for dark desktops, 'DARK' for light desktops,
    echo or answer 'SKIP' to not create a shortcut. This is not case sensitive.
    echo:
    :choice2
        set choice2=
        set /p choice2=Would you like to create a desktop shortcut to Single Player Tarkov? Answer with 'LIGHT', 'DARK', and 'SKIP'. 
        if /I %choice2%==light (
            echo desktopQuestionAnswered=true>> variables.txt
            echo:
            echo Creating shortcut...
            cd %modFolderDirectory%
            cscript /nologo TMPshortcutscript.vbs "/res/logoLight.ico"
            cscript /nologo TMPsleep.vbs "800"
            cd %modFolderDirectory%
            goto :fastmode_userprompt
        )
        if /I %choice2%==dark (
            echo desktopQuestionAnswered=true>> variables.txt
            echo:
            echo Creating shortcut...
            cd %modFolderDirectory%
            cscript /nologo TMPshortcutscript.vbs "/res/logoDark.ico"
            cscript /nologo TMPsleep.vbs "800"
            cd %modFolderDirectory%
            goto :fastmode_userprompt
        )
        if /I %choice2%==skip (
            echo desktopQuestionAnswered=true>> variables.txt
            echo A shortcut will not be created.
            cd %modFolderDirectory%
            goto :fastmode_userprompt
        )
        echo Your answer was invalid. You can enter 'LIGHT', 'DARK', or 'SKIP'. Please try again.
        pause
        cls
        goto :desktopshortcut_userprompt



:fastmode_userprompt
    if %fastmodeQuestionAnswered%==true goto :startup_begin
    if %devMode%==false cscript /nologo TMPsleep.vbs "1000"
    echo:
    echo ============================================================
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
            echo fastModeQuestionAnswered=true>> variables.txt
            echo fastMode=true>> variables.txt
            echo:
            echo Variables saved. Fast mode will be enabled next time you run the program.
            goto :startup_begin
        )
        if /I %choice3%==n (
            echo fastModeQuestionAnswered=true>> variables.txt
            echo fastMode=false>> variables.txt
            echo Variables saved. Fast mode will not be enabled.
            echo:
            goto :startup_begin
        )
        echo Your answer was invalid. You can enter 'Y' for yes or 'N' for no.
        echo:
        pause
        cls
        goto :fastmode_userprompt



:startup_begin
    rem start server, use shortcut so it starts minimized.
    rem netstat program writes to nul file... so using a sleep script is kinda stupid now. maybe fix? maybe not?
    rem added check to skip the startup process if the server is already up.
    echo:
    echo ============================================================

    cd %installFolderDirectory%



:alreadyrunning_check
    wmic process where name="Aki.Server.exe" | find "Aki.Server.exe" /c> TMPserverinstances.txt
    set /p serverinstances= < TMPserverinstances.txt
    wmic process where name="Aki.Launcher.exe" | find "Aki.Launcher.exe" /c> TMPlauncherinstances.txt
    set /p launcherinstances= < TMPlauncherinstances.txt
    del TMPlauncherinstances.txt
    del TMPserverinstances.txt

    set /a programinstances=serverinstances+launcherinstances

    if %programinstances%==0 echo ^^^^ 'No Instances Available' MESSAGES ARE GOOD.



:alreadyrunning_userprompt
    if %programinstances%==0 goto :startup_server
    echo:
    echo Preexisting server and/or launcher instances detected, proceeding will close them.
    set choice4=
    set /p choice4=Would you like to continue? Any running instances of the game server/launcher will be closed. [Y/N] 
    if /I %choice4%==y (
        goto :alreadyrunning_close_server
    )
    if /I %choice4%==n (
        Applications will not be closed. This window will close in a moment.
        cscript //nologo TMPsleep.vbs "4000"
        goto :script_end_clean
    )
    echo Your answer was invalid. You can enter 'Y' for yes or 'N' for no.
    echo:
    pause
    cls
    goto :alreadyrunning_userprompt



:alreadyrunning_close
    echo Closing instances and proceeding...
        :alreadyrunning_close_server
            cscript //nologo TMPsleep.vbs "100"
            taskkill /F /IM Aki.Server.exe> nul
            wmic process where name="Aki.Server.exe" | find "Aki.Server.exe" /c> TMPserverinstances.txt
            set /p serverinstances= < TMPserverinstances.txt
            if %serverinstances% gtr 0 goto :alreadyrunning_close_server

        :alreadyrunning_close_launcher
            cscript //nologo TMPsleep.vbs "100"
            taskkill /F /IM Aki.Launcher.exe> nul
            wmic process where name="Aki.Launcher.exe" | find "Aki.Launcher.exe" /c> TMPlauncherinstances.txt
            set /p launcherinstances= < TMPlauncherinstances.txt
            if %launcherinstances% gtr 0 goto :alreadyrunning_close_launcher

    echo All running instances closed. Beginning startup...



:startup_server
    cd %installFolderDirectory%
    cscript //nologo TMPsleep.vbs "1000"
    echo:
    echo Starting Server ^(Aki.Server.exe^)...
    @start Aki.Server.exe

    cd %modFolderDirectory%

    cscript //nologo TMPsleep.vbs "900"



:loadingwheel_start
    rem loading animation.
    cscript //nologo TMPloadingwheel.vbs "Loading... \" 
        cscript //nologo TMPsleep.vbs "250"
    cscript //nologo TMPloadingwheel.vbs "Loading... |"
        cscript //nologo TMPsleep.vbs "250"
    cscript //nologo TMPloadingwheel.vbs "Loading... /"
        cscript //nologo TMPsleep.vbs "250"
    cscript //nologo TMPloadingwheel.vbs "Loading... -"
        cscript //nologo TMPsleep.vbs "250"
    netstat -o -n -a | findstr 6969 >nul 2>&1 && if %ERRORLEVEL%==0 goto :loadingwheel_end
    goto :loadingwheel_start



:loadingwheel_end
    cscript //nologo TMPloadingwheel.vbs "Loading done"
    echo:
    echo Server started.



:startup_launcher
    cd %installFolderDirectory%
    echo Starting launcher ^(Aki.Launcher.exe^)...
    @start Aki.Launcher.exe
    cscript //nologo TMPsleep.vbs "5000"

    echo Launcher started.



:endstartup
    cd %modFolderDirectory%
    echo:
    echo All processes finished.



:finalsplashscreen
    if %firstRunComplete%==false (
        echo firstRunComplete=true>> variables.txt
    )
    rem a value of *1* in the timer var (below) is equal to *half a second (0.5s)* in the splashscreen loop
    set /a splashscreen_timer=10

    rem ascii splash art - happy playing
    rem i promise it looks better in the console.
    :splashscreen_0
        cls
        echo:
        echo ===================================================================================================================
        echo:
        echo:
        echo:
        echo:
        echo:
        echo:
        echo:
        echo:
        echo:
        echo ===================================================================================================================
        echo:
        echo Server and Launcher should both be up and running, this window will automatically close in a moment.
        echo All that's left now is for you to press play in the launcher and enjoy the game! :^)
        if %devMode%==true echo timer value: %splashscreen_timer%

        set /a splashscreen_timer=splashscreen_timer-1
        cscript /nologo TMPsleep.vbs "500"

        goto :splashscreen_1

    :splashscreen_1
        cls
        echo:
        echo ===================================================================================================================
        echo:
        echo   _    _            _____   _____ __     __
        echo  ^| ^|  ^| ^|    /\    ^|  __ \ ^|  __ \\ \   / /
        echo  ^| ^|__^| ^|   /  \   ^| ^|__^) ^|^| ^|__^) ^|\ \_/ /
        echo  ^|  __  ^|  / /\ \  ^|  ___/ ^|  ___/  \   /
        echo  ^| ^|  ^| ^| / ____ \ ^| ^|     ^| ^|       ^| ^|
        echo  ^|_^|  ^|_^|/_/    \_\^|_^|     ^|_^|       ^|_^|
        echo:
        echo:
        echo ===================================================================================================================
        echo:
        echo Server and Launcher should both be up and running, this window will automatically close in a moment.
        echo All that's left now is for you to press play in the launcher and enjoy the game! :^)
        if %devMode%==true echo timer value: %splashscreen_timer%

        set /a splashscreen_timer=splashscreen_timer-1
        cscript /nologo TMPsleep.vbs "500"

        goto :splashscreen_2

    :splashscreen_2
        cls
        echo:
        echo ===================================================================================================================
        echo:
        echo   _    _            _____   _____ __     __  _____   _             __     __ _____  _   _   _____  _ 
        echo  ^| ^|  ^| ^|    /\    ^|  __ \ ^|  __ \\ \   / / ^|  __ \ ^| ^|         /\ \ \   / /^|_   _^|^| \ ^| ^| / ____^|^| ^|
        echo  ^| ^|__^| ^|   /  \   ^| ^|__^) ^|^| ^|__^) ^|\ \_/ /  ^| ^|__^) ^|^| ^|        /  \ \ \_/ /   ^| ^|  ^|  \^| ^|^| ^|  __ ^| ^|
        echo  ^|  __  ^|  / /\ \  ^|  ___/ ^|  ___/  \   /   ^|  ___/ ^| ^|       / /\ \ \   /    ^| ^|  ^| . ` ^|^| ^| ^|_ ^|^| ^|
        echo  ^| ^|  ^| ^| / ____ \ ^| ^|     ^| ^|       ^| ^|    ^| ^|     ^| ^|____  / ____ \ ^| ^|    _^| ^|_ ^| ^|\  ^|^| ^|__^| ^|^|_^|
        echo  ^|_^|  ^|_^|/_/    \_\^|_^|     ^|_^|       ^|_^|    ^|_^|     ^|______^|/_/    \_\^|_^|   ^|_____^|^|_^| \_^| \_____^|^(_^)
        echo:
        echo:
        echo ===================================================================================================================
        echo:
        echo Server and Launcher should both be up and running, this window will automatically close in a moment.
        echo All that's left now is for you to press play in the launcher and enjoy the game! :^)
        if %devMode%==true echo timer value: %splashscreen_timer%

        set /a splashscreen_timer=splashscreen_timer-2
        cscript /nologo TMPsleep.vbs "1000"
        if %splashscreen_timer% leq 0 goto :script_end_clean

        goto :splashscreen_0




:script_end_clean
    exit



:script_end_error
    echo Encountered error, press any key to close the window.
    cscript /nologo TMPsleep.vbs "3000"
    pause
    exit
