#!/bin/bash

#         DEPENDENCIES
# -------------------------
wget https://www.openssl.org/source/openssl-1.0.2j.tar.gz
tar -xvzf openssl-1.0.2j.tar.gz
patch -p0 -d openssl-1.0.2j < patch/openssl.patch

#         CONFIG
# -------------------------

# Branch to checkout from Android source code repo
branch=android-o-preview-4

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
git clone -b android-7.1.2_r33 https://android.googlesource.com/platform/external/gtest/
git clone -b $branch https://android.googlesource.com/platform/external/mdnsresponder/
patch -p1 -d mdnsresponder < ../../patch/external_mdnsresponder.patch
git clone -b $branch https://android.googlesource.com/platform/external/zopfli/
git clone -b $branch https://android.googlesource.com/platform/external/safe-iop/
cd ..
mkdir platform
cd platform
git clone -b $branch https://android.googlesource.com/platform/development/
git clone -b $branch https://android.googlesource.com/platform/build/
mkdir frameworks
cd frameworks
git clone -b $branch https://android.googlesource.com/platform/frameworks/base/
