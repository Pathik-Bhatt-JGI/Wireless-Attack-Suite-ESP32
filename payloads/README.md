# ⚠️ WARNING: PAYLOAD EXAMPLES

## 🔴 CRITICAL NOTICE

These files are **PROOF-OF-CONCEPT EXAMPLES** for educational purposes only.

**DO NOT USE THESE PAYLOADS ON SYSTEMS YOU DO NOT OWN OR WITHOUT EXPLICIT WRITTEN PERMISSION.**

---

## What These Payloads Do

The scripts in this directory demonstrate how the ESP32 can deliver commands via Bluetooth HID (keyboard emulation) to target systems. These are **potentially harmful** if misused.

### `win_prank.ps1`
- Downloads and sets Windows wallpaper without user consent
- Creates multiple files on the desktop
- Uses Windows text-to-speech to deliver audio messages
- Displays fake system error dialogs
- Downloads external content from the internet

---

## Legal and Ethical Warnings

### 🚫 Unauthorized Use is Illegal

Using these payloads without authorization may violate:
- Computer Fraud and Abuse Act (CFAA) - United States
- Computer Misuse Act - United Kingdom  
- IT Act 2000 - India/Bangladesh
- Anti-hacking laws in your jurisdiction
- Terms of service and acceptable use policies

### ⚖️ Potential Consequences
- Criminal prosecution
- Civil lawsuits
- Fines and imprisonment
- Academic/professional expulsion
- Permanent criminal record

---

## Responsible Use Guidelines

✅ **ONLY use these payloads when:**
1. You own the target system
2. You have explicit written authorization
3. You are in a controlled lab environment
4. The target has given informed consent

❌ **NEVER use these payloads to:**
- Prank friends, family, or coworkers
- Disrupt business operations
- Access systems without permission
- Demonstrate "hacking skills"
- Cause harm or distress to others

---

## Modifying Payloads

If you create your own payloads:
1. **Test in a VM first** - Never test on live systems
2. **Add safeguards** - Implement confirmation dialogs
3. **Document clearly** - Explain what the payload does
4. **Minimize harm** - Avoid destructive or irreversible actions
5. **Get permission** - Always obtain written authorization

---

## Recommended Harmless Alternative

Instead of the prank script, consider this safe demonstration:

```powershell
# safe_demo.ps1 - Harmless demonstration payload
$voice = New-Object -ComObject SAPI.SpVoice
$voice.Speak("Hello! This is a demonstration of Bluetooth HID capability.")
Write-Host "PATHIKS demonstration complete. No system modifications made."
```

---

## Disclaimer

The author of PATHIKS accepts **NO LIABILITY** for misuse of these examples. 

**You are solely responsible** for ensuring your use complies with all applicable laws, regulations, and ethical standards.

If you do not understand these warnings or cannot commit to responsible use, **DELETE THIS DIRECTORY IMMEDIATELY**.

---

## Need Help?

If you're unsure whether your intended use is legal or ethical:
1. Consult with a legal professional
2. Contact your organization's IT security team
3. Review your institution's acceptable use policy
4. When in doubt, DON'T DO IT

**Security research must be conducted ethically and legally.**

---

**Last Updated:** 2026-11-24  
**Project:** PATHIKS ESP32 Wi-Fi Security Tool  
**Maintainer:** Pathik Bhatt
