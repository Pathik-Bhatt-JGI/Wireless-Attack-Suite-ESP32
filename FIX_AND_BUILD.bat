@echo off
REM Quick fix for partition size issue

echo ╔════════════════════════════════════════════════════════════════════╗
echo ║              FIXING PARTITION SIZE AND REBUILDING                  ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
echo The app is too big for 1MB partition. Using 1.5MB partition instead.
echo.

echo [1/4] Deleting old configuration...
del sdkconfig 2>nul

echo.
echo [2/4] Cleaning build directory...
rmdir /s /q build 2>nul

echo.
echo [3/4] Building with custom partition table (3-5 minutes)...
idf.py build

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ╔════════════════════════════════════════════════════════════════════╗
    echo ║                         BUILD FAILED!                              ║
    echo ╚════════════════════════════════════════════════════════════════════╝
    echo.
    pause
    exit /b 1
)

echo.
echo [4/4] Flashing to COM17...
idf.py -p COM17 flash monitor

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ╔════════════════════════════════════════════════════════════════════╗
    echo ║                         FLASH FAILED!                              ║
    echo ╚════════════════════════════════════════════════════════════════════╝
    echo.
    pause
    exit /b 1
)

pause
