# Cross compile the Android Debug Bridge (adb) for 64-bit Windows

This is an all-in-one script to build the Android adb tool (v 1.0.36) for 64-bit Windows architecture.
When executed, the script will download all the necessary files and it will run a custom makefile to build `adb.exe`
executable.

By default, the Android SDK for Windows includes a 32-bit version of the Android Debug Bridge (adb).
Some versions of Windows, such as Nano Server, do not include a 32-bit subsystem.

This project contains scripts which allow you to cross-compile adb on a Linux machine (we've used Ubuntu 16.04)
for 64-bit Windows.

## Requirements
* A Git client
* A toolchain which allows you to cross-compile for 64-bit Windows on Linux

## Setup

```
sudo apt-get install  mingw-w64 git make
git clone https://github.com/qmfrederik/adb-win64/
cd adb-win64

# Get the sources from Google
./get-sources.sh

# Build OpenSSL
./dependencies.sh

# Build adb
./build.sh
```

You'll then have a 64-bit `adb.exe` in your current folder.

## Credits

The scripts are based on:
* [adb for ARM](https://github.com/bonnyfone/adb-arm)
* [Cross-compiling Adb for Windows](https://aaporantalainen.wordpress.com/2015/12/05/cross-compiling-adb-for-windows/)
