#!/bin/bash

cd openssl-1.0.2n
patch -p0 < ../patch/openssl.patch
./Configure mingw64 shared --cross-compile-prefix=x86_64-w64-mingw32-
make

