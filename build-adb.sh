#!/bin/sh

# Makefile to use (will be automatically copied into system/core/adb)
makefile=makefile.adb


# MAKE
# -------------------------
echo "\n>> Copying makefile into system/core/adb...\n"
cp $makefile android-adb/system/core/adb/makefile -f
echo "\n>> Copying prebuilt dll and header file into system/core/adb...\n"
cp prebuilt/* android-adb/system/core/adb/
cd android-adb/system/core/adb/
echo "\n>> Make... \n"
make clean
make
echo "\n>> Copying adb back into current dir...\n"
cp adb.exe ../../../../
echo "\n>> FINISH!\n"
