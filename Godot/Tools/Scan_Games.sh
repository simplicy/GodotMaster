#!/bin/bash
#Enter games dir
if [ -d "/roms/ports/Godot" ]; then
  WD="/roms/ports/Godot/"
elif [ -d "/roms2/ports/Godot/" ]; then
  WD="/roms2/ports/Godot"
elif [ -d "/storage/roms/ports/Godot/" ]; then
  WD="/storage/roms/ports/Godot"
elif [ -d "/storage/roms2/ports/Godot/" ]; then
  WD="/storage/roms2/ports/Godot"
fi
cd $WD/games/
#Cycle items in dir
printf "\e[32mScanning for games...\n" > /dev/tty1
for game in *; do
    #If its a game, create a script for it in the Godot root
    if [[ "$game" == *".pck"* ]] || [[ "$game" == *".zip"* ]] ; then
        printf "\e[32mInstalling: ${game}\n" > /dev/tty1
        filename=${game::-4}
        printf "\e[32mCreating game script...\n" > /dev/tty1
        echo "#!/bin/bash" > ../$filename.sh
        echo "GAMENAME=$game" >> ../$filename.sh
        echo "export GAMENAME" >> ../$filename.sh
        echo "$WD/Tools/Game_Runner" >> ../$filename.sh
        printf "\e[32mSetting permissions...\n" > /dev/tty1
        chmod +x "../$filename.sh"
    fi 
done  
#Restart ES
pgrep -f oga_controls | sudo xargs kill -9
sudo systemctl restart emulationstation


