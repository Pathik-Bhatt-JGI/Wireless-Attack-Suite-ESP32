# 🧪 PATHIKS - Practical Testing Guide

## 🎯 How to Actually Test Each Attack

---

## Test 1: WPA Handshake Capture (Easiest to Verify)

### What You Need:
- Your own WiFi router
- A phone or laptop connected to that router
- The ESP32 running PATHIKS

### Step-by-Step Test:
```
1. Flash ESP32 with PATHIKS firmware
2. Power on ESP32
3. Connect to WiFi: "pathiks" / "notforfun"
4. Open browser: http://192.168.4.1
5. Click "Scan" - wait for networks to appear
6. Select YOUR router from the list
7. Click "WPA Handshake" attack
8. Set timeout: 60 seconds
9. Click Start

WHAT SHOULD HAPPEN:
→ Web interface shows "Waiting for handshake..."
→ Your phone/laptop disconnects from WiFi
→ Your phone/laptop reconnects automatically
→ Web interface shows "Handshake captured!"
→ Download link appears for .pcap file
```

### How to Verify the Capture:
```
METHOD 1 - Check file size:
- Download the .pcap file
- File should be 500+ bytes (not empty)

METHOD 2 - Use Wireshark (if you have it):
- Open .pcap in Wireshark
- Type filter: eapol
- Should see 4 packets (Message 1, 2, 3, 4)

METHOD 3 - Try to crack it (proof it works):
- Download Hashcat
- Run: hashcat -m 22000 capture.pcap wordlist.txt
- If Hashcat accepts it, the capture is valid!
```

### Success Indicators:
- ✅ Device disconnects from WiFi
- ✅ Device reconnects within 10-30 seconds
- ✅ Status changes to "Handshake captured!"
- ✅ PCAP file is created and downloadable
- ✅ File size is more than 0 bytes

### Failure Indicators:
- ❌ Stuck on "waiting..." forever (>2 minutes)
- ❌ Device never disconnects
- ❌ No file is created
- ❌ File is 0 bytes
- ❌ Shows error message

---

## Test 2: PMKID Capture (Quickest to Test)

### What You Need:
- Your own WiFi router (WPA2, not WPA3)
- ESP32 running PATHIKS

### Step-by-Step Test:
```
1. Connect to ESP32: http://192.168.4.1
2. Scan for networks
3. Select YOUR router
4. Click "PMKID Capture"
5. Click Start

WHAT SHOULD HAPPEN:
→ Attack starts immediately
→ Completes in 5-10 seconds
→ Shows "PMKID found!" OR "No PMKID"
→ If found, download link appears
```

### How to Verify:
```
METHOD 1 - Quick check:
- If attack completes in <10 seconds = working
- If download link appears = PMKID found
- Download and check file size > 0

METHOD 2 - Serial monitor:
idf.py -p COM3 monitor
Look for: "PMKID captured from [MAC]"

METHOD 3 - File validation:
- Open .hccapx in hex editor
- Should contain router MAC address
- Should not be all zeros
```

### Success Indicators:
- ✅ Completes quickly (5-15 seconds)
- ✅ Shows "PMKID captured!"
- ✅ File is created
- ✅ File contains data (not 0 bytes)

### Failure Indicators:
- ❌ Always shows "No PMKID found"
- ❌ Takes too long (>30 seconds)
- ❌ No file created
- ❌ ESP32 crashes/reboots

### Note:
Some routers DON'T support PMKID:
- WPA3 routers
- Very old routers (pre-2016)
- Routers with updated firmware
This is NORMAL - not a bug!

---

## Test 3: Probe Attack (Easy to See)

### What You Need:
- ESP32 running PATHIKS
- WiFi Analyzer app on your phone
  (Download: "WiFi Analyzer" from app store)

### Step-by-Step Test:
```
1. Download WiFi Analyzer app on phone
2. Open app and watch WiFi list
3. Start "Probe Attack" on ESP32
4. Set timeout: 30 seconds
5. Watch your phone's WiFi Analyzer

WHAT SHOULD HAPPEN:
→ Lots of activity in WiFi analyzer
→ Many "probe request" packets
→ WiFi scanning may slow down
→ Some fake device names appear
```

### Visual Test (No Tools Needed):
```
1. Start Probe Attack on ESP32
2. On another phone, go to WiFi settings
3. Watch the WiFi list
4. You should notice:
   - List refreshes slower
   - Some weird device names
   - More activity than usual
```

### How to Verify:
```
METHOD 1 - WiFi Analyzer:
- Download app on phone
- Open during probe attack
- Should see tons of activity
- Graph shows increased traffic

METHOD 2 - Your phone's WiFi:
- Open WiFi settings
- Turn WiFi off and on
- Should take longer to scan
- May see unusual SSIDs

METHOD 3 - Serial monitor:
idf.py -p COM3 monitor
Look for: "Sending probe request..."
```

### Success Indicators:
- ✅ WiFi Analyzer shows increased activity
- ✅ WiFi scanning slows down
- ✅ Timer counts down properly
- ✅ Can see impact on nearby devices

### Failure Indicators:
- ❌ No change in WiFi behavior
- ❌ Timer doesn't start
- ❌ No activity in WiFi Analyzer
- ❌ ESP32 reboots

---

## Test 4: BT Payload (Most Visual)

### What You Need:
- ESP32 running PATHIKS
- Windows PC with Bluetooth
- OR Android phone

### Step-by-Step Test (SAFE):
```
1. Open NOTEPAD on your PC first
2. Have it visible on screen
3. Start "BT Payload" attack on ESP32
4. On Windows PC:
   Settings → Bluetooth → Add device
5. Look for "PATHIKS-12345" (or similar)
6. Click to pair
7. WATCH YOUR SCREEN!

WHAT SHOULD HAPPEN:
→ Pairs as "HID Keyboard"
→ Starts typing automatically!
→ Opens Run dialog (Win+R)
→ Types "notepad"
→ Opens Notepad and types text
```

### Visual Test:
```
YOU WILL LITERALLY SEE IT TYPING!

Example sequence:
1. Windows Run dialog opens (Win+R)
2. Text appears: "notepad"
3. Notepad opens
4. Text types automatically: "PATHIKS was here!"
```

### How to Verify:
```
METHOD 1 - Bluetooth pairing:
- Device "PATHIKS-XXXXX" appears in list
- Shows as "Keyboard" device type
- Pairs without PIN
- Connected status shows "Connected"

METHOD 2 - Watch the typing:
- Pair with device
- LITERALLY WATCH as it types
- Programs open automatically
- Commands execute on their own

METHOD 3 - OLED shows:
Before: "Waiting for pair..."
After: "Connected! Sending..."
```

### Success Indicators:
- ✅ Device appears in Bluetooth list
- ✅ Pairs as HID Keyboard
- ✅ Typing happens automatically
- ✅ Programs open by themselves
- ✅ Text appears in windows

### Failure Indicators:
- ❌ Device doesn't appear
- ❌ Pairing fails with error
- ❌ Pairs but nothing happens
- ❌ ESP32 reboots when pairing
- ❌ No typing occurs

### Safety Note:
```
⚠️  Test on YOUR OWN PC only!
⚠️  Close important programs first
⚠️  Be ready to disconnect Bluetooth quickly
⚠️  Don't test on work computers
⚠️  Payload can execute system commands!
```

---

## 🔍 Debugging: Check Serial Monitor

For ANY attack that's not working:

```bash
# Connect ESP32 via USB cable
# Open terminal and run:
idf.py -p COM3 monitor

# Press Ctrl+] to exit when done
```

### What to Look For:

**Good signs:**
```
I (1234) wifi: Attack started
I (1234) wifi: Sending deauth packets
I (1234) wifi: Handshake captured
I (1234) bt: Device connected
```

**Bad signs:**
```
E (1234) wifi: Failed to start attack
E (1234) wifi: Channel switch failed
E (1234) bt: Bluetooth init failed
Guru Meditation Error (crash)
```

---

## 📊 Quick Results Table

| Attack | Test Time | Success Sign | File Created |
|--------|-----------|--------------|--------------|
| **WPA Handshake** | 30-120 sec | Device disconnects/reconnects | Yes (.pcap) |
| **PMKID** | 5-15 sec | Quick completion | Yes (.hccapx) |
| **Probe** | 30 sec | WiFi interference visible | No |
| **BT Payload** | Instant | Auto-typing occurs | No |

---

## 🎬 Video Evidence (How to Record Test)

### Record Your Test:
```
1. Start screen recording on phone
2. Show WiFi/Bluetooth list
3. Start attack on ESP32
4. Record the results
5. Shows proof it's working!

For WPA Handshake:
- Record phone disconnecting from WiFi
- Show reconnection
- Show download link appearing

For BT Payload:
- Record Bluetooth pairing process
- Record automatic typing
- Shows programs opening
```

---

## 🚨 Common Issues & Fixes

### Issue: "No handshake captured"
```
Fix:
- Move ESP32 closer to router
- Make sure device is connected to target
- Wait longer (try 2-3 minutes)
- Try different target network
```

### Issue: "PMKID not found"
```
Fix:
- Router may not support it (normal)
- Try different router
- Check router isn't WPA3
- Some routers disable this
```

### Issue: "Probe attack has no effect"
```
Fix:
- Check WiFi Analyzer is running
- Move closer to test device
- Increase attack duration
- Check serial monitor for errors
```

### Issue: "BT device won't pair"
```
Fix:
- Restart ESP32
- Delete all Bluetooth devices on PC
- Clear Bluetooth cache
- Try different PC/phone
- Check ESP32 has power
```

---

## 💡 Pro Testing Tips

### For Best Results:

1. **Test Range:**
   - Keep ESP32 within 10 feet of target
   - Closer = better results
   - Obstacles reduce effectiveness

2. **Monitor Everything:**
   - Serial monitor on PC
   - OLED on ESP32
   - Web interface status
   - Target device behavior

3. **One Attack at a Time:**
   - Don't run multiple attacks
   - Wait for one to complete
   - Restart ESP32 between tests

4. **Know Your Target:**
   - WPA2 works better than WPA3
   - 2.4GHz easier than 5GHz
   - Newer routers may block attacks

---

## ✅ Final Verification Checklist

Before asking "is it working?":

- [ ] ESP32 powers on and shows logo
- [ ] Can connect to "pathiks" WiFi
- [ ] Web interface loads at 192.168.4.1
- [ ] Networks appear in scan results
- [ ] Can select target network
- [ ] Attack starts (status changes)
- [ ] Timer counts down (if applicable)
- [ ] See expected behavior on target
- [ ] Check serial monitor for errors
- [ ] File downloads (for capture attacks)

If ALL checkboxes pass → IT'S WORKING! ✅
If ANY fail → Check that specific component

---

**Remember:** Not all attacks work on all targets. Router security features, distance, interference, and device compatibility all affect results. This is normal!

**Need help?** Read the serial monitor output - it tells you exactly what's happening.
