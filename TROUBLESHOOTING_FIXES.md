# 🔧 PATHIKS - Critical Issues & Fixes

## 🚨 Your Reported Problems:

1. ❌ **WPA Handshake** - ESP32 restarts after EAPOL 3/4
2. ❌ **PMKID** - Runs forever, won't stop, must power off
3. ❌ **Deauth** - Not working at all
4. ❌ **Probe Attack** - Shows "ch: 5" and weird network names
5. ❌ **BT Payload** - Display restarts/crashes when pressed

---

## 🔴 ISSUE #1: ESP32 Restarts After Handshake

### What's Happening:
```
You see:
→ "WPA Handshake running..."
→ "EAPOL 3/4" (got handshake packets!)
→ Then ESP32 suddenly restarts/reboots
→ Lose the captured handshake
```

### Root Cause:
**MEMORY OVERFLOW** - ESP32 runs out of RAM trying to save the capture file

### Fix Options:

#### **Option A: Reduce Packet Buffer (Quick Fix)**
```c
// File: main/wifi/attack_handshake.c (or similar)
// Find this line (around line 50-100):
#define PACKET_BUFFER_SIZE 4096

// CHANGE TO:
#define PACKET_BUFFER_SIZE 2048
// Or even smaller: 1024
```

#### **Option B: Disable Display During Capture**
The OLED display uses RAM. Temporarily disable it during attacks:
```c
// File: main/display/hydra_ssd1306_display.c
// In the function: hydra_display_task()
// Add this at the start:

if (attack_is_running()) {
    vTaskDelay(pdMS_TO_TICKS(5000)); // Sleep during attack
    continue;
}
```

#### **Option C: Save to SD Card Instead**
If you have an SD card module, configure it to save there instead of RAM.

#### **Quick Test Without Code Change:**
```
1. Start handshake attack
2. When you see "EAPOL 3/4"
3. IMMEDIATELY power off ESP32
4. Power back on
5. The partial capture might be saved
```

---

## 🔴 ISSUE #2: PMKID Runs Forever

### What's Happening:
```
You see:
→ "Attack running..."
→ "Power off ESP32 to stop"
→ Runs continuously, never stops
→ Web interface disconnected
→ Must physically power off
```

### Root Cause:
**INFINITE LOOP BUG** - The attack doesn't have proper timeout logic

### Fix:

#### **Option A: Add Timeout in Code**
```c
// File: main/wifi/attack_pmkid.c
// Find the main attack loop

// ADD THIS:
int timeout_seconds = 60; // 60 second timeout
int elapsed = 0;

while(running) {
    // existing code...
    
    elapsed++;
    if(elapsed >= timeout_seconds) {
        running = false; // Force stop
        break;
    }
    
    vTaskDelay(pdMS_TO_TICKS(1000));
}
```

#### **Option B: Use Web Interface Stop Button**
Before starting PMKID:
```
1. Open web interface
2. Keep browser open on that tab
3. Start PMKID attack
4. Use the "Stop Attack" button in web UI
```

#### **Option C: Use OLED Buttons**
If you have buttons connected (GPIO 25, 26, 27):
```
Press SELECT button to stop attack
```

#### **Temporary Workaround:**
Set a shorter test time:
```
1. Edit sdkconfig
2. Find: CONFIG_ATTACK_TIMEOUT
3. Set to: 30 (seconds)
4. Rebuild firmware
```

---

## 🔴 ISSUE #3: Deauth Not Working

### What's Happening:
```
You start deauth attack:
→ Nothing happens
→ Target devices stay connected
→ No disconnections visible
→ Attack appears to do nothing
```

### Root Cause:
**CHANNEL MISMATCH** or **802.11w PROTECTION**

### Diagnostic Check:

#### Step 1: Check Serial Monitor
```bash
idf.py -p COM3 monitor

Look for:
✓ "Deauth started on channel X"
✗ "Channel switch failed"
✗ "Failed to send packet"
```

#### Step 2: Verify Channel
```
Your router is on channel: X
ESP32 must be on same channel!

Check web interface shows:
"Target: [Router Name] - Ch: 6" (example)
```

### Fixes:

#### **Fix A: Manual Channel Lock**
```c
// File: main/wifi/attack_dos.c
// Add before sending deauth:

esp_wifi_set_channel(target_channel, WIFI_SECOND_CHAN_NONE);
vTaskDelay(pdMS_TO_TICKS(100)); // Let it settle
```

#### **Fix B: Increase Packet Send Rate**
```c
// File: main/wifi/attack_dos.c
// Find the packet sending loop:

for(int i = 0; i < 10; i++) { // CHANGE to 50 or 100
    send_deauth_packet();
    vTaskDelay(pdMS_TO_TICKS(10)); // REDUCE to 1
}
```

#### **Fix C: Check Target Protection**
Some devices have 802.11w (Management Frame Protection):
```
Modern devices (2019+) may ignore deauth
Try these targets instead:
✓ Older Android phones
✓ IoT devices
✓ Smart TVs
✗ iPhone 11+ (has 802.11w)
✗ Modern Windows laptops
```

#### **Quick Test:**
```
1. Connect an OLD Android phone to your WiFi
2. Keep it close to ESP32 (< 5 feet)
3. Run deauth attack
4. Watch if phone disconnects

If phone disconnects → Deauth WORKS!
If nothing happens → Check channel/code
```

---

## 🔴 ISSUE #4: Probe Attack Strange Output

### What You're Seeing:
```
Display shows:
→ "ch: 5"
→ "found airtel something"
→ Weird network names appearing
→ Don't understand what it's doing
```

### **This is NORMAL!** Here's What It Means:

#### "ch: 5" = Channel 5
```
The ESP32 is scanning WiFi channel 5
It cycles through channels 1-13
This is expected behavior!
```

#### "found airtel something" = Probe Response
```
The attack is working!
"airtel" is a network name (SSID)
The probe attack found devices that remember "airtel" networks
This means PEOPLE NEARBY previously connected to Airtel WiFi

What it's doing:
1. ESP32 sends out probe requests
2. Nearby devices respond with networks they remember
3. ESP32 displays these network names
4. Reveals people's WiFi history!
```

### What Probe Attack Actually Does:

```
Purpose: Discover hidden networks and device WiFi history

How:
1. Sends probe requests for common SSIDs
2. Devices respond: "I remember that network!"
3. Shows what networks people nearby connected to
4. Reveals:
   - Home network names
   - Work WiFi names
   - Coffee shop networks
   - Hotel WiFi they used
```

### Expected Output:
```
ch: 1 → Scanning channel 1
ch: 2 → Scanning channel 2
found: "Starbucks WiFi"
found: "Home_Network_5G"
found: "Airport_Free_WiFi"

Each = Someone nearby connected to that network before!
```

### **Probe Attack IS WORKING!** ✅
If you see network names appearing, it's doing its job correctly.

---

## 🔴 ISSUE #5: BT Payload Crashes/Restarts Display

### What's Happening:
```
You click BT Payload:
→ Display shows loading
→ Then suddenly restarts
→ ESP32 reboots or display resets
→ BT attack doesn't work
```

### Root Cause:
**BLUETOOTH STACK MEMORY CONFLICT** - BT and WiFi fighting for resources

### Fixes:

#### **Fix A: Increase BT Stack Size**
```c
// File: main/bt/attack_bt_payload.c (or main.c)
// Find BT task creation:

xTaskCreate(bt_task, "bt_task", 
    4096,  // CHANGE THIS to 8192 or 16384
    NULL, 5, NULL);
```

#### **Fix B: Stop WiFi Before Starting BT**
```c
// File: main/bt/attack_bt_payload.c
// At start of BT attack function:

esp_wifi_stop(); // Stop WiFi first
vTaskDelay(pdMS_TO_TICKS(1000)); // Wait
// Now start BT...
```

#### **Fix C: Disable Display for BT Attacks**
```c
// File: main/display/hydra_ssd1306_display.c
// Add check:

if(bt_attack_running) {
    display_enabled = false; // Disable temporarily
}
```

#### **Fix D: Check Power Supply**
BT uses more power than WiFi!
```
Problem: USB power not enough
Solution:
→ Use external 5V power supply
→ Or USB cable with thicker wires
→ Or powered USB hub
```

### Quick Test:
```bash
# Check serial monitor when starting BT:
idf.py -p COM3 monitor

Look for:
✓ "BT initialized"
✓ "BT advertising started"
✗ "BT init failed"
✗ "ESP_ERR_NO_MEM" (out of memory)
✗ "Guru Meditation Error" (crash)
```

---

## 🔧 CRITICAL FIXES TO APPLY NOW

### Fix #1: Increase ESP32 Memory Partition

Edit `partitions.csv`:
```csv
# Before:
storage, data, spiffs, 0x310000, 0xF0000,

# After (give more space):
storage, data, spiffs, 0x310000, 0x50000,
```

Then rebuild:
```bash
idf.py build
idf.py flash
```

### Fix #2: Reduce OLED Updates
```c
// File: main/display/hydra_ssd1306_display.c
// Change update frequency:

// FROM:
vTaskDelay(pdMS_TO_TICKS(1000)); // Update every 1 sec

// TO:
vTaskDelay(pdMS_TO_TICKS(2000)); // Update every 2 sec
```

### Fix #3: Add Watchdog Reset
```c
// File: main/main.c
// Add at start of app_main():

esp_task_wdt_init(30, true); // 30 second watchdog
esp_task_wdt_add(NULL);
```

---

## 📊 Your Issues Summary & Status

| Issue | Severity | Cause | Fix Difficulty |
|-------|----------|-------|----------------|
| WPA Restart | 🔴 CRITICAL | Memory overflow | MEDIUM |
| PMKID Infinite | 🟡 HIGH | No timeout | EASY |
| Deauth Fails | 🟡 HIGH | Channel/protection | MEDIUM |
| Probe Display | 🟢 NORMAL | **Working correctly!** | N/A |
| BT Crash | 🔴 CRITICAL | Memory/power | HARD |

---

## 🚀 Quick Emergency Fixes (No Code Change)

### For WPA Handshake Crash:
```
1. Don't use OLED during handshake
2. Power ESP32 with external 5V supply
3. Try capturing shorter time (30 sec)
4. Restart ESP32 before each attempt
```

### For PMKID Infinite Loop:
```
1. Keep web browser open
2. Use Stop button in web UI
3. Or wait 5 minutes then power cycle
4. Check if file was saved before stopping
```

### For Deauth Not Working:
```
1. Test on your own old Android phone
2. Keep ESP32 within 5 feet
3. Make sure target is 2.4GHz (not 5GHz)
4. Try different channel/network
```

### For BT Payload Crash:
```
1. Use external 5V 2A power adapter
2. Don't use OLED when running BT
3. Close all other attacks first
4. Try without OLED connected
```

---

## 🔍 Diagnostic Commands

### Check Memory Usage:
```bash
idf.py -p COM3 monitor

# In running ESP32, type:
# (None - need to add debug print in code)

# Or check build output:
idf.py size

Look for:
Total sizes:
DRAM .data size:   XXXXX bytes
DRAM .bss  size:   XXXXX bytes
```

### Check Crash Logs:
```bash
# After ESP32 crashes and restarts:
idf.py -p COM3 monitor

Look for:
Guru Meditation Error: Core X panic'ed (reason)
```

---

## 💡 Recommended Actions (Priority Order)

### 1. **Fix Memory Issues** (Most Important)
```
→ Increase partition sizes
→ Reduce buffer sizes
→ Disable OLED during attacks
```

### 2. **Add Timeouts to Attacks**
```
→ PMKID: 60 second max
→ Handshake: 120 second max
→ Deauth: 30 second default
```

### 3. **Improve Power Supply**
```
→ Use 5V 2A adapter
→ Not just USB from PC
→ Especially for BT attacks
```

### 4. **Test Systematically**
```
→ One attack at a time
→ Restart ESP32 between tests
→ Monitor serial output
→ Keep notes of what works
```

---

## 📝 Should You Reflash?

**YES, if:**
- Multiple attacks crash
- ESP32 restarts randomly
- Memory errors in serial log
- BT never works

**Reflash Steps:**
```bash
# Full erase first:
idf.py -p COM3 erase_flash

# Then flash fresh:
idf.py -p COM3 flash

# Monitor to verify:
idf.py -p COM3 monitor
```

---

**Bottom Line:**  
Your firmware has memory/stability issues. The Probe Attack IS working (that's normal output). The other attacks need code fixes or better power supply. Start with the emergency fixes above, then apply code changes if needed.

**Want me to help fix specific code?** Let me know which attack is most important to you!
