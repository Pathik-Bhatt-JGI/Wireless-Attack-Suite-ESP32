/**
 * @file pathiks_ssd1306_display.h
 * @date 2026-08-08
 * 
 * @brief PATHIKS Attack timeout or logging via SSD1306 display for user interface (optional)
 *
 * All u8g2 fonts: https://github.com/olikraus/u8g2/wiki/fntlistall
 */


#ifndef PATHIKS_LCD_DISPLAY_H
#define PATHIKS_LCD_DISPLAY_H

#include <stdbool.h>

#define I2C_SDA_GPIO    21
#define I2C_SCL_GPIO    22
#define SSD1306_I2C_ADDR 0x3C

// u8g2 display width/height (SSD1306 128x64)
#define OLED_WIDTH  128
#define OLED_HEIGHT 64

typedef enum {
    OLED_HEAD  = 0,   
    OLED_LINE1 = 1,   
    OLED_LINE2 = 2,   
} oled_row_t;


void pathiks_display_init(void);

/**
 * @brief Set an attack timeout for the countdown display.
 * @param timeout_sec Duration 
 */
void pathiks_display_set_attack_timeout(int timeout_sec);

/**
 * @brief Show a temporary popup on the OLED and log to serial.
 * @param row        
 * @param timeout_sec 
 * @param fmt        
 */
void oled_log(oled_row_t row, int timeout_sec, const char *fmt, ...);

/**
 * @brief Clear all popup buffers and dismiss the active popup.
 */
void oled_log_clear(void);

#endif 
