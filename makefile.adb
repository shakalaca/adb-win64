# ADB makefile
# ------------

#TODO change TOOLCHAIN variable to your toolchain path 
TOOLCHAIN= /usr/bin/x86_64-w64-mingw32-
CC= $(TOOLCHAIN)gcc
LD= $(TOOLCHAIN)gcc
CXX=$(CC)

LOCAL_PATH:= $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
adb_version := $(shell git -C $(LOCAL_PATH) rev-parse --short=12 HEAD 2>/dev/null)-android

SRCS+= adb.c
SRCS+= adb_io.c
SRCS+= adb_listeners.c
SRCS+= adb_trace.c
SRCS+= adb_unique_fd.c
SRCS+= adb_utils.c
SRCS+= fdevent.c
SRCS+= services.c
SRCS+= sockets.c
SRCS+= socket_spec.c
SRCS+= sysdeps/errno.c
SRCS+= transport.c
SRCS+= transport_fd.c
SRCS+= transport_local.c
SRCS+= transport_usb.c

SRCS+= sysdeps_win32.c
SRCS+= sysdeps/win32/errno.c
SRCS+= sysdeps/win32/stat.c
SRCS+= client/usb_windows.c

SRCS+= client/auth.c
SRCS+= client/usb_libusb.c
SRCS+= client/usb_dispatch.c
SRCS+= client/transport_mdns.c

SRCS+= ../diagnose_usb/diagnose_usb.c

SRCS+= client/adb_client.c
SRCS+= client/bugreport.c
SRCS+= client/commandline.c
SRCS+= client/file_sync_client.c
SRCS+= client/main.c
SRCS+= client/console.c
SRCS+= client/line_printer.c
SRCS+= shell_service_protocol.c

VPATH+= ../base
SRCS+= file.c
SRCS+= stringprintf.c
SRCS+= strings.c
SRCS+= logging.c
SRCS+= utf8.c
SRCS+= errors_windows.c
SRCS+= parsenetaddress.c
SRCS+= quick_exit.c
SRCS+= threads.c

VPATH+= ../libcrypto_utils
SRCS+= android_pubkey.c

VPATH+= ../../../external/mdnsresponder/mDNSShared
SRCS+= dnssd_clientlib.c
SRCS+= dnssd_clientstub.c
SRCS+= dnssd_ipc.c

VPATH+= ../../../external/mdnsresponder/mDNSWindows/DLL
SRCS+= dllmain.c

VPATH+= ../../../external/libusb/libusb
SRCS+= core.c
SRCS+= descriptor.c
SRCS+= hotplug.c
SRCS+= io.c
SRCS+= sync.c
SRCS+= strerror.c

VPATH+= ../../../external/libusb/libusb/os
SRCS+= poll_windows.c
SRCS+= threads_windows.c
SRCS+= windows_nt_common.c
SRCS+= windows_winusb.c

CXXFLAGS+= -std=gnu++11

CPPFLAGS+= -D_mkdir=mkdir
CPPFLAGS+= -DADB_HOST=1
CPPFLAGS+= -DHAVE_FORKEXEC=1
#CPPFLAGS+= -DHAVE_SYMLINKS
#CPPFLAGS+= -DHAVE_TERMIO_H
CPPFLAGS+= -DHAVE_SYS_SOCKET_H
CPPFLAGS+= -D_GNU_SOURCE
CPPFLAGS+= -D_POSIX_SOURCE
CPPFLAGS+= -D_XOPEN_SOURCE
CPPFLAGS+= -D_WIN32
CPPFLAGS+= -D_WIN32_WINNT=0x0600
CPPFLAGS+= -D__STDC_FORMAT_MACROS=1
CPPFLAGS+= -DHAVE_WIN32_PROC
CPPFLAGS+= -DHAVE_WIN32_IPC
CPPFLAGS+= -DHAVE_WINSOCK
CPPFLAGS+= -DHAVE_OFF64_T
CPPFLAGS+= -DADB_REVISION='"$(adb_version)"'
CPPFLAGS+= -DADB_VERSION='"$(adb_version)"'
CPPFLAGS+= -DADBWIN_EXPORTS
CPPFLAGS+= -I.
CPPFLAGS+= -I../include
CPPFLAGS+= -I../../../../openssl-1.0.2n/include
CPPFLAGS+= -I../base/include 
CPPFLAGS+= -I../libcrypto_utils/include
CPPFLAGS+= -I../diagnose_usb/include
CPPFLAGS+= -I../../../external/mdnsresponder/mDNSShared/
CPPFLAGS+= -I../../../external/libusb/include
CPPFLAGS+= -I../../../external/libusb/libusb
CPPFLAGS+= -I../../../external/libusb/libusb/os
CPPFLAGS+= -I../../../external/libusb/windows
CPPFLAGS+= -D__BEGIN_DECLS=/**/
CPPFLAGS+= -D__END_DECLS=/**/
CPPFLAGS+= -DUNICODE=1 -D_UNICODE=1
CPPFLAGS+= -O2 -Wall -Wno-unused-parameter
CPPFLAGS+= -DTARGET_OS_WINDOWS \
  -DHAVE_IPV6 \
  -DNOT_HAVE_SA_LEN \
  -DPLATFORM_NO_RLIMIT \
  -DMDNS_DEBUGMSGS=0 \
  -DMDNS_UDS_SERVERPATH=\"/dev/socket/mdnsd\" \
  -DMDNS_USERNAME=\"mdnsr\" \
  -DWIN32 \
  -D_SSIZE_T \
  -DNDEBUG \
  -D_WINDOWS \
  -D_USERDLL \
  -D_MDNS_DEBUGMSGS=0 \
  -D_WIN32_LEAN_AND_MEAN \
  -DUSE_TCP_LOOPBACK \
  -D_CRT_SECURE_NO_DEPRECATE \
  -D_CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES=1 \

CFLAGS+= -DUSE_MINGW

LDFLAGS+= -L../../../../openssl-1.0.2n -static-libstdc++ -static-libgcc
LDFLAGS+= -municode
LIBS= -lpthread -lcrypto
LIBS+= -lws2_32 -lgdi32 -luserenv
LIBS+= AdbWinUsbApi.dll AdbWinApi.dll
LIBS+= -static -lstdc++
#LIBS+= -lrt 
 
OBJS= $(SRCS:.c=.o)
 
all: adb.exe
 
adb.exe: $(OBJS)
	$(LD) -o $@ $(LDFLAGS) $(OBJS) $(LIBS)
 
clean:
	rm -rf $(OBJS)

