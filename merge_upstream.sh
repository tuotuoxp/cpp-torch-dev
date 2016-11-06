#!/bin/sh

basedir=$(cd "$(dirname "${BASH_SOURCE}")" && pwd)


cd $basedir/torch7
git remote add upstream https://github.com/torch/torch7.git
git fetch upstream
git checkout master
git pull --no-edit
git merge --no-edit upstream/master

cd $basedir/nn
git remote add upstream https://github.com/torch/nn.git
git fetch upstream
git checkout master
git pull --no-edit
git merge --no-edit upstream/master

cd $basedir/cutorch
git remote add upstream https://github.com/torch/cutorch.git
git fetch upstream
git checkout master
git pull --no-edit
git merge --no-edit upstream/master

cd $basedir/cunn
git remote add upstream https://github.com/torch/cunn.git
git fetch upstream
git checkout master
git pull --no-edit
git merge --no-edit upstream/master

