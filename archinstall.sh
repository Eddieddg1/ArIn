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
source packages.sh

if [[ $de == "Plasma" ]]; then
de="plasma"
chmod +x plasma.sh
source plasma.sh
elif [[ $de == "Hyprland" ]]; then
de="hyprland"
chmod +x script.sh
source script.sh
elif [[ $de == "AwesomeWM" ]]; then
de="awesome"
chmod +x hyprland.sh
source awesome.sh
fi

chmod +x wine.sh
source wine.sh

chmod +x script.sh
source script.sh

chmod +x echo.sh
source echo.sh






















