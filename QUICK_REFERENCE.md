# ⚡ PATHIKS - Quick Reference Card

## 🎯 What Changed in 30 Seconds

| Category | Before | After |
|----------|--------|-------|
| **Logo** | Dragon | Stylized "P" |
| **Display Name** | HYDRA-ESP | PATHIKS |
| **Web Title** | HydraESP | PATHIKS |
| **WiFi SSID** | hydra | pathiks |
| **BT Name** | Hydra-XXX | PATHIKS-XXX |
| **Project Name** | projecthydra-32 | pathiks-esp32 |

---

## 📱 What You'll See

### On OLED Display:
```
Boot:    [Custom "P" Logo] → "PATHIKS"
Idle:    "PATHIKS" / "Not connected"
Active:  "PATHIKS ONLINE" / "ARMED"
Menu:    "PATHIKS MENU"
```

### On Web Interface:
```
Tab:        PATHIKS
Header:     PATHIKS v1.1.3
Footer:     © 2026 PATHIKS Networks
```

---

## 🔧 Quick Commands

```bash
# Build firmware
idf.py build

# Flash to ESP32
idf.py -p COM[X] flash

# Build + Flash + Monitor
idf.py -p COM[X] flash monitor
```

---

## 🌐 Connection Info

```
SSID:     pathiks
Password: notforfun
Web UI:   http://192.168.4.1
```

---

## 📂 Key Files Modified

### Display:
- ✅ `main/display/pathiks_logo.h` (NEW)
- ✅ `main/display/hydra_ssd1306_display.c`

### Web:
- ✅ `data/index.html`
- ✅ `data/style.css`

### Config:
- ✅ `CMakeLists.txt`
- ✅ `README.md`

---

## 💡 Pro Tips

1. **Logo shows for 4 seconds on boot**
2. **All features work exactly the same**
3. **Default password still "notforfun"**
4. **Bluetooth attacks show "PATHIKS-12345"**
5. **Build time ~2-3 minutes**

---

## 🚀 Ultra Quick Start

```bash
# 1. Build
idf.py build

# 2. Flash
idf.py -p COM3 flash

# 3. Connect
# WiFi: pathiks / notforfun
# Browser: 192.168.4.1

# 4. Profit! 🎉
```

---

## 📊 Stats

- **Files Changed**: 11
- **New Files**: 4 (logo + docs)
- **Time to Build**: ~2-3 min
- **Time to Flash**: ~30 sec
- **Coolness Factor**: 💯

---

## 🎨 Visual Identity

```
  ██████╗  █████╗ ████████╗██╗  ██╗██╗██╗  ██╗███████╗
  ██╔══██╗██╔══██╗╚══██╔══╝██║  ██║██║██║ ██╔╝██╔════╝
  ██████╔╝███████║   ██║   ███████║██║█████╔╝ ███████╗
  ██╔═══╝ ██╔══██║   ██║   ██╔══██║██║██╔═██╗ ╚════██║
  ██║     ██║  ██║   ██║   ██║  ██║██║██║  ██╗███████║
  ╚═╝     ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝╚═╝  ╚═╝╚══════╝
```

Your personalized ESP32 security tool! 🔐

---

**Quick Docs**:
- Full details → `CHANGES_SUMMARY.md`
- Visual guide → `CUSTOMIZATION_GUIDE.md`
- Pretty intro → `PATHIKS_README.txt`

**Made by Pathiks** | Aug 2026 | v1.1.3
