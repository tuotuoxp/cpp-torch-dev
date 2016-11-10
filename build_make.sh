#!/bin/sh

basedir=$(cd "$(dirname "${BASH_SOURCE}")" && pwd)

if [ "$1" == "" ]
then
    dest=$basedir/install
else
    dest=$1
fi


mkdir -p $basedir/build/cpp-torch
cd $basedir/build/cpp-torch
which cudafe > /dev/null 2>&1
if [ $? == 0 ]
then
    enable_cuda=ON
else
    enable_cuda=OFF
fi
cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=ON -DBUILD_CUDA=$enable_cuda -DCMAKE_PREFIX_PATH=$dest -DCMAKE_INSTALL_PREFIX=$dest $basedir/cpp-torch
make && make install


cd $basedir

