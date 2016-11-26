#!/bin/sh

# Makefile to use (will be automatically copied into system/core/adb)
makefile=makefile.fastboot


# MAKE
# -------------------------
echo "\n>> Copying makefile into system/core/fastboot...\n"
cp $makefile android-adb/system/core/fastboot/makefile -f
echo "\n>> Copying prebuilt dll and header file into system/core/fastboot...\n"
cp prebuilt/* android-adb/system/core/fastboot/
cd android-adb/system/core/fastboot/
echo "\n>> Make... \n"
make clean
make
echo "\n>> Copying fastboot back into current dir...\n"
cp fastboot.exe ../../../../
echo "\n>> FINISH!\n"
