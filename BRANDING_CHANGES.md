# PATHIKS - Branding Changes Summary

## Overview
This document lists all the changes made to rebrand the project from "Hydra" to "PATHIKS" with custom personalization.

## Modified Files

### 1. Display Files (OLED Screen)
- **Created**: `main/display/pathiks_logo.h` - New custom logo with stylized "P" design
- **Modified**: `main/display/hydra_ssd1306_display.c`
  - Changed logo include from `hydra_logo.h` to `pathiks_logo.h`
  - Updated all screen text from "HYDRA-ESP" / "HYDRA" to "PATHIKS"
  - Changed "HYDRA ONLINE" to "PATHIKS ONLINE"
  - Changed "HYDRA MENU" to "PATHIKS MENU"
  - Updated boot animation text
  - Updated logo bitmap reference

### 2. Web Interface Files
- **Modified**: `data/index.html`
  - Page title changed from "HydraESP" to "PATHIKS"
  - Disclaimer header changed from "Hydra-ESP" to "PATHIKS"
  - All references to "Hydra-ESP" and "HydraESP" replaced with "PATHIKS"
  
- **Modified**: `data/style.css`
  - Header comment changed from "ProjectHydraOS" to "PATHIKS"

- **Modified**: `data/devil_twin/index.html`
  - Footer copyright changed from "HydraCorp Networks" to "PATHIKS Networks"

### 3. Project Configuration
- **Modified**: `CMakeLists.txt`
  - Project name changed from `projecthydra-32` to `pathiks-esp32`

- **Modified**: `_config.yml`
  - Title changed from "ProjectHydra" to "PATHIKS"

### 4. Documentation
- **Modified**: `README.md`
  - Main heading changed from "Hydra-ESP" to "PATHIKS"
  - Removed old logo image reference
  - Added personalization note: "Personalized Edition by Pathiks"
  - Changed default SSID from "hydra" to "pathiks"
  - Changed BT Payload device name from "Hydra-RandomNumber" to "PATHIKS-RandomNumber"
  - Updated all descriptive text to reference PATHIKS instead of Hydra

## What Appears on the OLED Display

When your ESP32 boots up with an OLED display connected, you will see:

1. **Boot Animation** (4 seconds):
   - Custom PATHIKS logo with stylized "P" design

2. **Boot Text** (1.8 seconds):
   - Large text showing "PATHIKS"

3. **Standby Screen (Not Connected)**:
   - Title: "PATHIKS"
   - Text: "Not connected"
   - Instructions: "Connect Wi-Fi: 192.168.4.1"

4. **Standby Screen (Connected)**:
   - Title: "CONNECTED"
   - Text: "PATHIKS ONLINE"
   - Signal strength bars (animated)
   - IP address and "ARMED" indicator

5. **Menu Navigation**:
   - Title: "PATHIKS MENU"
   - Options for WiFi/Bluetooth attacks
   - Button controls displayed

6. **Attack Running**:
   - Shows attack name
   - Displays countdown timer
   - Progress bar visualization

## Web Interface Branding

When you connect to the device and visit `http://192.168.4.1`:

- Browser tab title: "PATHIKS"
- Disclaimer screen: "PATHIKS v1.1.3 — Authorised Use Only"
- All interface elements reference PATHIKS
- Footer: "© 2026 PATHIKS Networks. All rights reserved."

## Bluetooth Branding

When using BT Payload attack:
- Device advertises as: "PATHIKS-[RandomNumber]"

## Default WiFi Credentials

- **SSID**: `pathiks`
- **Password**: `notforfun`
- **Web Interface**: `http://192.168.4.1`

## Logo Design

The new PATHIKS logo features:
- Stylized "P" letter with cyber aesthetic
- Sleek, modern bitmap design optimized for 128x64 OLED
- Black background with white foreground for OLED displays
- Custom hand-crafted bitmap array for perfect pixel clarity

## Next Steps

To build and flash this personalized firmware:

1. Make sure you have ESP-IDF installed
2. Navigate to the project directory
3. Run: `idf.py build`
4. Flash to your ESP32: `idf.py -p [PORT] flash`
5. Connect to WiFi SSID "pathiks" with password "notforfun"
6. Open browser to `http://192.168.4.1`

---

**Created by**: Pathiks
**Date**: August 8, 2026
**Version**: 1.1.3 (PATHIKS Edition)
