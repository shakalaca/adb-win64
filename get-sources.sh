#!/bin/bash

#         DEPENDENCIES
# -------------------------
wget -c https://www.openssl.org/source/openssl-1.0.2n.tar.gz
tar -xvzf openssl-1.0.2n.tar.gz

#         CONFIG
# -------------------------

# Branch to checkout from Android source code repo
branch=android-8.1.0_r2

# DOWNLOAD necessary files
# -------------------------
echo "\n>> >>> ADB for ARM <<< \n"
echo "\n>> Downloading necessay files ($branch branch)\n"
mkdir android-adb
cd android-adb
mkdir system
cd system
git clone -b $branch https://android.googlesource.com/platform/system/core
patch -p1 -d core < ../../patch/system_core.patch
git clone -b $branch https://android.googlesource.com/platform/system/extras
cd ..
mkdir external
cd external
git clone -b $branch https://android.googlesource.com/platform/external/zlib
git clone -b $branch https://android.googlesource.com/platform/external/mdnsresponder/
patch -p1 -d mdnsresponder < ../../patch/external_mdnsresponder.patch
cd ..
