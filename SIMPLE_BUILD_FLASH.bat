@echo off
REM PATHIKS - SIMPLE BUILD AND FLASH (requires ESP-IDF already set up)

echo ╔═══════════════════════════════════════════════════════════════════════╗
echo ║                   PATHIKS - SIMPLE BUILD AND FLASH                    ║
echo ╚═══════════════════════════════════════════════════════════════════════╝
echo.
echo IMPORTANT: Run this from "ESP-IDF 5.5 CMD" or "ESP-IDF 5.5 PowerShell"
echo            from your Start Menu, NOT from a regular command prompt!
echo.
pause

echo.
echo [1/4] Deleting old configuration...
del sdkconfig 2>nul

echo.
echo [2/4] Cleaning build directory...
rmdir /s /q build 2>nul

echo.
echo [3/4] Building firmware (size optimized, 3-5 minutes)...
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
echo [4/4] Flashing to ESP32 on COM17...
idf.py -p COM17 flash monitor

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ╔═══════════════════════════════════════════════════════════════════════╗
    echo ║                         FLASH FAILED!                                 ║
    echo ╚═══════════════════════════════════════════════════════════════════════╝
    echo.
    pause
    exit /b 1
)

pause
