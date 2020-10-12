echo "Cloning Device tree"
git clone https://github.com/KekHunterOS/j7y17lte-DT.git -b LOS-17.1 $SOURCE/device/samsung
echo "Cloning vendor"
git clone https://github.com/KekHunterOS/j7y17lte-vendor.git $SOURCE/vendor/samsung
echo "Cloning hardware"
git clone https://github.com/KekHunterOS/hardware_samsung.git -b LOS-17.1 $SOURCE/hardware/samsung
echo "DONE"
