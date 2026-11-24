@echo off
REM PATHIKS ESP32 - Setup ESP-IDF Environment Only
REM Run this, then you can use idf.py commands manually

echo ========================================
echo PATHIKS ESP32 - Environment Setup
echo ========================================
echo.
echo Setting up ESP-IDF v5.5.5 environment...
echo.

set IDF_PATH=C:\Espressif\frameworks\esp-idf-v5.5.5
call %IDF_PATH%\export.bat

echo.
echo ========================================
echo Environment Ready!
echo ========================================
echo.
echo You can now use idf.py commands:
echo   idf.py build           - Build firmware
echo   idf.py -p COM17 flash  - Flash to ESP32
echo   idf.py -p COM17 monitor - Serial monitor
echo   idf.py fullclean       - Clean build files
echo.
echo This window will stay open for you to run commands.
echo ========================================
echo.

REM Keep the window open with CMD prompt
cmd /k
