ifneq ($(TARGET_SIMULATOR),true)

LOCAL_PATH:= $(call my-dir)

include $(LOCAL_PATH)/../include/buildcfg.mk

include $(CLEAR_VARS)

LOCAL_C_INCLUDES:= $(LOCAL_PATH)/common \
                   $(LOCAL_PATH)/ulinux \
                   $(LOCAL_PATH)/../include \
                   $(LOCAL_PATH)/../stack/include/


LOCAL_CFLAGS += -Werror

ifeq ($(BOARD_HAVE_BLUETOOTH_BCM),true)
LOCAL_CFLAGS += \
	-DBOARD_HAVE_BLUETOOTH_BCM 
endif

LOCAL_PRELINK_MODULE:=false
LOCAL_SRC_FILES:= \
    ./ulinux/gki_ulinux.c \
    ./common/gki_debug.c \
    ./common/gki_time.c \
    ./common/gki_buffer.c 
    
LOCAL_MODULE := libbt-brcm_gki 
LOCAL_MODULE_TAGS := optional
LOCAL_SHARED_LIBRARIES := libcutils libc

include $(BUILD_STATIC_LIBRARY)

endif  # TARGET_SIMULATOR != true
