#!/bin/bash

# Additional info
#
# Some stuff is from https://gitlab.com/kalilinux/nethunter/build-scripts/kali-nethunter-project/-/blob/master/nethunter-fs/build.sh
# And somewhere else that i cant remember where anyhmore.


## Export some stuff for the script

	# If u execute the script from the symlink then this will make the source as root folder for other scripts aswell.
	export SOURCE=$(pwd)


	# User selected device
	export DEVICE=$1

##


display_help() {
	echo "----------------------------------------------------------------------------------------"
	echo "	Also this script needs u to have device tree and other stuff setted up!!!"
	echo "----------------------------------------------------------------------------------------"
	echo "	Usage: ./starter.sh lineage_codename-userdebug"
	echo "	Example: ./starter.sh lineage_beryllium-userdebug"
	echo "----------------------------------------------------------------------------------------"
	echo "	-h, --help      display this help message"
	echo "----------------------------------------------------------------------------------------"
	echo "	Script version: 0.1.1"
	echo "------------------------------"
}


# fail safe so u cant run it without additional argument (Forked from offsec :) )

if [ $# -eq 0 ]; then
	display_help
	exit 0
fi

while [[ $# -gt 0 ]]; do
	arg=$1
	case $arg in
		-h|--help)
			display_help
			exit 0 ;;
	esac
	shift
done

# lets make a tmp file for vars so starter can use these for every script

echo "SOURCE=$SOURCE" >> tmp
echo "DEVICE=$DEVICE" >> tmp

# Also we cant forget to import aosp build tools

. build/envsetup

# And now to the UI
./starter/scripts/menu

# And cleanup

rm -rf tmp
