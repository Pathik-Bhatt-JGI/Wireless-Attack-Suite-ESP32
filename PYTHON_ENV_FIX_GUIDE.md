# PYTHON ENVIRONMENT FIX GUIDE

## THE PROBLEM
ESP-IDF is looking for Python 3.13 but your system has Python 3.11.
Error: `ESP-IDF Python virtual environment "C:\Espressif\python_env\idf5.5_py3.13_env\Scripts\python.exe" not found`

## THE SOLUTION - 3 OPTIONS

---

### ✅ OPTION 1: USE ESP-IDF COMMAND PROMPT (RECOMMENDED - EASIEST!)

This is the **EASIEST** and most reliable method:

1. **Open Start Menu** and search for **"ESP-IDF 5.5 CMD"** or **"ESP-IDF 5.5 PowerShell"**
   - This shortcut was created when you installed ESP-IDF
   - It automatically sets up the environment for you

2. **Navigate to your project:**
   ```
   cd C:\Users\pathi\Downloads\final_build_with_button_attacks\final_build_with_button_attacks
   ```

3. **Run the simple build script:**
   ```
   SIMPLE_BUILD_FLASH.bat
   ```

That's it! The ESP-IDF CMD/PowerShell already has everything configured.

---

### ⚙️ OPTION 2: FIX THE PYTHON ENVIRONMENT (AUTOMATIC)

If you want to run builds from any command prompt:

1. **Run the fix script:**
   ```
   FIX_PYTHON_ENV.bat
   ```

2. **Wait for it to complete** (2-3 minutes)
   - It will delete the broken Python 3.13 environment
   - It will recreate the environment with Python 3.11

3. **Then run:**
   ```
   FINAL_FIX_BUILD_FLASH.bat
   ```

---

### 🛠️ OPTION 3: MANUAL FIX (FOR ADVANCED USERS)

If the automatic fix doesn't work:

1. **Delete the broken environment:**
   ```
   rmdir /s /q C:\Espressif\python_env\idf5.5_py3.13_env
   ```

2. **Navigate to ESP-IDF:**
   ```
   cd C:\Espressif\frameworks\esp-idf-v5.5.5
   ```

3. **Reinstall tools:**
   ```
   install.bat
   ```

4. **Go back to your project:**
   ```
   cd C:\Users\pathi\Downloads\final_build_with_button_attacks\final_build_with_button_attacks
   ```

5. **Setup environment and build:**
   ```
   C:\Espressif\frameworks\esp-idf-v5.5.5\export.bat
   del sdkconfig
   rmdir /s /q build
   idf.py build
   idf.py -p COM17 flash monitor
   ```

---

## WHAT EACH SCRIPT DOES

### FIX_PYTHON_ENV.bat
- Removes the broken Python 3.13 virtual environment
- Runs ESP-IDF install.bat to recreate with Python 3.11
- One-time fix

### SIMPLE_BUILD_FLASH.bat
- **USE THIS!** Assumes you're running from ESP-IDF CMD/PowerShell
- Cleans old config
- Builds with size optimization
- Flashes to COM17
- Opens serial monitor
- **No environment setup needed if run from ESP-IDF CMD**

### FINAL_FIX_BUILD_FLASH.bat
- Tries to set up environment automatically
- Then builds and flashes
- Use this if you want to run from regular CMD (after fixing Python env)

---

## RECOMMENDED WORKFLOW

**EASIEST WAY:**
1. Open **"ESP-IDF 5.5 CMD"** from Start Menu
2. Run: `cd C:\Users\pathi\Downloads\final_build_with_button_attacks\final_build_with_button_attacks`
3. Run: `SIMPLE_BUILD_FLASH.bat`
4. Done!

**IF YOU WANT TO USE REGULAR CMD:**
1. Run `FIX_PYTHON_ENV.bat` (one time only)
2. Run `FINAL_FIX_BUILD_FLASH.bat` (any time you want to build)

---

## TROUBLESHOOTING

**Q: "idf.py is not recognized as a command"**
A: You're not in ESP-IDF environment. Use Option 1 (ESP-IDF CMD) or run the export.bat first.

**Q: Build still fails with memory overflow**
A: The sdkconfig.defaults has size optimization. Make sure sdkconfig is deleted before building.

**Q: Python 3.11 not found**
A: Install Python 3.11 from python.org or check if it's in your PATH.

**Q: Which COM port do I use?**
A: Current setting is COM17. Change it in the .bat files if your ESP32 is on a different port.

---

## AFTER SUCCESSFUL FLASH

You'll see the PATHIKS boot logo (middle finger emoji) on the display, then:
- "PATHIKS ONLINE"
- "PATHIKS MENU"
- WiFi SSID: "pathiks"
- BT name: "PATHIKS-XXXX"

The web interface files need to be uploaded separately (SPIFFS is disabled).

---

## NEXT TIME YOU WANT TO BUILD

Just open **ESP-IDF 5.5 CMD** and run:
```
cd C:\Users\pathi\Downloads\final_build_with_button_attacks\final_build_with_button_attacks
idf.py build
idf.py -p COM17 flash monitor
```

Or use `SIMPLE_BUILD_FLASH.bat` for convenience.
