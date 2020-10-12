echo "Cloning Device tree"
git clone https://github.com/KekHunterOS/Beryllium_DT.git -b LOS-17.1 $SOURCE/device/xiaomi
echo "Cloning vendor"
git clone https://github.com/PWN-Hunter/Beryllium-vendor.git $SOURCE/vendor/xiaomi
echo "Cloning hardware"
git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-17.1 $SOURCE/hardware/xiaomi
echo "DONE"
