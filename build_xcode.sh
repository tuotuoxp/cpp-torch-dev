#!/bin/sh

basedir=$(cd "$(dirname "${BASH_SOURCE}")" && pwd)
dest=$basedir/install


mkdir -p $basedir/build/cpp-torch-xcode
cd $basedir/build/cpp-torch-xcode
cmake -G "Xcode" -DCMAKE_PREFIX_PATH=$dest -DCMAKE_INSTALL_PREFIX=$dest $basedir/cpp-torch


mkdir -p $basedir/build/cpp-torch-fns
cd $basedir/build/cpp-torch-fns
cmake -G "Xcode" -DCMAKE_PREFIX_PATH=$dest $basedir/cpp-torch/example/fns

cd $basedir

