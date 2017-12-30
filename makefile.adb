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
SRCS+= adb_utils.c
SRCS+= fdevent.c
SRCS+= sockets.c
SRCS+= socket_spec.c
SRCS+= sysdeps/errno.c
SRCS+= transport.c
SRCS+= transport_local.c
SRCS+= transport_usb.c

SRCS+= sysdeps_win32.c
SRCS+= sysdeps/win32/errno.c
SRCS+= sysdeps/win32/stat.c
SRCS+= client/usb_windows.c

SRCS+= adb_auth_host.c
SRCS+= transport_mdns.c

SRCS+= diagnose_usb.c

SRCS+= adb_client.c
SRCS+= bugreport.c
SRCS+= client/main.c
SRCS+= console.c
SRCS+= commandline.c
SRCS+= file_sync_client.c
SRCS+= line_printer.c
SRCS+= services.c
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

VPATH+= ../libcrypto_utils
SRCS+= android_pubkey.c

VPATH+= ../../../external/mdnsresponder/mDNSShared
SRCS+= dnssd_clientlib.c
SRCS+= dnssd_clientstub.c
SRCS+= dnssd_ipc.c

VPATH+= ../../../external/mdnsresponder/mDNSWindows/DLL
SRCS+= dllmain.c

CXXFLAGS+= -std=gnu++11

CPPFLAGS+= -D_mkdir=mkdir
CPPFLAGS+= -DADB_HOST=1
CPPFLAGS+= -DHAVE_FORKEXEC=1
#CPPFLAGS+= -DHAVE_SYMLINKS
#CPPFLAGS+= -DHAVE_TERMIO_H
CPPFLAGS+= -DHAVE_SYS_SOCKET_H
CPPFLAGS+= -D_GNU_SOURCE
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
CPPFLAGS+= -I../libcrypto_utils/include/
CPPFLAGS+= -I../../../external/mdnsresponder/mDNSShared/
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
LIBS= -lcrypto -lpthread -lws2_32 -lgdi32
LIBS+= AdbWinUsbApi.dll AdbWinApi.dll
LIBS+= -static -lstdc++
#LIBS+= -lrt 
 
OBJS= $(SRCS:.c=.o)
 
all: adb.exe
 
adb.exe: $(OBJS)
	$(LD) -o $@ $(LDFLAGS) $(OBJS) $(LIBS)
 
clean:
	rm -rf $(OBJS)

