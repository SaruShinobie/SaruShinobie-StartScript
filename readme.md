## Introduction and Details
**This is an autostart script for SPT-AKI (Single Player Tarkov) with customizable settings for startup and the ability to send a shortcut to the game to your desktop.**


*Initially I wrote this script purely out of laziness, because I got tired of navigating to my install folder and starting the server and launcher manually. At some point down the line, I decided I would polish this and release it to the public, in case anyone else finds it useful. With this program you can start SPT with one click, and you can create a shortcut to the game to send to your desktop.*

## QUICK START

To begin, simply run 'start.bat' found in the mod folder alongside this file.
If it's your first time starting the program (it probably is if you're reading this), then you will be put through the setup process.
You will be asked if you would like to create a shortcut to the script first, then if you want to enable fast mode (unused as of now).

### Variables File
**Startup times, directories, and other settings can all be changed manually in the variables file.**
The `variables.txt` file can be opened with pretty much any text editor, notepad will work just fine.
After your first run through, the file will look something like this:

```
; This file contains your saved settings. If you plan on modifying this, just ensure that you format it correctly.
; For example; "thisSettingIsStupid=yourValueHere"
;
; vv variables below vv
;
modFolderDirectory=C:\SinglePlayerTarkov\user\mods\SaruShinobie-StartScript-2.0.0
installFolderDirectory=C:\SinglePlayerTarkov
desktopQuestionAnswered=true
fastModeQuestionAnswered=true
fastMode=false
firstRunComplete=true

```

There are only a few things of note here for now;
1. `fastMode` has very minimal effect on the script as of now. More changes will be implemented soon.

2. To change the preexisting settings, like for example the color of your shortcut, you'll have to either set the corresponding `questionAnswered` variable to false, or delete the `variables.txt` file entirely.
    * deleting the variables file is much more reliable, as the individual changing of variables has not been thoroughly tested.

3. `modFolderDirectory` and `installFolderDirectory` both accept file paths (directories) to the `SaruShinobie-StartScript-X.X.X` folder and your SPT install root folder respectively.
    * In this case, `X.X.X` represents the version of the mod detailed in the folder name.

4. `desktopQuestionAnswered`, `fastModeQuestionAnswered`, `fastMode`, and `firstRunComplete` variables all accept 'true' or 'false' as values.
