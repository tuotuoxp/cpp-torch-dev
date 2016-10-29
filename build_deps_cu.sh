#!/bin/sh

basedir=$(cd "$(dirname "${BASH_SOURCE}")" && pwd)

if [ "$1" == "" ]
then
    dest=$basedir/install
else
    dest=$1
fi

$basedir/build_deps.sh $1


mkdir $basedir/build/THC
cd $basedir/build/THC
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=$dest -DCMAKE_INSTALL_PREFIX=$dest $basedir/cutorch/lib/THC
make install


mkdir $basedir/build/THCUNN
cd $basedir/build/THCUNN
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=$dest -DCMAKE_INSTALL_PREFIX=$dest $basedir/cunn/lib/THCUNN
make install


cd $basedir

