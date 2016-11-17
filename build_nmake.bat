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


mkdir %dir%\build\cpp-torch-nmake
cd %dir%\build\cpp-torch-nmake
if "%CUDA_PATH%" == "" (
    set cuda_param=OFF
) else (
    set cuda_param=ON
)
cmake -G "NMake Makefiles" -DBUILD_CUDA=%cuda_param% -DCMAKE_PREFIX_PATH="%dest%" -DCMAKE_INSTALL_PREFIX="%dest%" "%dir%\cpp-torch"
nmake
nmake install


cd %dir%
