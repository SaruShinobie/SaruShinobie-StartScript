### Introduction and Details
**This is an autostart script for SPT-AKI (Single Player Tarkov) with customizable variables for start time, drive types, and your install directory.**


**Initially I wrote this script purely out of laziness, because I got tired of navigating to my install folder and starting the server and launcher manually. At some point down the line, I decided I would polish this and release it to the public, in case anyone else finds it useful. With this program you can start SPT with one click, and you can create a shortcut to the game to send to your desktop.**

You can skip to the Quick Start section [here.](###-quick-start-guide)

# Variables File
**Startup times, directories, and other settings can all be changed manually in the variables file.**
The `variables.txt` file can be opened with pretty much any text editor, notepad will work just fine.
The file will look something like this:

```
;This file contains the settings entered during the setup process, initiated by running setup.bat
directory=C:/SinglePlayerTarkov
modFolderDirectory=C:/SinglePlayerTarkov/user/mods/SaruShinobie-StartScript
;
driveType=custom
;
serverStartTimeCustom=15
launcherStartTimeCustom=5
;
useCustomTimes=true
;
showErrors=false
;
firstRunComplete=true
;
fastMode=false
;
; When you modify these variables directly through this file, enter your values after the equal sign.
; eg. "loveYourselfEveryday=true" when "true" is your desired value
```

# Variables Notes
A few basic things to note;

1. The `serverStartTimeXXX` and `launcherStartTimeXXX` variables are both **integers only.**

    * Startup times can either be perfect or too long - never too short. If you don't set the start time variables high enough it will start the launcher before the server finishes setting up, and the launcher won't launch. (pun intended?) 
        - Basically, if your `serverStartTime` and `launcherStartTime` variables arent set to a high enough number, you won't be able to play.

    * The preset start times were tested on my device by me personally, so they may not be entirely accurate.
        - SSD times were tested with a Crucial P2 500GB NVMe M.2 SSD (CT500P2SSD8) at ~2400 MB/s read and write speed.
        - HDD times were tested with a Western Digital Blue 1TB 3.5" SATA HDD at 7200RPM (WDC WD10EZEX-08WN4A0) at ~200 MB/s read and write speed.

2. The only variable that accepts **text input** is the `directory` variable, which, predictably, takes the directory to the folder you installed SPT in.

3. `showErrorCodes` is set to `false` by default, you can change it to `true` if you decide to modify the batch file for your own purposes¹, or if you wanna see it because it looks cool or something. None of my business.
    * This is really only intended as a debug setting, general users shouldn't really need to have it enabled.

4. **You cannot change variable names.** 
    * If you change the names in the `variables.txt` file, they will be defined with different names in the batch file. The code will break, because the unmodified program is coded to try to use data stored under a name that (now) no longer exists.


¹ - I take no responsibility for any damages done to you or others' property after running modified version(s) of this software. Batch files are collections of commands to be run in a Windows command prompt. Batch files can close applications, shutdown your computer, even wipe data from your drives. I encourage you to carefully examine any batch file you download prior to running it.


### QUICK START GUIDE

To begin, simply run 'start.bat' found in the mod folder alongside this file.
If it's your first time starting the program (it probably is if you're reading this), then you will be put through the setup process. It shouldn't take more than a minute or two.

 * You will be prompted to enter the directory of your SPT install folder, and to enter either the type of drive that install folder is stored on, or your own startup times.
    - eg. "C:/Program Files/SinglePlayerTarkov" 
    - note: 'SinglePlayerTarkov' will be replaced with the name of your install folder.
 * You will also be asked whether or not you would like to enable fast mode. Fast mode cuts down on excess delays during startup significantly, although the experience is much less smooth and the application may be less pleasing to use.
    - The first time you run the program, it will run in normal mode. This is to ensure that you are made aware of all the information provided by the program.

**After the setup process is finished, you'll have the option to start the game or close the program for later. From then on, it's pretty simple - the next time you start the program, the setup process will be skipped and your game will start without any fiddling with the terminal.**
