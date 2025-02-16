#!/bin/bash

clear

if ! ping -c 1 google.com >/dev/null 2>&1; then
iwctl device list
read -p "Which of the devices do you want to use?: " NETWORKDEVICE
iwctl device $NETWORKDEVICE set-property Powered on
iwctl station $NETWORKDEVICE scan
iwctl station $NETWORKDEVICE get-networks
read -p "Which of the networks do you want to connect to?: " NETWORK
iwctl station $NETWORKDEVICE connect $NETWORK
fi

clear

chmod +x disk.sh
#source disk.sh

clear

chmod +x dewm.sh
source dewm.sh

chmod +x packages.sh
#source packages.sh

chmod +x move.sh
./move.sh

if [[ $de == "plasma" ]]; then
chmod +x plasma.sh
#source plasma.sh
elif [[ $de == "hyprland" ]]; then
chmod +x hyprland.sh
#source hyprland.sh
elif [[ $de == "awesome" ]]; then
chmod +x awesome.sh
#source awesome.sh
fi

chmod +x wine.sh
#source wine.sh

chmod +x config.sh
#source config.sh

#chmod +x script.sh
#source script.sh























