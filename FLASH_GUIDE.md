# 🔥 Complete Flashing Guide for ESP32 DevKit V1

## 📋 Prerequisites

### What You Need:
1. ✅ ESP32 DevKit V1 board
2. ✅ USB cable (micro USB)
3. ✅ Windows PC
4. ✅ ESP-IDF installed

---

## 🚀 Quick Flash (If ESP-IDF Already Installed)

### Step 1: Open Terminal
```bash
# Open Command Prompt or PowerShell
# Press Windows + R, type "cmd", press Enter
```

### Step 2: Navigate to Project
```bash
cd C:\Users\pathi\Downloads\final_build_with_button_attacks\final_build_with_button_attacks
```

### Step 3: Build the Firmware
```bash
idf.py build
```

### Step 4: Connect ESP32
- Plug ESP32 into USB port
- Check which COM port (Device Manager → Ports)
- Usually COM3, COM4, COM5, etc.

### Step 5: Flash
```bash
# Replace COM3 with your actual port
idf.py -p COM3 flash

# Or use automatic port detection:
idf.py flash
```

### Step 6: Monitor (Optional)
```bash
idf.py -p COM3 monitor
# Press Ctrl+] to exit
```

**Done! ESP32 will reboot with middle finger logo! 🖕**

---

## 📥 Full Setup (If ESP-IDF NOT Installed)

### Method 1: Using ESP-IDF (Recommended)

#### Step 1: Download ESP-IDF
```
1. Go to: https://dl.espressif.com/dl/esp-idf/
2. Download: ESP-IDF Tools Installer (Windows)
3. File name: esp-idf-tools-setup-x.x.x.exe
4. Run the installer
```

#### Step 2: Install ESP-IDF
```
1. Run esp-idf-tools-setup-x.x.x.exe
2. Choose "Express Installation"
3. Select ESP-IDF version: v5.0 or newer
4. Click "Install"
5. Wait 10-30 minutes (downloads ~2GB)
```

#### Step 3: Open ESP-IDF Command Prompt
```
1. Search Windows: "ESP-IDF PowerShell"
   OR
   "ESP-IDF Command Prompt"
2. Click to open
3. You'll see ESP-IDF logo
```

#### Step 4: Navigate to Project
```bash
cd C:\Users\pathi\Downloads\final_build_with_button_attacks\final_build_with_button_attacks
```

#### Step 5: Build
```bash
idf.py build
```

**Expected output:**
```
Project build complete. To flash, run:
  idf.py flash
```

#### Step 6: Check COM Port
```
Option A - Device Manager:
1. Open Device Manager (Windows + X → Device Manager)
2. Expand "Ports (COM & LPT)"
3. Look for: "USB-SERIAL CH340" or "CP210x" or "FTDI"
4. Note the COM number (e.g., COM3)

Option B - Command:
idf.py -p COM3 flash
# Try COM3, COM4, COM5 until one works
```

#### Step 7: Flash
```bash
# Method 1 - Specify port:
idf.py -p COM3 flash

# Method 2 - Auto-detect:
idf.py flash

# Method 3 - Flash and monitor:
idf.py -p COM3 flash monitor
```

**Flashing process:**
```
→ Connecting to COM3
→ Chip type: ESP32
→ Erasing flash
→ Writing bootloader
→ Writing partition table
→ Writing firmware
→ Hard resetting via RTS pin
→ Done!
```

---

### Method 2: Using Pre-built Binaries (Easier)

#### Step 1: Build First (One Time)
```bash
cd C:\Users\pathi\Downloads\final_build_with_button_attacks\final_build_with_button_attacks
idf.py build
```

#### Step 2: Find Binary Files
After building, binaries are in:
```
build/pathiks-esp32.bin
build/bootloader/bootloader.bin
build/partition_table/partition-table.bin
```

#### Step 3: Download Flash Tool
```
1. Go to: https://www.espressif.com/en/support/download/other-tools
2. Download: "Flash Download Tools (ESP8266 & ESP32 & ESP32-S2)"
3. Extract the ZIP file
4. Run: flash_download_tool_x.x.x.exe
```

#### Step 4: Use Flash Tool
```
1. Click "Developer Mode"
2. Click "ESP32 DownloadTool"
3. Add files with addresses:

   Address                File
   --------               ----
   0x1000                 bootloader.bin
   0x8000                 partition-table.bin
   0x10000                pathiks-esp32.bin

4. Select COM port
5. Set SPI SPEED: 40MHz
6. Set SPI MODE: DIO
7. Click "START"
8. Wait for "FINISH"
```

---

## 🔍 Troubleshooting

### Issue: "No serial port detected"

**Fix:**
```
1. Install CH340 driver:
   Download from: http://www.wch.cn/downloads/CH341SER_ZIP.html
   Or: https://sparks.gogo.co.nz/ch340.html

2. Install CP210x driver:
   Download from: https://www.silabs.com/developers/usb-to-uart-bridge-vcp-drivers

3. Restart computer
4. Reconnect ESP32
```

### Issue: "Failed to connect"

**Fix:**
```
1. Hold BOOT button on ESP32
2. Run flash command
3. Release BOOT when connecting
4. Or press BOOT + RST, release RST, release BOOT
```

### Issue: "Permission denied on COM port"

**Fix:**
```
1. Close Arduino IDE (if open)
2. Close PuTTY/Serial Monitor
3. Close any terminal using COM port
4. Try again
```

### Issue: "Build failed - idf.py not found"

**Fix:**
```
1. You need to use ESP-IDF Command Prompt
2. Search Windows: "ESP-IDF PowerShell"
3. Don't use regular cmd/PowerShell
```

### Issue: "Chip not found"

**Fix:**
```
1. Try different USB cable (data cable, not charge-only)
2. Try different USB port
3. Check ESP32 has power (LED on)
4. Press BOOT button while connecting
```

---

## 🎯 Quick Commands Reference

### Build Only
```bash
idf.py build
```

### Flash Only (already built)
```bash
idf.py -p COM3 flash
```

### Clean Build (start fresh)
```bash
idf.py fullclean
idf.py build
```

### Flash + Monitor
```bash
idf.py -p COM3 flash monitor
```

### Erase Flash (complete wipe)
```bash
idf.py -p COM3 erase-flash
```

### Check Port
```bash
# Windows PowerShell
Get-WmiObject Win32_SerialPort | Select Name, DeviceID

# Or use Device Manager
```

---

## 📊 Build & Flash Time Estimates

| Task | Time | Notes |
|------|------|-------|
| Install ESP-IDF | 20-30 min | One-time only |
| First Build | 5-10 min | Compiles everything |
| Subsequent Builds | 30-60 sec | Only changed files |
| Flash Firmware | 10-30 sec | Upload to ESP32 |
| **Total First Time** | **25-40 min** | Including setup |
| **After Setup** | **1-2 min** | Just build + flash |

---

## 🔥 Step-by-Step First Flash

### Complete Beginner Steps:

**1. Install ESP-IDF (One time):**
```
→ Download installer from Espressif
→ Run installer (takes 20-30 minutes)
→ Reboot computer
```

**2. Open ESP-IDF Terminal:**
```
→ Search Windows: "ESP-IDF PowerShell"
→ Click to open
→ Terminal shows ESP-IDF version
```

**3. Navigate to Your Project:**
```bash
cd C:\Users\pathi\Downloads\final_build_with_button_attacks\final_build_with_button_attacks
```

**4. Build:**
```bash
idf.py build
```
*Wait 5-10 minutes first time*

**5. Connect ESP32:**
```
→ Plug USB cable into ESP32
→ Plug other end into PC
→ Wait for Windows to detect
→ Check Device Manager for COM port
```

**6. Flash:**
```bash
idf.py -p COM3 flash
```
*Replace COM3 with your port*

**7. Watch Boot:**
```
→ ESP32 restarts automatically
→ If OLED connected: see middle finger logo! 🖕
→ Then "PATHIKS" appears
→ Device is ready!
```

---

## 💡 Pro Tips

### Faster Development:
```bash
# Build, flash, and monitor in one command:
idf.py -p COM3 flash monitor

# Save typing - set default port:
idf.py set-target esp32
```

### If Build Fails:
```bash
# Clean and rebuild:
idf.py fullclean
idf.py build

# Or delete build folder manually:
rmdir /s build
idf.py build
```

### Multiple ESP32 Devices:
```bash
# Device 1:
idf.py -p COM3 flash

# Device 2:
idf.py -p COM4 flash

# Device 3:
idf.py -p COM5 flash
```

---

## 📱 What Happens After Flash

### Boot Sequence:
```
1. Power on ESP32
2. Bootloader starts (1 second)
3. Middle finger logo appears (4 seconds) 🖕
4. "PATHIKS" text shows (1.8 seconds)
5. WiFi starts
6. Creates AP: "pathiks" / "notforfun"
7. Web server starts at 192.168.4.1
8. Ready to use!
```

### First Connection:
```
1. On phone/laptop: Connect to WiFi "pathiks"
2. Password: "notforfun"
3. Open browser: http://192.168.4.1
4. See PATHIKS web interface
5. Start using attacks!
```

---

## ⚠️ Common Mistakes

### ❌ Wrong Terminal
```
WRONG: Regular Windows cmd/PowerShell
RIGHT: ESP-IDF PowerShell or ESP-IDF Command Prompt
```

### ❌ Wrong Directory
```
WRONG: C:\Users\pathi\Downloads
RIGHT: C:\Users\pathi\Downloads\final_build_with_button_attacks\final_build_with_button_attacks
```

### ❌ Wrong COM Port
```
WRONG: Guessing COM1, COM2
RIGHT: Check Device Manager for actual port
```

### ❌ USB Cable
```
WRONG: Charge-only cable (no data pins)
RIGHT: Data cable (came with phone usually)
```

---

## 🎉 Success Indicators

### Build Success:
```
✓ "Project build complete"
✓ No errors in red
✓ Binary files created in build/
✓ Total time shown
```

### Flash Success:
```
✓ "Connecting........"
✓ "Writing at 0x00000000"
✓ Progress bars fill up
✓ "Hash of data verified"
✓ "Hard resetting via RTS pin"
✓ ESP32 restarts automatically
```

### Device Running:
```
✓ OLED shows middle finger (if connected)
✓ LED on ESP32 is lit
✓ WiFi "pathiks" appears in networks
✓ Can connect and access 192.168.4.1
```

---

## 📞 Need Help?

### Check Serial Output:
```bash
idf.py -p COM3 monitor

Look for:
→ "PATHIKS booting..."
→ "WiFi started"
→ "Web server started"
→ IP address shown
```

### Get Detailed Logs:
```bash
idf.py -p COM3 flash monitor

Shows everything happening in real-time!
Press Ctrl+] to exit
```

---

## 🔄 Update Firmware Later

### To Update:
```bash
# 1. Make changes to code
# 2. Rebuild:
idf.py build

# 3. Flash:
idf.py -p COM3 flash

# Done! New firmware running
```

### To Restore Original:
```bash
# 1. Erase everything:
idf.py -p COM3 erase-flash

# 2. Flash fresh:
idf.py -p COM3 flash

# Starts with clean state
```

---

**You're ready to flash! Just follow the steps above! 🚀**

**Your middle finger logo awaits! 🖕💯**
