#!/bin/sh

basedir=$(cd "$(dirname "${BASH_SOURCE}")" && pwd)
dest=$basedir/install

mkdir -p $basedir/build/TH
cd $basedir/build/TH
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$dest $basedir/torch7/lib/TH
make
make install


mkdir -p $basedir/build/THNN
cd $basedir/build/THNN
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=$dest -DCMAKE_INSTALL_PREFIX=$dest $basedir/nn/lib/THNN
make
make install


mkdir -p $basedir/build/cpp-torch
cd $basedir/build/cpp-torch
cmake -G "Xcode" -DCMAKE_PREFIX_PATH=$dest -DCMAKE_INSTALL_PREFIX=$dest $basedir/cpp-torch


cd $basedir
