#!/bin/bash

echo "Time to select DE/WM!"
echo "1. KDE Plasma 2. Hyprland 3. AwesomeWM"
read de

if [[ $de =~ ^([1]?([.]?([ ]?[Kk][Dd][Ee]([ ]?[Pp][Ll][Aa][Ss][Mm][Aa])?)?))$ ]]; then
    de=Plasma
elif [[ $de =~ ^([2]?([.]?([ ]?[Hh][Yy][Pp][Rr][Ll][Aa][Nn][Dd])?)?)$ ]]; then
    de=Hyprland
elif [[ $de =~ ^([3]?([.]?([ ]?[Aa][Ww][Ee][Ss][Oo][Mm][Ee]([ ]?[Ww][Mm])?)?))$ ]]; then
    de=AwesomeWM
fi

export de

