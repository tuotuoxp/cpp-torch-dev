#!/bin/sh

basedir=$(cd "$(dirname "${BASH_SOURCE}")" && pwd)
dest=$basedir/install


mkdir -p $basedir/build/cpp-torch
cd $basedir/build/cpp-torch
cmake -G "Xcode" -DCMAKE_PREFIX_PATH=$dest -DCMAKE_INSTALL_PREFIX=$dest $basedir/cpp-torch


cd $basedir

