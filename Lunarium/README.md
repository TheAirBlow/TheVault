# Lunarium Client
![Downloads](https://img.shields.io/github/downloads/TheAirBlow/lunarium/total?style=flat-square)
![Version](https://img.shields.io/github/v/release/TheAirBlow/lunarium?include_prereleases&style=flat-square)
![Licence](https://img.shields.io/github/license/TheAirBlow/lunarium?style=flat-square)
![Fatness](https://img.shields.io/github/code-size/TheAirBlow/lunarium?style=flat-square)

Blocky cheat! For true blockers only.
Works on 1.16.2.

> This is edit of [BleachHack](https://github.com/BleachDrinker420/bleachhack-1.14), big thanks to his creator!
> Lunarium has the same license and it's source is opened. Anything okay ^^

## What changed?
  Look at the ChangeLog - [click here pls](https://github.com/TheAirBlow/lunarium/blob/master/CHANGELOG.md)
  
## Installation:
**For minecrafters:**

Download [Fabric for Minecraft 1.16](https://fabricmc.net/use/)  
Download the lastest compiled version of Lunarium - [click here okay](https://github.com/TheAirBlow/lunarium/releases)

On Windows: `Type %appdata% into the location field of the Windows Explorer; then open '.minecraft'.`

On Mac: `Click on the desktop, press Command+Shift+G, type ~/Library and press enter; then open 'Application Support' and finally '.minecraft'.`

On Linux: `In a terminal window, type 'xdg-open ~/.minecraft'... or if you like working at the commandline, 'cd ~/.minecraft'.`

Then inside that folder, you should see a folder named 'mods'. (If you don't see one, make sure you've installed Fabric already and started Minecraft again once).
That's where you'll put any mods you want to install. 

--------------

**For 1000 IQ developers:**

Download the project  
Start A Command Prompt in the workspace folder. 
Generate the needed files for your preferred IDE.

***Eclipse:***

  On Windows:
  > gradlew genSources eclipse
  > (If using PowerShell you must add ./ at the command start)
  
  On Linux:
  > chmod +x ./gradlew  
  >./gradlew genSources eclipse

  And then just open workspace in root directory with sources folder in it. (If something go wrong - import it)
  
***IDEA:***

  On Windows:
  > gradlew genSources idea
  > (If using PowerShell you must add ./ at the command start)
  
  On Linux:
  > chmod +x ./gradlew  
  >./gradlew genSources idea

  Start a new workspace in IDEA.
  
***Other IDEs:***

  Use [this link](https://fabricmc.net/wiki/tutorial:setup) for more information.
  It should be pretty similar to the eclipse setup.
  

