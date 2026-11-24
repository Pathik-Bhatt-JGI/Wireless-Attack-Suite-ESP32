@echo off
REM PATHIKS - Fix Memory Overflow and Build

echo ========================================
echo PATHIKS - Fixing Memory Overflow
echo ========================================
echo.

set IDF_PATH=C:\Espressif\frameworks\esp-idf-v5.5.5

echo [1/6] Setting up ESP-IDF environment...
call %IDF_PATH%\export.bat

echo.
echo [2/6] Cleaning build...
rmdir /s /q build 2>nul

echo.
echo [3/6] Configuring memory optimization...
echo CONFIG_COMPILER_OPTIMIZATION_SIZE=y >> sdkconfig.defaults
echo CONFIG_COMPILER_OPTIMIZATION_PERF=n >> sdkconfig.defaults
echo CONFIG_BOOTLOADER_COMPILER_OPTIMIZATION_SIZE=y >> sdkconfig.defaults
echo # CONFIG_COMPILER_OPTIMIZATION_DEFAULT is not set >> sdkconfig.defaults
echo # CONFIG_COMPILER_OPTIMIZATION_PERF is not set >> sdkconfig.defaults

del sdkconfig 2>nul

echo.
echo [4/6] Regenerating configuration...
idf.py reconfigure

echo.
echo [5/6] Building with size optimization...
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
echo [6/6] Build successful!
echo.
echo ========================================
echo BUILD SUCCESS!
echo ========================================
echo.
echo To flash: idf.py -p COM17 flash
echo.
pause
