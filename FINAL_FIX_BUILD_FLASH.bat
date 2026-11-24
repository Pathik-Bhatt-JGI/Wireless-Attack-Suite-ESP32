@echo off
REM PATHIKS - FINAL FIX AND FLASH

echo ╔═══════════════════════════════════════════════════════════════════════╗
echo ║                   PATHIKS - FINAL FIX AND FLASH                       ║
echo ╚═══════════════════════════════════════════════════════════════════════╝
echo.

set IDF_PATH=C:\Espressif\frameworks\esp-idf-v5.5.5

echo [1/7] Setting up ESP-IDF environment...
REM Only export, don't reinstall
call %IDF_PATH%\export.bat

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ERROR: Failed to setup ESP-IDF environment
    pause
    exit /b 1
)

echo.
echo [2/7] Deleting old configuration...
del sdkconfig 2>nul

echo.
echo [3/7] Cleaning build directory...
rmdir /s /q build 2>nul

echo.
echo [4/7] Configuring project (size optimized)...
idf.py reconfigure

echo.
echo [5/7] Building firmware (this will take 3-5 minutes)...
idf.py build

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ╔═══════════════════════════════════════════════════════════════════════╗
    echo ║                         BUILD FAILED!                                 ║
    echo ╚═══════════════════════════════════════════════════════════════════════╝
    echo.
    echo Check the error messages above.
    echo.
    pause
    exit /b 1
)

echo.
echo [6/7] Flashing to ESP32 on COM17...
idf.py -p COM17 flash

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ╔═══════════════════════════════════════════════════════════════════════╗
    echo ║                         FLASH FAILED!                                 ║
    echo ╚═══════════════════════════════════════════════════════════════════════╝
    echo.
    pause
    exit /b 1
)

echo.
echo [7/7] Opening serial monitor...
echo Press Ctrl+] to exit monitor
echo.
idf.py -p COM17 monitor

pause
