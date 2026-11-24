@echo off
REM PATHIKS ESP32 Build Only Script (No Flash)

echo ========================================
echo PATHIKS ESP32 - Build Only
echo ========================================
echo.

REM Set ESP-IDF path
set IDF_PATH=C:\Espressif\frameworks\esp-idf-v5.5.5

echo [1/3] Setting up ESP-IDF environment...
call %IDF_PATH%\export.bat

echo.
echo [2/3] Cleaning previous build...
idf.py fullclean

echo.
echo [3/3] Building PATHIKS firmware...
idf.py build

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ========================================
    echo BUILD FAILED!
    echo Check the error messages above.
    echo ========================================
    pause
    exit /b 1
)

echo.
echo ========================================
echo BUILD SUCCESS!
echo To flash: Run FLASH_PATHIKS.bat
echo Or use: idf.py -p COM17 flash
echo ========================================
pause
