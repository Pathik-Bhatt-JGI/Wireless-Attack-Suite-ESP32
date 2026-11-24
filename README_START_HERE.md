# PATHIKS ESP32 - READ ME FIRST! 🚀

**WiFi & Bluetooth Security Testing Device for ESP32**

---

## 🎯 WHAT IS THIS?

PATHIKS is a custom ESP32 firmware for WiFi and Bluetooth security testing. It features:
- **Custom Branding:** Complete rebrand with PATHIKS name and middle finger logo 🖕
- **WiFi Attacks:** Deauth, PMKID, WPA Handshake capture, Beacon spam
- **Bluetooth Attacks:** BLE scanner, spammer, payload attacks
- **OLED Display:** 128x64 SSD1306 display with custom graphics
- **Web Interface:** Control via WiFi AP at 192.168.4.1

**Hardware:** ESP32 DevKit V1 with SSD1306 OLED display  
**Software:** ESP-IDF v5.5.5  
**Status:** ✅ READY TO FLASH

---

## ⚡ FLASH IT IN 3 STEPS (60 SECONDS)

### STEP 1: Open ESP-IDF CMD
- Open Start Menu
- Search: **"ESP-IDF 5.5 CMD"** or **"ESP-IDF 5.5 PowerShell"**
- Click to open

### STEP 2: Navigate to Project
```
cd C:\Users\pathi\Downloads\final_build_with_button_attacks\final_build_with_button_attacks
```

### STEP 3: Run Build Script
```
SIMPLE_BUILD_FLASH.bat
```

**Wait 3-5 minutes. Done!** ✅

---

## 📚 DOCUMENTATION GUIDE

### 🚀 New User? Read These First:
1. **FLASH_IN_3_STEPS.txt** - Visual 3-step guide (1 min)
2. **CHEAT_SHEET.txt** - One-page quick reference (30 sec)
3. **START_HERE.txt** - Quick overview (2 min)

### 🛠️ Having Build Issues?
- **PYTHON_ENV_FIX_GUIDE.md** - Fix Python 3.13 error
- **WHICH_FILE_TO_RUN.txt** - Which script to use
- **TROUBLESHOOTING_FIXES.md** - Common problems

### 📖 Want Complete Documentation?
- **COMPLETE_PROJECT_STATUS.md** - Everything explained (500+ lines)
- **DOCUMENTATION_INDEX.md** - Index of all documentation
- **ALL_FIXED_READY_TO_FLASH.txt** - Summary of fixes

### ⚔️ Want to Understand Attacks?
- **ATTACK_EXPLAINED.md** - How each attack works
- **TESTING_GUIDE.md** - How to test attacks
- **WHAT_TO_EXPECT.md** - Expected behavior

---

## 🔧 BUILD SCRIPTS

| Script | Use When |
|--------|----------|
| **SIMPLE_BUILD_FLASH.bat** ⭐ | ESP-IDF CMD (recommended) |
| **FIX_PYTHON_ENV.bat** | Fix Python 3.13 error first |
| **FINAL_FIX_BUILD_FLASH.bat** | Regular CMD after Python fix |

---

## ✅ WHAT'S BEEN DONE

- ✅ **Complete Rebrand:** Hydra → PATHIKS (all files, code, UI)
- ✅ **Custom Logo:** Middle finger emoji 🖕 on boot
- ✅ **Memory Fix:** IRAM overflow fixed with size optimization
- ✅ **SPIFFS Workaround:** Disabled to fix partition issue
- ✅ **Python Fix:** Solutions for Python 3.13 → 3.11 issue
- ✅ **Build Scripts:** 3 different methods to build
- ✅ **Documentation:** 30+ files covering everything

---

## ⚠️ KNOWN ISSUES (Runtime, Not Build)

These attacks may not work correctly - firmware will build and flash successfully:

- ❌ **WPA Handshake:** ESP32 restarts after EAPOL 3/4
- ❌ **PMKID:** Runs forever, no timeout
- ❌ **Deauth:** Not sending packets
- ❌ **BT Payload:** Display crashes

---

## 🎨 WHAT YOU'LL SEE AFTER FLASH

### On Display:
1. Middle finger logo 🖕
2. "PATHIKS ONLINE"
3. "PATHIKS MENU"

### WiFi:
- **SSID:** `pathiks`
- **Password:** `pathiksesp32`
- **IP:** 192.168.4.1

### Bluetooth:
- **Name:** `PATHIKS-XXXX` (random number)
- **Status:** Scannable

---

## 🚨 TROUBLESHOOTING

| Problem | Solution |
|---------|----------|
| "Python 3.13 not found" | Run `FIX_PYTHON_ENV.bat` |
| "idf.py not recognized" | Use ESP-IDF CMD, not regular CMD |
| Build fails | Delete `sdkconfig`, rebuild |
| Wrong COM port | Edit .bat file, change COM17 |
| Display blank | Check I2C wiring (SDA, SCL) |

**Detailed help:** Read `PYTHON_ENV_FIX_GUIDE.md`

---

## 📊 PROJECT INFO

| Item | Value |
|------|-------|
| **Hardware** | ESP32 DevKit V1 |
| **Display** | SSD1306 128x64 OLED |
| **COM Port** | COM17 |
| **ESP-IDF** | v5.5.5 |
| **Python** | 3.11 |
| **Optimization** | -Os (size) |
| **WiFi SSID** | "pathiks" |
| **BT Name** | "PATHIKS-XXXX" |

---

## 🗺️ NAVIGATION MAP

```
           [WANT TO FLASH?]
                  |
         +--------+--------+
         |                 |
    EASY WAY          FIX PYTHON
         |                 |
         V                 V
  FLASH_IN_3_STEPS   FIX_PYTHON_ENV
         |                 |
         V                 V
  SIMPLE_BUILD       FINAL_FIX_BUILD
    _FLASH.bat         _FLASH.bat
         |                 |
         +--------+--------+
                  |
                  V
            [SUCCESS! 🎉]
```

---

## 💡 QUICK START CHECKLIST

- [ ] ESP-IDF v5.5.5 installed
- [ ] ESP32 connected to USB (COM17)
- [ ] Opened "ESP-IDF 5.5 CMD" from Start Menu
- [ ] Navigated to project folder
- [ ] Ran `SIMPLE_BUILD_FLASH.bat`
- [ ] Waited 3-5 minutes
- [ ] Saw middle finger logo on display
- [ ] Connected to "pathiks" WiFi
- [ ] Ready to test attacks!

---

## 📞 WHERE TO GO FROM HERE

### First Time User:
1. Read: `FLASH_IN_3_STEPS.txt`
2. Follow the 3 steps
3. Verify display shows logo
4. Read: `ATTACK_EXPLAINED.md`
5. Start testing!

### Having Issues:
1. Read: `PYTHON_ENV_FIX_GUIDE.md`
2. Run: `FIX_PYTHON_ENV.bat`
3. Read: `TROUBLESHOOTING_FIXES.md`

### Want to Learn More:
1. Read: `COMPLETE_PROJECT_STATUS.md`
2. Read: `DOCUMENTATION_INDEX.md`
3. Explore other .md files

---

## 🎓 FILES YOU NEED TO KNOW

### Must Read:
- **FLASH_IN_3_STEPS.txt** - Fastest way to flash
- **CHEAT_SHEET.txt** - Quick reference card
- **SIMPLE_BUILD_FLASH.bat** - The script to run

### If Issues:
- **PYTHON_ENV_FIX_GUIDE.md** - Python problems
- **WHICH_FILE_TO_RUN.txt** - Script selection

### For Learning:
- **COMPLETE_PROJECT_STATUS.md** - Everything
- **DOCUMENTATION_INDEX.md** - All docs listed

---

## 🏆 SUCCESS CRITERIA

You'll know it works when:
- ✅ Display shows middle finger logo
- ✅ Display shows "PATHIKS ONLINE"
- ✅ WiFi AP "pathiks" is broadcasting
- ✅ Bluetooth device "PATHIKS-XXXX" is scannable
- ✅ Serial monitor shows boot messages

---

## 📦 WHAT'S INCLUDED

```
Project/
├── main/                    (Source code)
├── components/              (Libraries)
├── data/                    (Web interface files)
├── *.bat                    (Build scripts)
├── FLASH_IN_3_STEPS.txt    (Quick guide)
├── CHEAT_SHEET.txt         (Quick ref)
├── COMPLETE_PROJECT_STATUS.md (Everything)
└── [30+ documentation files]
```

---

## 🚀 READY TO START?

**Read:** `FLASH_IN_3_STEPS.txt`  
**Run:** `SIMPLE_BUILD_FLASH.bat` from ESP-IDF CMD  
**Time:** 3-5 minutes  
**Result:** Working PATHIKS device! 🎉

---

## ⚡ TL;DR (Too Long; Didn't Read)

1. Open "ESP-IDF 5.5 CMD" from Start Menu
2. `cd C:\Users\pathi\Downloads\final_build_with_button_attacks\final_build_with_button_attacks`
3. `SIMPLE_BUILD_FLASH.bat`
4. Wait
5. Done!

---

## 📝 VERSION & STATUS

**Version:** 1.0  
**Date:** 2026-08-08  
**Status:** ✅ READY TO FLASH  
**Tests:** Build system ready, runtime tests pending  

---

## 🤝 WHAT'S NEXT

After successful flash:
1. Verify hardware works
2. Test WiFi attacks
3. Test Bluetooth attacks
4. Document which attacks work
5. Fix runtime issues (if needed)
6. Upload SPIFFS web files (optional)

---

## 🎯 YOUR NEXT ACTION

**→ Read `FLASH_IN_3_STEPS.txt` and follow the steps!**

---

*PATHIKS ESP32 - WiFi & Bluetooth Security Testing*  
*Ready to flash. Ready to test. Ready to go.* 🚀

---
