#!/bin/bash

# Export some stuff for the script

# If u execute the script from the symlink then this will make the source as root folder for other scripts aswell.
export SOURCE=$(pwd)

# gna check if dialog is installed

if [ $(dpkg-query -W -f='${Status}' dialog 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  echo "apt install dialog";
  exit 1
fi


HEIGHT=30
WIDTH=90
CHOICE_HEIGHT=30
BACKTITLE="Kernel compiler script"
TITLE=""
MENU="Choose one of the following options:"

OPTIONS=(1 "Use /vendor/lib/mdoules for modules, applied by default on kekhunter"
         2 "Use /system/lib/mdoules for modules, ue only if u have /system/lib/modules"
         3 "Back"
         )

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            echo "Use /vendor/lib/mdoules for modules, applied by default on kekhunter"
            patch -p0 < patcher/patches/usevendormodules.patch
            ;;
        2)
            echo "Use /system/lib/mdoules for modules, ue only if u have /system/lib/modules"
            patch -p0 < patcher/patches/usesystemmodules.patch
            ;;
        3)
            echo "Bye."
            ./starter.sh
            ;;
esac
