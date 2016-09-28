#include <windows.h>
#include <usb100.h>
#include "adb_api.h"

ADBWIN_API ADBAPIHANDLE __cdecl AdbEnumInterfaces(GUID class_id,
                                bool exclude_not_present,
                                bool exclude_removed,
                                bool active_only) {
    ADBAPIHANDLE ret = NULL;

    return ret;
}

ADBWIN_API bool __cdecl AdbCloseHandle(ADBAPIHANDLE adb_handle) {
    return true;
}

ADBWIN_API bool __cdecl AdbGetEndpointInformation(ADBAPIHANDLE adb_interface,
                               UCHAR endpoint_index,
                               AdbEndpointInformation* info) {
    return false;
}

ADBWIN_API bool __cdecl AdbGetUsbDeviceDescriptor(ADBAPIHANDLE adb_interface,
                               USB_DEVICE_DESCRIPTOR* desc) {
    return false;
}

ADBWIN_API bool __cdecl AdbGetUsbConfigurationDescriptor(ADBAPIHANDLE adb_interface,
                                      USB_CONFIGURATION_DESCRIPTOR* desc) {
    return false;
}

ADBWIN_API bool __cdecl AdbGetUsbInterfaceDescriptor(ADBAPIHANDLE adb_interface,
                                  USB_INTERFACE_DESCRIPTOR* desc) {
    return false;
}

ADBWIN_API ADBAPIHANDLE __cdecl AdbCreateInterfaceByName(const wchar_t* interface_name)
{
    return NULL;
}

ADBWIN_API bool __cdecl AdbReadEndpointSync(ADBAPIHANDLE adb_endpoint,
                                    void* buffer,
                                    unsigned long bytes_to_read,
                                    unsigned long* bytes_read,
                                    unsigned long time_out)
{
    return NULL;
}

ADBWIN_API bool __cdecl AdbWriteEndpointSync(ADBAPIHANDLE adb_endpoint,
                                     void* buffer,
                                     unsigned long bytes_to_write,
                                     unsigned long* bytes_written,
                                     unsigned long time_out)
{
    return NULL;
}


ADBWIN_API bool __cdecl AdbNextInterface(ADBAPIHANDLE adb_handle,
                                 AdbInterfaceInfo* info,
                                 unsigned long* size)
{
    return false;
}

ADBWIN_API bool __cdecl AdbGetInterfaceName(ADBAPIHANDLE adb_interface,
                                    void* buffer,
                                    unsigned long* buffer_char_size,
                                    bool ansi)
{
    return false;
}


ADBWIN_API ADBAPIHANDLE __cdecl AdbOpenDefaultBulkReadEndpoint(
                            ADBAPIHANDLE adb_interface,
                            AdbOpenAccessType access_type,
                            AdbOpenSharingMode sharing_mode)
{
    return false;
}


ADBWIN_API ADBAPIHANDLE __cdecl AdbOpenDefaultBulkWriteEndpoint(
                            ADBAPIHANDLE adb_interface,
                            AdbOpenAccessType access_type,
                            AdbOpenSharingMode sharing_mode)
{
    return false;
}

ADBWIN_API bool __cdecl AdbGetSerialNumber(ADBAPIHANDLE adb_interface,
                                   void* buffer,
                                   unsigned long* buffer_char_size,
                                   bool ansi)
{
    return false;
}
