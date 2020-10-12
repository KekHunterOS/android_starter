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
WIDTH=80
CHOICE_HEIGHT=30
BACKTITLE="Kernel compiler script"
TITLE=""
MENU="Choose one of the following options:"

OPTIONS=(1 "Setup base for beryllium no kernel"
         2 "Setup base for j7y17lte no kernel"
	 3 "Patching toybox"
         4 "Exit"
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
            echo "Setting up beryllium"
            ./patcher/scripts/beryllium.sh
            ;;
        2)
            echo "Setting up j7y17lte"
            ./patcher/scripts/j7y17lte.sh
            ;;
        3)
            echo "Patches toybox"
            ./patcher/toybox.sh
            ;;
        4)
            echo "Bye."
            exit 1
            ;;
esac
