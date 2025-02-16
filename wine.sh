#!/bin/bash

wget https://github.com/doitsujin/dxvk/releases/download/v2.5.3/dxvk-2.5.3.tar.gz
tar xf dxvk-2.5.3.tar.gz

cd dxvk-2.5.3

wine

export WINEPREFIX=$HOME/.wine
cp x64/*.dll $WINEPREFIX/drive_c/windows/system32
cp x32/*.dll $WINEPREFIX/drive_c/windows/syswow64

wine reg add "HKEY_CURRENT_USER\Software\Wine\DllOverrides" /v d3d8 /t REG_SZ /d native,builtin /f
wine reg add "HKEY_CURRENT_USER\Software\Wine\DllOverrides" /v d3d9 /t REG_SZ /d native,builtin /f
wine reg add "HKEY_CURRENT_USER\Software\Wine\DllOverrides" /v d3d10core /t REG_SZ /d native,builtin /f
wine reg add "HKEY_CURRENT_USER\Software\Wine\DllOverrides" /v d3d11 /t REG_SZ /d native,builtin /f
wine reg add "HKEY_CURRENT_USER\Software\Wine\DllOverrides" /v dxgi /t REG_SZ /d native,builtin /f

