@echo off

if not "%Platform%" == "X64" (
    echo Cannot find Visual Studio x64 Native Tools Enviroment.
    pause
    exit /B 1
)

set dir=%~dp0
set dest="%dir%\install"
mkdir %dir%\build
cd /D %dir%\build


mkdir %dir%\build\cpp-torch
cd %dir%\build\cpp-torch
cmake -G "Visual Studio 14 2015 Win64" -DCMAKE_PREFIX_PATH="%dest%" -DCMAKE_INSTALL_PREFIX="%dest%" "%dir%\cpp-torch"


cd %dir%
