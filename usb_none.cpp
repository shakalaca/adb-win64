#include "sysdeps.h"

struct usb_handle {
};

ADB_MUTEX_DEFINE( usb_lock );

void usb_init() {
}

void usb_kick(usb_handle* handle) {
}


int usb_close(usb_handle* handle) {
}


int usb_write(usb_handle* handle, const void* data, int len) {
    return 0;
}


int usb_read(usb_handle *handle, void* data, int len) {
    return 0;
}
