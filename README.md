# Wireless Attack Suite ESP32

ESP32-based wireless security research firmware with BLE and Wi-Fi attack capabilities.

## Features

- **Wi-Fi Attacks**: Deauthentication, handshake capture, PMKID capture, Evil Twin, beacon spam
- **BLE Attacks**: Device spoofing (Apple, Samsung, Google proximity pairing)
- **Bluetooth HID**: Keyboard emulation payload delivery
- **Detection**: Real-time deauth attack detector
- **Display**: Optional SSD1306 OLED support

## Hardware

- ESP32 DevKit V1 (or compatible ESP32 board)
- Optional: SSD1306 128x64 OLED display (I2C)

## Quick Start

1. Install [ESP-IDF 5.5](https://docs.espressif.com/projects/esp-idf/en/stable/get-started/)
2. Clone this repository
3. Build and flash:
   ```bash
   idf.py build
   idf.py -p COM_PORT flash monitor
   ```

## Default Credentials

- **SSID**: `pathiks`
- **Password**: `notforfun`
- **Web UI**: `http://192.168.4.1`

## Usage

1. Connect to the ESP32 AP
2. Open `http://192.168.4.1` in browser
3. Select attacks from web interface
4. Configure and launch

## Legal Notice

**Educational and authorized security testing only.**

Unauthorized network testing is illegal under:
- Computer Fraud and Abuse Act (US)
- Computer Misuse Act (UK)  
- IT Act 2000 (India/Bangladesh)
- Similar laws worldwide

**You are solely responsible for ensuring your use complies with applicable laws.**

## Credits

- **Original**: [risinek/esp32-wifi-penetration-tool](https://github.com/risinek/esp32-wifi-penetration-tool)
- **Inspiration**: [spacehuhn/esp8266_deauther](https://github.com/SpacehuhnTech/esp8266_deauther)
- **BLE Components**: [EvilAppleJuice-ESP32](https://github.com/ckcr4lyf/EvilAppleJuice-ESP32)

## License

MIT License - See LICENSE file for details.

---

**Use responsibly. Always obtain explicit authorization before testing.**
