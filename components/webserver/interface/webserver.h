#ifndef WEBSERVER_H
#define WEBSERVER_H

#include <stdint.h>
#include "esp_event.h"
#include "attack.h"

ESP_EVENT_DECLARE_BASE(WEBSERVER_EVENTS);

enum {
    WEBSERVER_EVENT_ATTACK_REQUEST,
    WEBSERVER_EVENT_ATTACK_RESET
};

void webserver_run();
void webserver_stop(void);
void webserver_storage_init(void);


#endif
