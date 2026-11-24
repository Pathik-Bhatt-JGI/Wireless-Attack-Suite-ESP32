# PATHIKS ESP32 - Flash Instructions

## ✅ Quick Flash Method (Recommended)

### Option 1: Use the Batch Script (Easiest)
1. **Connect your ESP32 DevKit V1** to USB port COM17
2. **Double-click** `FLASH_PATHIKS.bat`
3. Wait for the script to:
   - Set up ESP-IDF environment
   - Clean previous builds
   - Build the firmware
   - Flash to ESP32
   - Open serial monitor
4. **Done!** Your PATHIKS device is ready

---

## 🔨 Manual Build & Flash Method

If you prefer to do it manually in PowerShell or CMD:

### Step 1: Open PowerShell or CMD
Navigate to project folder:
```cmd
cd C:\Users\pathi\Downloads\final_build_with_button_attacks\final_build_with_button_attacks
```

### Step 2: Set up ESP-IDF Environment
```cmd
C:\Espressif\frameworks\esp-idf-v5.5.5\export.bat
```
*Note: This loads the `idf.py` command and all ESP-IDF tools*

### Step 3: Clean Previous Build
```cmd
idf.py fullclean
```

### Step 4: Build Firmware
```cmd
idf.py build
```
*This takes 2-5 minutes depending on your PC*

### Step 5: Flash to ESP32
```cmd
idf.py -p COM17 flash
```

### Step 6: Monitor Serial Output (Optional)
```cmd
idf.py -p COM17 monitor
```
*Press `Ctrl+]` to exit monitor*

---

## 🛠️ Troubleshooting

### Error: "idf.py is not recognized"
**Solution:** You forgot to run the export.bat script:
```cmd
C:\Espressif\frameworks\esp-idf-v5.5.5\export.bat
```

### Error: "Failed to connect to ESP32"
**Solutions:**
1. Check ESP32 is plugged in to USB
2. Verify COM port (Device Manager → Ports)
3. Try different USB cable
4. Press and hold BOOT button on ESP32, then run flash command
5. Try different COM port: `idf.py -p COM3 flash` (or COM4, COM5, etc.)

### Error: "Permission denied on COM17"
**Solutions:**
1. Close any serial monitors or Arduino IDE
2. Unplug and replug ESP32
3. Restart your computer

### Build Errors: "hydra_ssd1306_display.h not found"
**This should NOT happen** - all files have been renamed to `pathiks_ssd1306_display.h`
- Double-check you're in the correct project folder
- Run `BUILD_ONLY.bat` to test the build

### SPIFFS Storage Error
If you see SPIFFS errors during build:
```cmd
idf.py fullclean
idf.py build
```

---

## 📋 What's Included

### Batch Scripts:
- **FLASH_PATHIKS.bat** - Complete build + flash + monitor (all-in-one)
- **BUILD_ONLY.bat** - Build firmware only (no flash)

### PATHIKS Features:
- 🖕 **Middle Finger Logo** on boot (128x64 bitmap)
- 📡 **WiFi Attacks**: Deauth, PMKID, Handshake, Beacon Spam, Evil Twin, etc.
- 🔵 **Bluetooth Attacks**: BT Spam, BT Payload
- 🖥️ **OLED Display**: Real-time attack status (if connected)
- 🌐 **Web Interface**: Control via browser at 192.168.4.1

### Default Settings:
- **WiFi SSID**: `pathiks` (password: `12345678`)
- **Bluetooth Name**: `PATHIKS-{RandomNumber}`
- **Web Interface**: http://192.168.4.1
- **Serial Baud Rate**: 115200

---

## 🚀 After Flashing

1. **Power on ESP32** - You'll see the 🖕 logo on OLED display
2. **Connect to WiFi**:
   - SSID: `pathiks`
   - Password: `12345678`
3. **Open Web Interface**: http://192.168.4.1
4. **Start attacking!**

---

## 📝 Important Notes

- **ESP-IDF Version**: v5.5.5 required
- **Hardware**: ESP32 DevKit V1
- **COM Port**: COM17 (adjust if different)
- **First build takes longer** - Subsequent builds are faster
- **All "Hydra" references removed** - This is now PATHIKS

---

## ⚠️ Legal Disclaimer

PATHIKS is for educational purposes and authorized security testing only. 
Unauthorized attacks on networks you don't own is illegal. Use responsibly.

---

**Questions?** Check the error messages carefully - they usually tell you exactly what's wrong!
