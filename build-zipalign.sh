#!/bin/sh

# Makefile to use (will be automatically copied into system/core/adb)
makefile=makefile.zipalign


# MAKE
# -------------------------
echo "\n>> Copying makefile into platform/build/tools/zipalign...\n"
cp $makefile android-adb/platform/build/tools/zipalign/makefile -f
cd android-adb/platform/build/tools/zipalign
echo "\n>> Make... \n"
make clean
make
echo "\n>> Copying zipalign back into current dir...\n"
cp zipalign.exe ../../../../../zipalign.exe
echo "\n>> FINISH!\n"
