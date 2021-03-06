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
if "%CUDA_PATH%" == "" (
    set cuda_param=0
) else (
    set cuda_param=1
)
cmake -G "Visual Studio 14 2015 Win64" -DBUILD_CUDA=%cuda_param% -DCMAKE_PREFIX_PATH="%dest%" -DCMAKE_INSTALL_PREFIX="%dest%" "%dir%\cpp-torch"


mkdir %dir%\build\cpp-torch\fns
cd %dir%\build\cpp-torch\fns
cmake -G "Visual Studio 14 2015 Win64" -DCMAKE_PREFIX_PATH="%dest%" "%dir%\cpp-torch\example\fns"


cd %dir%
