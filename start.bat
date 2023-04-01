@echo off

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

:startofssetup
    for /f "tokens=* eol=; delims==" %%G in (variables.txt) do set %%G

    title Console - Saru's SPT Auto Start Script SETUP

    if exist variables.txt (
        echo Retrieving saved settings...
        echo:
        goto :startofscript
    )

:disclaimer
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
    echo ==============================
    
    @timeout /t 4 >nul 2>&1

    echo:
    echo This is version 1.0, the first proper release of this program.
    echo If you encounter bugs or workarounds, you can email me or message me on Discord.
    echo:
    echo Email - sarushinobie@gmail.com 
    echo Discord - SaruShinobie#8639  ^(**FASTER^)
    echo:
    echo ==============================
    echo:

    @timeout /t 4 >nul 2>&1

    goto :setupstart

:setupstart
    echo This guide will walk you through entering your SPT install directory, drive type,
    echo and changing the proper settings to get the startup script working smoothly. 
    echo:
    echo This shouldn't take more than a minute or two.
    echo:
    echo ==============================
    echo:

    pause
    goto :q1directory

:q1directory
    cls
    title Console - Saru's SPT Auto ^Start Script SETUP
    echo:
    echo ==============================
    echo:
    echo **DIRECTORY**
    echo:
    echo Enter the filepath of your SPT install here. It should contain 
    echo "Aki.Server.exe" and "Aki.Launcher.exe"
    echo:
    echo To get the directory of your root folder, find and open your SPT folder
    echo and copy the folder path from the top bar of the file explorer. 
    echo For example; "C:Windows/Program Files/SinglePlayerTarkov"
    echo:
    echo DO NOT LEAVE A TRAILING SLASH.
    echo:
    echo **PROCEEDING WILL DELETE ANY PREVIOUS SAVED SETTINGS.**
    echo:
    set /p userdirectory="Enter your SPT install directory here: "
        rem directory and server file check
            cd %userdirectory%
            if errorlevel 1 (
                cls
                title Console - Saru's SPT Auto ^Start Script SETUP - *ERROR, COULDN'T OPEN DIRECTORY*
                echo Couldn't open the directory.
                echo Check that you typed or copied the correct file path, and that the folder contains your SPT install. 
                echo Also ensure that you didn't include a trailing slash at the end of your directory.
                echo          __ && echo   _     / / && echo  ^(_^)   / /  && echo       / /   && echo   _  / /    && echo  ^(_^)/ /     && echo    /_/ 
                echo:
                echo:
                pause
                cls
                goto :q1directory
            )
            if not exist Aki.Server.exe (
                cls
                title Console - Console - Saru's SPT Auto Start Script SETUP - *ERROR, COULDN'T ^FIND FILE* 
                echo The directory you inputted does not contain the 'Aki.Server.exe' file. 
                echo Check that you typed or copied the correct file path, and that the folder contains your SPT install.
                rem ascii art
                echo          __ && echo   _     / / && echo  ^(_^)   / /  && echo       / /   && echo   _  / /    && echo  ^(_^)/ /     && echo    /_/ 
                echo:
                echo:
                pause
                cls
                goto :q1directory
            )
        rem trailing slash check
            if "%userdirectory:~-1%"=="/" (
                cls
                title Console - Saru's SPT Auto ^Start Script SETUP - *ERROR, INAPPROPRIATE USER INPUT*
                echo You entered an answer with a trailing slash.
                echo:
                echo When entering a directory, it should not end in a backwards or forwards slash.
                echo "eg. C:/Windows/Program Files/SinglePlayerTarkov/"
                echo                                    problem here ^^
                echo:
                echo Also check that you typed or copied the correct file path, and that the folder contains your SPT install.
                echo          __ && echo   _     / / && echo  ^(_^)   / /  && echo       / /   && echo   _  / /    && echo  ^(_^)/ /     && echo    /_/ 
                echo:
                if exist Aki.Server.exe echo The directory you entered was valid; it contains your server file and Tarkov data. && echo Just reenter the previous directory without a trailing slash.
                echo:
                pause
                cls
                goto :q1directory
            ) else if "%userdirectory:~-1%"=="\" (
                cls
                title Console - Saru's SPT Auto ^Start Script SETUP - *ERROR, INAPPROPRIATE USER INPUT*
                echo You entered an answer with a trailing slash.
                echo:
                echo When entering a directory, it should not end in a backwards or forwards slash.
                echo "eg. C:/Windows/Program Files/SinglePlayerTarkov/"
                echo                                    problem here ^^
                echo:
                echo Also check that you typed or copied the correct file path, and that the folder contains your SPT install.
                echo          __ && echo   _     / / && echo  ^(_^)   / /  && echo       / /   && echo   _  / /    && echo  ^(_^)/ /     && echo    /_/ 
                echo:
                if exist Aki.Server.exe echo The directory you entered was valid; it contains your server file and Tarkov data. && echo Just reenter the previous directory without a trailing slash.
                echo:
                pause
                cls
                goto :q1directory
            )

        set modFolderDirectory=%userdirectory%/user/mods/SaruShinobie-StartScript
        cd %modFolderDirectory%
        
        if exist variables.txt (
            del variables.txt
        )

        @timeout /t 2 >nul 2>&1

        echo ;This file contains the settings entered during the setup process, initiated by running setup.bat> variables.txt
        @timeout /t 1 >nul 2>&1
        echo directory*%userdirectory%>> variables.txt
        echo modFolderDirectory*%modFolderDirectory%>> variables.txt
        echo ;>> variables.txt
        goto :q2storagedrive

:q2storagedrive
    cls
    echo:
    echo ==============================
    echo:
    echo **STORAGE DRIVE PRESET**
    echo:
    echo Here you have the option of entering a storage drive type.
    echo This adjusts the startup timers to ensure they work on slower drives.
    echo If your install is located on an SSD, setting this appropriately 
    echo will result in a faster process overall.
    echo Skipping will use the HDD preset as a default.
    echo:
    echo Accepted inputs are 'hdd' 'ssd' 'custom' and 'skip'
    echo:
    :choice1
        set choice1=
            set /p choice1=Is your SPT install located on a Hard Drive, SSD, or would you like to enter custom times? You can also skip. 
            if %choice1%==hdd (
                echo driveType*%choice1%>> variables.txt
                echo useCustomTimes*false>> variables.txt
                echo ;>> variables.txt
                @timeout /t 1 >nul 2>&1
                echo serverStartTimeHDD*20>> variables.txt
                echo launcherStartTimeHDD*5>> variables.txt
                echo ;>> variables.txt
                @timeout /t 1 >nul 2>&1
                goto :q4shortcut
                )
            if %choice1%==ssd (
                echo driveType*%choice1%>> variables.txt
                echo useCustomTimes*false>> variables.txt
                echo ;>> variables.txt
                @timeout /t 1 >nul 2>&1
                echo serverStartTimeSSD*10>> variables.txt
                echo launcherStartTimeSSD*4>> variables.txt
                echo ;>> variables.txt
                @timeout /t 1 >nul 2>&1
                goto :q4shortcut
                )
            if %choice1%==skip (
                echo driveType*%choice1%>> variables.txt
                echo useCustomTimes*false>> variables.txt
                echo ;>> variables.txt
                @timeout /t 1 >nul 2>&1
                echo serverStartTimeHDD*20>> variables.txt
                echo launcherStartTimeHDD*5>> variables.txt
                echo ;>> variables.txt
                @timeout /t 1 >nul 2>&1
                goto :q4shortcut
                )
            if %choice1%==custom goto :q3customtimes
            echo:
            echo Your answer was invalid. You can enter 'hdd' 'ssd' 'custom' or 'skip'
            echo This is case sensitive, type in lowercase.
            echo:
            pause
            goto :q2storagedrive

:q3customtimes
    cls
    echo:
    echo ==============================
    echo:
    echo **CUSTOM TIMES**
    echo:
    echo Here you can enter custom startup times for the server and launcher.
    echo the default for HDD's is ^20 seconds for the server and ^5 for the launcher.
    echo Enter a number greater than zero. Zero and negative numbers will not be accepted.
    echo:
    echo You can enter 'skip' again to go back to the preset selection page.
    echo:
    goto :q3a

:q3a
    set choice2=
        set /p choice2="Start by entering your server launch time here: "
            if %choice2%==skip goto :q2storagedrive
            if %choice2% gtr 0 (
                goto :q3b 
            )
            if %choice2% leq 0 (
                echo:
                echo Your answer was invalid. You can enter any integer/number above ^0, or
                echo enter 'skip' to return to the previous question.
                echo This is case sensitive, type in lowercase. 
                echo:
                pause
                goto :q3customtimes
            )

:q3b
    set choice3=
        set /p choice3="Now enter your launcher time: "
            if %choice3%==skip goto :q2storagedrive
            if %choice3% gtr 0 (
                echo Working...
                echo driveType=custom>> variables.txt
                echo ;>> variables.txt
                    @timeout /t 1 >nul 2>&1
                echo serverStartTimeCustom*%choice2%>> variables.txt
                echo launcherStartTimeCustom*%choice3%>> variables.txt
                echo ;>> variables.txt
                    @timeout /t 1 >nul 2>&1
                echo Set drive type to custom.
            )
            if %choice3% leq 0 (
                echo:
                echo Your answer was invalid. You can enter any integer/number above ^0, or
                echo enter 'skip' to return to the previous question.
                echo This is case sensitive, type in lowercase. 
                echo:
                pause
                goto :q3customtimes
            )
    echo Working...
    echo useCustomTimes*true>> variables.txt
    @timeout /t 1 >nul 2>&1
    echo Using custom times.

:q4shortcut
    echo:
    echo ==============================
    echo:
    echo **WOULD YOU LIKE TO CREATE A SHORTCUT TO SPT ON YOUR DESKTOP?**
    echo:
    echo This program can send a shortcut to itself to your desktop,
    echo so you can start Tarkov as easily as possible.
    echo This will not show up on any other user's desktops on your device.
    echo:
    :choice4
        set choice4=
        set /p choice4=Would you like to create a desktop shortcut to Single Player Tarkov? [Y/N] 
        if %choice4%==y (
            echo:
            echo Creating shortcut...
            echo dynamicDirectory = CreateObject^("Scripting.FileSystemObject"^).GetParentFolderName^(WScript.ScriptFullName^)> TMPshortcutscript.vbs
            echo Set WshShell = CreateObject^("WScript.Shell"^)>> TMPshortcutscript.vbs
            echo strDesktopPath = WshShell.SpecialFolders^("Desktop"^)>> TMPshortcutscript.vbs
            echo Set objShortcutUrl = WshShell.CreateShortcut^(strDesktopPath ^& "\SinglePlayerTarkov.lnk"^)>> TMPshortcutscript.vbs
            echo objShortcutUrl.TargetPath = dynamicDirectory ^& "\start.bat">> TMPshortcutscript.vbs
            echo objShortcutUrl.Description = "Start SPT">> TMPshortcutscript.vbs
            echo objShortcutUrl.IconLocation = dynamicDirectory ^& "\logo.ico">> TMPshortcutscript.vbs
            echo objShortcutUrl.Save>> TMPshortcutscript.vbs
            @timeout /t 1 >nul 2>&1
            cscript /nologo TMPshortcutscript.vbs
            @timeout /t 1 >nul 2>&1
            del TMPshortcutscript.vbs
            goto :finaltweaks
        )
        if %choice4%==n (
            echo A shortcut will not be created.
            goto :finaltweaks
        )
        echo Your answer was invalid. You can enter 'y' for yes or 'n' for no.
        echo This is case sensitive, type in lowercase.
        pause
        cls
        goto :q4shortcut

:finaltweaks
    echo:
    echo Making final tweaks...
        echo ;>> variables.txt
        @timeout /t 1 >nul 2>&1
    echo showErrors*false>> variables.txt
        @timeout /t 1 >nul 2>&1
        echo ;>> variables.txt
        @timeout /t 1 >nul 2>&1
    echo firstRunComplete*false>> variables.txt
        @timeout /t 1 >nul 2>&1
        echo ;>> variables.txt
        @timeout /t 1 >nul 2>&1
    echo fastMode*false>> variables.txt
        echo ;>> variables.txt
        @timeout /t 1 >nul 2>&1
    echo ; When you modify these variables directly through this file, enter your values after the equal sign.>> variables.txt
        @timeout /t 1 >nul 2>&1
    echo ; eg. "loveYourselfEveryday=true" when "true" is your desired value>> variables.txt
        @timeout /t 1 >nul 2>&1
    goto :replaceequalsigns

:replaceequalsigns
    rem replace * with = in variables file
    echo Set objFS = CreateObject^("Scripting.FileSystemObject"^)>> TMPequalsignreplace.vbs
    echo strFile = "variables.txt">> TMPequalsignreplace.vbs
    echo Set objFile = objFS.OpenTextFile^(strFile^)>> TMPequalsignreplace.vbs
    echo Do Until objFile.AtEndOfStream>> TMPequalsignreplace.vbs
    echo strLine = objFile.ReadLine>> TMPequalsignreplace.vbs
    echo If InStr^(strLine,"*"^)^> 0 then>> TMPequalsignreplace.vbs
    echo strLine = Replace^(strLine,"*","="^)>> TMPequalsignreplace.vbs
    echo End If>> TMPequalsignreplace.vbs
    echo WScript.Echo strLine>> TMPequalsignreplace.vbs
    echo Loop>> TMPequalsignreplace.vbs

        cscript /nologo TMPequalsignreplace.vbs  > variablestmp
        @timeout /t 1 >nul 2>&1
        del variables.txt
        del TMPequalsignreplace.vbs
        @timeout /t 1 >nul 2>&1
        ren variablestmp variables.txt
        echo All variables saved.
        echo:

:endsetup
    echo:
    echo ==============================
    echo:
    echo **SETUP COMPLETE!**
    echo:
    echo Now, whenever you're ready, you can run this program again to start SPT.
    echo You will also have the option to run it now, through the prompt below.
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
        @timeout /t 1 >nul 2>&1
    :startprogramprompt
        echo:
        SET /P c=Would you like to start the program now (Y), or ^exit the program and ^start the game ^at a later ^time (N)? [Y/N]
        echo:
        if /I "%c%" EQU "Y" cls && goto :startofscript
        if /I "%c%" EQU "N" cls && goto :endofscript
        echo: && echo Invalid answer. You can respond with 'Y' for yes, and 'N' for no. This is not case sensitive. && echo:
        goto :startprogramprompt

rem SEAM BETWEEN PROGRAMS
rem at this point, the old 'setup.bat'
rem and 'startup.bat' files are joined.

:startofscript
    rem THIS DEFINES ALL VARIABLES. **VERY IMPORTANT THAT THIS RUNS.
    for /f "tokens=* eol=; delims==" %%G in (variables.txt) do set %%G
    if %fastMode%==true (
        if %firstRunComplete%==true (
        set noDelays==true
        cls
        goto :startmsg
        )
    )
    set noDelays==false

    rem make sure all variables are in correct format
    echo Set objFS = CreateObject^("Scripting.FileSystemObject"^)>> TMPequalsignreplace.vbs
    echo strFile = "variables.txt">> TMPequalsignreplace.vbs
    echo Set objFile = objFS.OpenTextFile^(strFile^)>> TMPequalsignreplace.vbs
    echo Do Until objFile.AtEndOfStream>> TMPequalsignreplace.vbs
    echo strLine = objFile.ReadLine>> TMPequalsignreplace.vbs
    echo If InStr^(strLine,"*"^)^> 0 then>> TMPequalsignreplace.vbs
    echo strLine = Replace^(strLine,"*","="^)>> TMPequalsignreplace.vbs
    echo End If>> TMPequalsignreplace.vbs
    echo WScript.Echo strLine>> TMPequalsignreplace.vbs
    echo Loop>> TMPequalsignreplace.vbs

        cscript /nologo TMPequalsignreplace.vbs  > variablestmp
        @timeout /t 1 >nul 2>&1
        del variables.txt
        del TMPequalsignreplace.vbs
        @timeout /t 1 >nul 2>&1
        ren variablestmp variables.txt
        echo All variables saved.
        echo:

:disclaimer2
    echo ==============================
    echo:
    echo SPT-AKI Start Script - Copyright^(C^) ^2023 - SaruShinobie
    echo:
    echo This program comes with ABSOLUTELY NO WARRANTY.
    echo This is free software, and you are welcome to redistribute it
    echo under certain conditions detailed in the GNUPL Version 3.0 ^(link below.^)
    echo You can view this document at ^(https://www.gnu.org/licenses/gpl-3.0^),
    echo or, in the 'LICENSE' file included with this program.
    echo:
    echo This is version 1.0, the first proper release of this program.
    echo If you encounter bugs or workarounds, you can email me or message me on Discord.
    echo:
    echo Email - sarushinobie@gmail.com 
    echo Discord - SaruShinobie#8639  ^(**FASTER^)
    echo:
    echo ==============================
    echo:

:vanityoadingindicator
    title Console - Saru's SPT Auto ^Start Script v1.00 - Loading.     ^(3 Seconds Remaining^)
        @timeout /t 1 >nul 2>&1
    title Console - Saru's SPT Auto ^Start Script v1.00 - Loading. .   ^(2 Seconds Remaining^)
        @timeout /t 1 >nul 2>&1
    title Console - Saru's SPT Auto ^Start Script v1.00 - Loading. . . ^(1 Second Remaining^)
        @timeout /t 1 >nul 2>&1
    title Console - Saru's SPT Auto ^Start Script v1.00
    goto :startmsg
    rem this is a purely cosmentic 'loading' screen
    rem this is just to slow the script down to allow the user to read everything they need to
    rem pause can be disabled with fast mode enabled

:startmsg
    echo Start Script for SPT-AKI, by SaruShinobie
    echo:
    echo Startup times and directories can all be changed manually in the variables.txt file.
    rem ascii splash art
            rem yes, it looks weird. you have to escape special characters. looks better when the program is run.
            echo  _____ ______  _____             ___   _   __ _____ 
            echo /  ___^|^| ___ \^|_   _^|           / _ \ ^| ^| / /^|_   _^|
            echo \ `--. ^| ^|_/ /  ^| ^|    ______  / /_\ \^| ^|/ /   ^| ^|  
            echo  `--. \^|  __/   ^| ^|   ^|______^| ^|  _  ^|^|    \   ^| ^|  
            echo /\__/ /^| ^|      ^| ^|            ^| ^| ^| ^|^| ^|\  \ _^| ^|_ 
            echo \____/ \_^|      \_/            \_^| ^|_/\_^| \_/ \___/ 
    echo:
    echo Starting Single Player Tarkov ^(SPT^)...
    echo:
    if %noDelays%==false @timeout /t 2 >nul 2>&1

:directorycheck
    if "%directory%" == "" (
            echo **MAKE SURE TO RUN 'setup.bat' OR SET A DIRECTORY IN 'variables.txt' FOR THE BEST POSSIBLE EXPERIENCE.**
            echo:
            echo No saved directory detected, opening prompt...
            echo:
            goto :enterdir
    )
    if not "%directory%" == "" (
            echo:
            echo Previous directory found, skipping prompt.
            goto :savedpreset
    )

:enterdir
    if %noDelays%==false @timeout /t 3 >nul 2>&1
    title Console - Saru's SPT Auto ^Start Script
    echo:
    echo ==============================
    echo:
    echo To get the directory of your root folder, find and open your SPT folder
    echo and copy the folder path from the top bar of the file explorer. 
    echo For example; "C:Windows/Program Files/SinglePlayerTarkov."
    echo:
    echo **DO NOT LEAVE A TRAILING SLASH.**
    echo:
    set /p directory="Enter your SPT install directory here: "
    cd %directory%


:firsterrora
    rem first error scenario, not a valid directory
    if errorlevel 1 (
            cls
            title Console - Saru's SPT Auto ^Start Script - *ERROR, COULDN'T OPEN DIRECTORY*
            echo Couldn't open the directory.
            echo Check that you typed or copied the correct file path, and that the folder contains your SPT install. 
            echo Also ensure that you didn't include a trailing slash at the end of your directory.
            rem ascii art
            echo          __ && echo   _     / / && echo  ^(_^)   / /  && echo       / /   && echo   _  / /    && echo  ^(_^)/ /     && echo    /_/ 
            echo:
            if %showErrors%==1 (
                    echo You entered: "%directory%" as your directory.
                    echo Exit code %errorlevel%, Error 1a - Invalid Directory.
            )
            echo:
            echo ==============================
            echo:
            goto :enterdirloop
    )

:savedpreset
    title Console - Saru's SPT Auto ^Start Script
    cd %directory%
    echo:
    echo Pointing to "%directory%"
    echo:
    echo ==============================
    echo:
    if %noDelays%==false @timeout /t 2 >nul 2>&1

:firsterrorb
    rem invalid directory error no. 2
    rem second version for when the directory is read from variables.txt, slightly modified text and prompt to enter directory when error is called
    if errorlevel 1 (
            cls
            title Console - Saru's SPT Auto ^Start Script - *ERROR, COULDN'T OPEN DIRECTORY*
            echo The directory you inputted is either invalid, or doesn't exist.
            echo Check that you typed or copied the correct file path, and that the folder contains your SPT install. 
            echo Also ensure that you didn't include a trailing slash at the end of your directory.
            echo Press a key to close this window when ready.
            rem ascii art and error code
            echo          __ && echo   _     / / && echo  ^(_^)   / /  && echo       / /   && echo   _  / /    && echo  ^(_^)/ /     && echo    /_/ 
            echo:
            if %showErrors%==1 (
                    echo "%directory%" is the directory read from the "variables.txt" file
                    echo Exit code %errorlevel%, Error 1b - Invalid Directory.
            )
            echo:
            echo ==============================
            echo:
            goto :enterdirloop
    )

:seconderror
    rem error - cant find server file
    if not exist Aki.Server.exe (
    cls
    title Console - Saru's SPT Auto ^Start Script - *ERROR, COULDN'T OPEN FILE* 
    echo The directory you inputted does not contain the 'Aki.Server.exe' file. 
    echo Check that you typed or copied the correct file path, and that the folder contains your SPT install.
    echo Press a key to close this window when ready.
    rem ascii art
    echo          __ && echo   _     / / && echo  ^(_^)   / /  && echo       / /   && echo   _  / /    && echo  ^(_^)/ /     && echo    /_/ 
    echo:
            if %showErrors%==1 (
                    echo You entered: "%directory%" as your directory.
                    echo Exit code %errorlevel%, Error 2 - Couldn't find server file.
            echo:
            )
    echo ==============================
    echo:
    goto :enterdirloop
    )

:serverstart
    echo Starting Server ^(Aki.Server.exe^)...
    @start Aki.Server.exe

    rem check if drive type 0/1 (SSD/HDD), then echo launch time and indicate which preset is being used
    if "%driveType%" == "ssd" (
            echo Working... ^(%serverStartTimeSSD% Seconds, Using SSD Preset^)
            set loopcount=%serverStartTimeSSD%
            set serverstatus=0
    ) else if %driveType%==hdd (
            echo Working... ^(%serverStartTimeHDD% Seconds, Using HDD Preset^)
            set loopcount=%serverStartTimeHDD%
            set serverstatus=0
    ) else if %driveType%==custom (
            echo Working... ^(%serverStartTimeCustom% Seconds, Using User Preset^)
            set loopcount=%serverStartTimeCustom%
            set serverstatus=0
    )

:loadingloop
    title Console - Saru's SPT Auto ^Start Script v1.00 - WORKING.      (%loopcount% Seconds Remaining)
            @timeout /t 1 >nul 2>&1
    set /a loopcount=loopcount-1
    if %loopcount%==0 goto :launcherstart
    title Console - Saru's SPT Auto ^Start Script v1.00 - WORKING. .    (%loopcount% Seconds Remaining)
            @timeout /t 1 >nul 2>&1
    set /a loopcount=loopcount-1
    if %loopcount%==0 goto :launcherstart
    title Console - Saru's SPT Auto ^Start Script v1.00 - WORKING. . .  (%loopcount% Seconds Remaining)
            @timeout /t 1 >nul 2>&1
    set /a loopcount=loopcount-1
    if %loopcount%==0 goto :launcherstart

    echo Finished.
    title Console - Saru's SPT Auto ^Start Script
    goto :launcherstart

    rem these commands are looped. changes title at an interval to 'animate' the title with a progressive '...' animation
    rem 'set' command sets the loop count variable to 'previous value - 1'
    rem this combined with the one second delay subtracts one from the value every second, essentially creating a timer where the initial loopcount value is the time in seconds to count down from        

:launcherstart

    rem if serverstatus is set to one, skip launcher start and go to end of script messages
    rem server status will be set to one before the second loop starts
    if %serverstatus%==1 goto :endstartup

    echo Starting Launcher ^(Aki.Launcher.exe^)...
    @start Aki.Launcher.exe

    rem check if drive type 0/1 (SSD/HDD), then echo launch time and indicate preset
    rem sets serverstatus to 1 to indicate that this loop the **launcher** is starting
    if %driveType%==ssd (
            echo Working... ^(%launcherStartTimeSSD% Seconds, Using SSD Preset^)
            set loopcount=%launcherStartTimeSSD%
            set serverstatus=1
            goto :loadingloop
            
    ) else if %driveType%==hdd (
            echo Working... ^(%launcherStartTimeHDD% Seconds, Using HDD Preset^)
            set loopcount=%launcherStartTimeHDD%
            set serverstatus=1
            goto :loadingloop
    ) else if %driveType%==custom (
            echo Working... ^(%launcherStartTimeCustom% Seconds, Using User Preset^)
            set loopcount=%launcherStartTimeCustom%
            set serverstatus=1
            goto :loadingloop
    )

:endstartup
    cls
    echo:
    echo All processes finished.
    if %noDelays%==false @timeout /t 3 >nul 2>&1
    if %firstRunComplete%==true goto :finalsplashscreen

:q4fastmode
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
    :choice5
        set choice5=
        set /p choice5=Would you like to enable fast mode? [Y/N] 
        if %choice5%==y (
            echo Set objFS = CreateObject^("Scripting.FileSystemObject"^)>> TMPfastmodereplace.vbs
            echo strFile = "variables.txt">> TMPfastmodereplace.vbs
            echo Set objFile = objFS.OpenTextFile^(strFile^)>> TMPfastmodereplace.vbs
            echo Do Until objFile.AtEndOfStream>> TMPfastmodereplace.vbs
            echo strLine = objFile.ReadLine>> TMPfastmodereplace.vbs
            echo If InStr^(strLine,"fastMode=false"^)^> 0 then>> TMPfastmodereplace.vbs
            echo strLine = Replace^(strLine,"fastMode=false", "fastMode=true"^)>> TMPfastmodereplace.vbs
            echo End If>> TMPfastmodereplace.vbs
            echo WScript.Echo strLine>> TMPfastmodereplace.vbs
            echo Loop>> TMPfastmodereplace.vbs

                cscript /nologo TMPfastmodereplace.vbs  > variablestmp
                @timeout /t 1 >nul 2>&1
                del variables.txt
                del TMPfastmodereplace.vbs
                @timeout /t 1 >nul 2>&1
                ren variablestmp variables.txt
                echo:
                echo All variables saved.
            echo Fast mode will be enabled next time you run the program.
            goto :finalsplashscreen
        )
        if %choice5%==n (
            
            echo Fast mode will not be enabled. && echo:
            goto :finalsplashscreen
        )
        echo Your answer was invalid. You can enter 'y' for yes or 'n' for no.
        echo This is case sensitive, type in lowercase.
        cls
        goto :q4fastmode

:finalsplashscreen
    if %noDelays%==true goto :endofscript
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
    @timeout /t 3 >nul 2>&1

:endofscript

    if %firstRunComplete%==false (
        echo:
        echo Changes found, Saving variables...
        echo This may take a little longer than ten seconds.

        rem replace old firstStartup variable with new one using temporary .vbs script
        rem replaces entire line because... yeah. it works. whatever.
            echo Set objFS = CreateObject^("Scripting.FileSystemObject"^)>> TMPvariablereplace.vbs
            echo strFile = "variables.txt">> TMPvariablereplace.vbs
            echo Set objFile = objFS.OpenTextFile^(strFile^)>> TMPvariablereplace.vbs
            echo Do Until objFile.AtEndOfStream>> TMPvariablereplace.vbs
            echo strLine = objFile.ReadLine>> TMPvariablereplace.vbs
            echo If InStr^(strLine,"firstRunComplete=false"^)^> 0 then>> TMPvariablereplace.vbs
            echo strLine = Replace^(strLine,"firstRunComplete=false","firstRunComplete=true"^)>> TMPvariablereplace.vbs
            echo End If>> TMPvariablereplace.vbs
            echo WScript.Echo strLine>> TMPvariablereplace.vbs
            echo Loop>> TMPvariablereplace.vbs

                cscript /nologo TMPvariablereplace.vbs  > variablestmp
                @timeout /t 1 >nul 2>&1
                del variables.txt
                del TMPvariablereplace.vbs
                @timeout /t 1 >nul 2>&1
                ren variablestmp variables.txt
                echo:
                echo All variables saved.

            rem replace * with = in variables file
            echo Set objFS = CreateObject^("Scripting.FileSystemObject"^)>> TMPequalsignreplace.vbs
            echo strFile = "variables.txt">> TMPequalsignreplace.vbs
            echo Set objFile = objFS.OpenTextFile^(strFile^)>> TMPequalsignreplace.vbs
            echo Do Until objFile.AtEndOfStream>> TMPequalsignreplace.vbs
            echo strLine = objFile.ReadLine>> TMPequalsignreplace.vbs
            echo If InStr^(strLine,"*"^)^> 0 then>> TMPequalsignreplace.vbs
            echo strLine = Replace^(strLine,"*","="^)>> TMPequalsignreplace.vbs
            echo End If>> TMPequalsignreplace.vbs
            echo WScript.Echo strLine>> TMPequalsignreplace.vbs
            echo Loop>> TMPequalsignreplace.vbs

                cscript /nologo TMPequalsignreplace.vbs  > variablestmp
                @timeout /t 1 >nul 2>&1
                del variables.txt
                del TMPequalsignreplace.vbs
                @timeout /t 1 >nul 2>&1
                ren variablestmp variables.txt
                echo Variable file reformatted...
                echo:
    )
    echo:
    echo Console window will close in 10 seconds.
    @timeout /t 10 >nul 2>&1
    exit

:enterdirloop
    rem this is in a really weird position, but for now its the only place where it won't be executed out of order
    rem update: doubt this will change. doesn't really matter anyway.
    SET /P c=Would you like to reenter the game directory manually (Y), or try again with the saved directory (N)? [Y/N]
    if /I "%c%" EQU "Y" goto :enterdir
    if /I "%c%" EQU "N" cls && goto :startofscript
    echo: && echo Invalid answer. You can respond with 'Y' for yes, and 'N' for no. This is not case sensitive. && echo:
    goto :enterdirloop
