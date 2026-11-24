@echo off
REM PATHIKS ESP32 Flash Script
REM This script sets up ESP-IDF environment and flashes the firmware

echo ========================================
echo PATHIKS ESP32 - Flash Script
echo ========================================
echo.

REM Set ESP-IDF path
set IDF_PATH=C:\Espressif\frameworks\esp-idf-v5.5.5

echo [1/5] Setting up ESP-IDF environment...
call %IDF_PATH%\export.bat

echo.
echo [2/5] Cleaning previous build...
idf.py fullclean

echo.
echo [3/5] Building PATHIKS firmware...
idf.py build

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ========================================
    echo BUILD FAILED!
    echo ========================================
    pause
    exit /b 1
)

echo.
echo [4/5] Flashing to ESP32 on COM17...
idf.py -p COM17 flash

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ========================================
    echo FLASH FAILED!
    echo ========================================
    pause
    exit /b 1
)

echo.
echo [5/5] Opening serial monitor...
idf.py -p COM17 monitor

pause
