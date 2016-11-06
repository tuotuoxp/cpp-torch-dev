@echo off

set dir=%~dp0
cd /D %dir%

cd %dir%\torch7
git remote add upstream https://github.com/torch/torch7.git
git fetch upstream
git checkout master
git pull --no-edit
git merge --no-edit upstream/master

cd %dir%\nn
git remote add upstream https://github.com/torch/nn.git
git fetch upstream
git checkout master
git pull --no-edit
git merge --no-edit upstream/master

cd %dir%\cutorch
git remote add upstream https://github.com/torch/cutorch.git
git fetch upstream
git checkout master
git pull --no-edit
git merge --no-edit upstream/master

cd %dir%\cunn
git remote add upstream https://github.com/torch/cunn.git
git fetch upstream
git checkout master
git pull --no-edit
git merge --no-edit upstream/master

