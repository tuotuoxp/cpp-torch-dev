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


mkdir %dir%\build\TH
cd %dir%\build\TH
cmake -G "NMake Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="%dest%" "%dir%\torch7\lib\TH"
nmake
nmake install


mkdir %dir%\build\THNN
cd %dir%\build\THNN
cmake -G "NMake Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="%dest%" -DCMAKE_INSTALL_PREFIX="%dest%" "%dir%\nn\lib\THNN"
nmake
nmake install


cd %dir%
