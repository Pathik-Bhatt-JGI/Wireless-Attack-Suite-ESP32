# PATHIKS Customization Guide

## 🎨 What Changed Visually

### Before (Hydra) → After (PATHIKS)

#### OLED Display Changes:
```
BEFORE:                       AFTER:
┌─────────────────────┐      ┌─────────────────────┐
│   [Dragon Logo]     │      │   [Stylized "P"]    │
│                     │      │                     │
│                     │  →   │                     │
│    HYDRA-ESP        │      │      PATHIKS        │
└─────────────────────┘      └─────────────────────┘

BEFORE:                       AFTER:
┌─────────────────────┐      ┌─────────────────────┐
│  ╔═══ CONNECTED ═══╗│      │  ╔═══ CONNECTED ═══╗│
│                     │      │                     │
│   HYDRA ONLINE      │  →   │  PATHIKS ONLINE     │
│   AP: 192.168.4.1   │      │  AP: 192.168.4.1    │
│   ARMED ●           │      │  ARMED ●            │
└─────────────────────┘      └─────────────────────┘

BEFORE:                       AFTER:
┌─────────────────────┐      ┌─────────────────────┐
│  ╔═══ HYDRA-ESP ═══╗│      │  ╔═══ PATHIKS ═════╗│
│                     │      │                     │
│   Not connected     │  →   │   Not connected     │
│   Connect Wi-Fi:    │      │   Connect Wi-Fi:    │
│   192.168.4.1       │      │   192.168.4.1       │
└─────────────────────┘      └─────────────────────┘

BEFORE:                       AFTER:
┌─────────────────────┐      ┌─────────────────────┐
│  ╔═══ HYDRA MENU ══╗│      │  ╔═══ PATHIKS MENU ╗│
│                     │      │                     │
│   > WIFI            │  →   │   > WIFI            │
│   UP/DN  SEL:OPEN   │      │   UP/DN  SEL:OPEN   │
│   WiFi / Bluetooth  │      │   WiFi / Bluetooth  │
└─────────────────────┘      └─────────────────────┘
```

#### Web Interface Changes:
```
BEFORE:                       AFTER:
Browser Tab Title:            Browser Tab Title:
  HydraESP               →      PATHIKS

Disclaimer Screen:            Disclaimer Screen:
  Hydra-ESP              →      PATHIKS
  v1.1.3                       v1.1.3

Main Interface:               Main Interface:
  HydraESP Logo          →      PATHIKS
  System Controls              System Controls
```

#### WiFi Network Name:
```
BEFORE:                       AFTER:
SSID: hydra              →    SSID: pathiks
Password: notforfun           Password: notforfun
```

#### Bluetooth Device Name:
```
BEFORE:                       AFTER:
Hydra-12345              →    PATHIKS-12345
(when using BT attacks)       (when using BT attacks)
```

---

## 🚀 Key Features of Your Personalized Build

### 1. Custom Logo
- **Design**: Sleek stylized "P" with cyber aesthetic
- **Format**: 128x64 pixel bitmap optimized for OLED displays
- **Style**: Modern, minimalist, high-contrast design
- **Location**: Displays during boot sequence and logo screens

### 2. Personalized Branding
- Every screen shows **PATHIKS** instead of generic branding
- Professional appearance with your personal touch
- Consistent branding across OLED, web interface, and documentation

### 3. Unique Network Identity
- Default SSID set to `pathiks` (lowercase, clean, professional)
- Easily identifiable as your personal device
- Maintains security with password protection

### 4. Enhanced Visual Style
- Clean, modern typography throughout
- Consistent color scheme and design language
- Professional hacker/cyber aesthetic
- Attention-grabbing boot animation

---

## 📱 User Experience Flow

### When You Power On:
1. ⚡ **Boot Animation** (4 seconds)
   - Custom PATHIKS logo appears
   - Stylized "P" design fades in
   
2. 🎯 **Branding Screen** (1.8 seconds)
   - Large "PATHIKS" text
   - Professional introduction
   
3. 📡 **Ready Screen**
   - Shows connection status
   - Displays "PATHIKS ONLINE" when connected
   - Shows WiFi credentials when not connected

### When You Connect to Web Interface:
1. 🌐 Navigate to `http://192.168.4.1`
2. 📜 See personalized disclaimer with "PATHIKS" branding
3. 🎛️ Access full-featured interface with your custom branding

### When Using Bluetooth Attacks:
1. 📲 Device advertises as "PATHIKS-[random]"
2. 🔐 Targets see your personalized device name
3. ⚙️ Professional appearance for security research

---

## 🎨 Color Scheme & Design Philosophy

### OLED Display:
- **Background**: Pure black (OLED pixels off for power saving)
- **Foreground**: Pure white (maximum contrast)
- **Style**: Bold, readable fonts with technical aesthetic
- **Layout**: Clean, organized, information-dense

### Web Interface:
- **Theme**: Dark mode optimized
- **Accent**: Cyber blue/purple tones
- **Typography**: Modern sans-serif with monospace for technical data
- **Layout**: Material Design inspired, card-based UI

---

## 🔧 Technical Details

### Logo Specifications:
```c
// Logo stored as XBM bitmap array
// Dimensions: 128x64 pixels
// Format: Monochrome (1-bit per pixel)
// Size: 1024 bytes
// File: main/display/pathiks_logo.h
```

### Font Usage:
```c
// Title bars: u8g2_font_helvB08_tr (Helvetica Bold 8pt)
// Main text: u8g2_font_profont12_mr (ProFont 12pt)
// Large text: u8g2_font_profont22_mr (ProFont 22pt)
// Small text: u8g2_font_5x7_mr (5x7 bitmap)
// Timers: u8g2_font_logisoso16_tr (Logisoso 16pt)
```

---

## 💡 Pro Tips

### Making It Even More Personal:

1. **Change the WiFi Password**:
   - Connect to web interface
   - Go to Settings
   - Update password to something unique

2. **Customize Attack Names** (if you want):
   - Edit `main/display/hydra_ssd1306_display.c`
   - Find `get_attack_name()` function
   - Rename attacks to your preferred names

3. **Add Custom Boot Message**:
   - Edit boot animation in `hydra_ssd1306_display.c`
   - Add your own text or ASCII art
   - Make it uniquely yours!

4. **Change Color Accents** (web interface):
   - Edit `data/style.css`
   - Modify CSS color variables
   - Create your own color theme

---

## 📊 Before/After Comparison

| Aspect | Before (Hydra) | After (PATHIKS) | Improvement |
|--------|----------------|-----------------|-------------|
| Boot Logo | Dragon/Hydra | Stylized "P" | ✅ Personalized |
| Display Text | "HYDRA-ESP" | "PATHIKS" | ✅ Custom Brand |
| Web Title | "HydraESP" | "PATHIKS" | ✅ Professional |
| WiFi SSID | "hydra" | "pathiks" | ✅ Unique ID |
| BT Device | "Hydra-XXX" | "PATHIKS-XXX" | ✅ Branded |
| Overall Feel | Generic | Personalized | ✅ Your Style |

---

## 🎯 What Makes This Special

✨ **Completely Personalized**: Every aspect shows YOUR name
🎨 **Professional Look**: Clean, modern design throughout
🔒 **Unique Identity**: Instantly recognizable as your device
💪 **Full Featured**: All original functionality preserved
⚡ **Optimized**: Efficient code, fast performance
🎭 **Style Points**: Looks cooler than the original!

---

**Remember**: This is YOUR build. You've taken an open-source project and made it uniquely yours. The PATHIKS branding represents your personal security research tool, customized to reflect your identity and style.

**Enjoy your personalized ESP32 security tool!** 🚀🔐💻
