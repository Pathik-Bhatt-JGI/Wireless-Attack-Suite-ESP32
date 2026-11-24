@echo off
REM Build with limited parallelism for low-memory systems

echo ╔════════════════════════════════════════════════════════════════════╗
echo ║              LOW MEMORY BUILD - SLOWER BUT SAFER                   ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
echo This uses only 2 CPU cores to reduce memory usage.
echo Build will take longer but should complete successfully.
echo.
echo TIP: Close other programs (browsers, etc.) before continuing.
echo.
pause

echo [1/4] Deleting old configuration...
del sdkconfig 2>nul

echo.
echo [2/4] Cleaning build directory...
rmdir /s /q build 2>nul

echo.
echo [3/4] Building with 2 parallel jobs (5-10 minutes)...
set NINJA_ARGS=-j 2
idf.py build

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ╔════════════════════════════════════════════════════════════════════╗
    echo ║                         BUILD FAILED!                              ║
    echo ╚════════════════════════════════════════════════════════════════════╝
    echo.
    echo Try:
    echo 1. Close all other programs
    echo 2. Restart your computer
    echo 3. Run this script again
    echo.
    pause
    exit /b 1
)

echo.
echo [4/4] Flashing to COM17...
idf.py -p COM17 flash monitor

pause
