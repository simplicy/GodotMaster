# GodotMaster
Some tools insipred by [PortMaster](https://github.com/christianhaitian/PortMaster) to enable you to easily play godot games on your handheld. 
(Disclaimer: Subject to the power of your device, not all games are made equal. This is just meant to help you get to playing them on your handhelds faster.)

# Usage
You want to play low-poly\low-power godot games on your retro handheld device? Do you want to develop your own games that you can then play on these handhelds? 

This is a collection of tools that enable you to play godot games on your retro handheld device adding hundreds of more games you can play on these devices. 

(Disclaimer: Currently this has only been tested on RG351P/M and RG351MP devices, until I can get my hands on other retro-handhelds, I cannot verify that this will work 100% on other handhelds without some tinkering.)

# Pre-requisites
At the moment, I am having these scripts piggyback off of portmasters controller setup. This is not ideal but games made in Godot give the developer full control of the controller setup for the player. This means that some games may have working controls while others will not, even if it seems like they should. I have tested about 30 games with varying results. I am working on getting the parts we can control more consistent across devices. Currently I can only test on the RG351P/M and RG351MP. 

If you do not have it installed already, go to the [PortMaster](https://github.com/christianhaitian/PortMaster) github and install it on your device. If you have the most recent version of ArkOS you should already have this installed. So you can skip this step. 
# Install
For each install below, make sure you are installing your games and the godot folder on the same sd card. If you install your games on your second sd card (```/roms2/```), install this godot package here. If you install your games on your primary sd card (```/roms/```), install the godot package there. If you're on AmberELEC\351ELEC you will need to put ```/storage/roms/``` or ```/storage/roms2/```. I will reference it as ```{ROMSDIR}``` for the rest of the install.
## Ports Install (Easy)
If you want to access your godot games through the ports system, simply drag and drop this ```godot/``` folder into your ```{ROMSDIR}/ports/``` folder. 
### Ports - Install Games
In the ```godot/``` folder, copy your ```.pck/.zip``` Godot games into the ```games/``` folder. Once booted into your device, navigate to the godot folder in the ports system, open the ```tools/``` folder and run the ```Scan_Games``` script. This will generate launcher files for all your godot games. Emulationstation will restart then you should now see all your games in the Godot folder. Start any of them to begin playing Godot games!
## System install (Intermediate)
If you want to access your Godot games like a system add the following to your ```es_systems.cfg``` file located in ```/etc/emulationstation/``` on your ```root``` partition. Paste the snippet just below the ```<systemList>``` tag at the top of the file. Make sure to change ```{ROMSDIR}``` to the correct name where your roms are accessed. 
```
<system>
	<name>Godot</name>
	<fullname>Godot Engine</fullname>
	<path>{ROMSDIR}/Godot/</path>
	<extension>.pck .zip</extension>
	<command>{ROMSDIR}/Godot/Tools/Game_Runner %ROM%</command>
	<platform>godot</platform>
	<theme>godot</theme>
</system>
```
Drag and drop the godot folder into your ```{ROMSDIR}/``` partition among the other systems.

There is most likely not a theme installed on your device for Godot, so you will need to create or install your own after doing this or else you might have a blank screen on some themes.
### System - Install Games
Copy your ```.pck/.zip``` Godot games into the ```godot/``` folder (not the ```games/``` folder for this type of install). Start any of them to begin playing Godot games!
# Updating/Changing FRT
Included with this package are 4 different FRT 2 versions. There are two 32bit and two 64bit versions with one of each for Godot 3.4.4 and Godot 2.1.6. If a game of yours doesnt work, you can try using a different version of FRT to see if it will run, simply comment/uncomment the FRT version you want to use in the ```tools/Game_Runner.sh``` or ```tools/System_Runer.sh```. Please go to https://github.com/efornara/frt for more information about how FRT works. 
By default I have set the scripts to use FRT 2 for Godot 3.4.4.
# Credits
I created these scripts by modifying and adding my own features to a similar script package by [Pumpkinwaffle](https://github.com/Pumpkinwaffle/EmuELEC-OGS-Godot) that was made for EmuELEC. If you're interested in developing games for these handhelds using Godot, check out the info FRT has about build targets and the guide Pumpkinwaffle made about [Godot Engine and the OGA](https://docs.google.com/document/d/1Etr77RlzcrI1RXLdyeNqwML_RUEkhV5Gv85qFCMDKLU/edit?usp=sharing). 

The FRT files located in the bin folder were created by [efornara](https://github.com/efornara/frt). I have included a couple versions that were compiled during the time I created this. I would HIGHLY suggest going to their github for more info on FRT especially if you are looking to develop games in godot specifically for low-power devices or if you're looking to upgrade the FRT version used in this. None of this would be possible without these binaries, so give the author some love!

I am working on trying to fix the controller scheme, but currently I am getting this from PortMasters files on your device as a temporary solution. Check out [PostMaster](https://github.com/christianhaitian/PortMaster) if you have not already for some awesome games people have ported to these devices.
# In-Progress
1. I want to have a more consistent controller setup across devices. On my RG351MP quitting out of FRT is L2 while its Start on my RG351M. I am playing around with how the controller setup is, but this may not affect your ability to do anything in some games that dont have controller support or an unconventional layout. 
2. Currently installing this as a System means on some themes (EPICNIOR) you just get a black screen while on that system. This is simply because there is no theme available for that system. I am working on getting theme files for the Godot System for some of the default ArkOS themes that you can install. This may take some time so if you have issue with the black screen I would suggest to do the ports install instead for the time being.

