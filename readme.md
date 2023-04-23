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
modFolderDirectory=C:\SinglePlayerTarkov\user\mods\SaruShinobie-StartScript-2.0.1
installFolderDirectory=C:\SinglePlayerTarkov
userPort=6969
portQuestionAnswered=true
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

4. `desktopQuestionAnswered`, `portQuestionAnswered`, `fastModeQuestionAnswered`, `fastMode`, and `firstRunComplete` variables all accept 'true' or 'false' as values.

5. `userPort` accepts a four digit integer, which can be found in the `http.json` file in `...\Aki_Data\Server\configs`. This value represents the port the server is run on, and chances are you didn't even know you could change it (I didn't), so in 99.9% of cases it will be the default value - `6969`.

### ROUGH CHANGELOG:

* Fixed rare startup issues where the task would detect the server as running after its been closed.
    - Waits for activity from the old server to cease after stopping task.
* New code to be read by the server to log that the mod has been detected and do away with mod.js errors (a.k.a. a message in the console).
    - Credit to Jehree in the comment section for the suggestion. <33
* Code and console format changes.
* Code and startup sped up significantly.
* Added a window flash once all tasks have been completed (will add option to turn off soon).
* Added support for custom server ports/ip addresses.
    - New user input question where you can enter your custom port or choose the default one on first startup.
