@echo off
REM Fix ESP-IDF Python Environment

echo ╔═══════════════════════════════════════════════════════════════════════╗
echo ║              FIXING ESP-IDF PYTHON ENVIRONMENT                        ║
echo ╚═══════════════════════════════════════════════════════════════════════╝
echo.
echo This will fix the Python virtual environment for ESP-IDF v5.5.5
echo.

set IDF_PATH=C:\Espressif\frameworks\esp-idf-v5.5.5

echo [1/2] Removing broken Python environment...
rmdir /s /q C:\Espressif\python_env\idf5.5_py3.13_env 2>nul

echo.
echo [2/2] Reinstalling ESP-IDF tools with correct Python version...
cd %IDF_PATH%
call install.bat

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ╔═══════════════════════════════════════════════════════════════════════╗
    echo ║                         INSTALLATION FAILED!                          ║
    echo ╚═══════════════════════════════════════════════════════════════════════╝
    echo.
    echo Make sure you have Python 3.11 installed and in your PATH
    echo.
    pause
    exit /b 1
)

echo.
echo ╔═══════════════════════════════════════════════════════════════════════╗
echo ║                    PYTHON ENVIRONMENT FIXED!                          ║
echo ╚═══════════════════════════════════════════════════════════════════════╝
echo.
echo Now you can run FINAL_FIX_BUILD_FLASH.bat
echo.
pause
