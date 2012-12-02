ifeq ($(BOARD_USES_BOOTMENU),true)

LOCAL_PATH := $(call my-dir)

# build device static library
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	reboot.c

LOCAL_MODULE:= libreboot

include $(BUILD_STATIC_LIBRARY)


# build device static library
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	reboot.c

LOCAL_MODULE:= librebootrecovery

LOCAL_CFLAGS += -DRECOVERY_SHELL
LOCAL_STATIC_LIBRARIES += libcrecovery

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := main.c reboot.c
LOCAL_CFLAGS := -DSINGLE_APPLET=1

LOCAL_MODULE := reboot_bm
LOCAL_MODULE_STEM := reboot
LOCAL_MODULE_TAGS := eng

LOCAL_STATIC_LIBRARIES += libstdc++ libc libcutils
LOCAL_FORCE_STATIC_EXECUTABLE := true

LOCAL_MODULE_PATH := $(PRODUCT_OUT)/system/bootmenu/binary

include $(BUILD_EXECUTABLE)

endif # BOARD_USES_BOOTMENU
