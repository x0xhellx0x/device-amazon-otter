#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk
BOARD_USES_GENERIC_AUDIO := false
USE_CAMERA_STUB := true
BOARD_HAVE_BLUETOOTH := false

# inherit from the proprietary version
-include vendor/amazon/otter/BoardConfigVendor.mk

# CPU
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_ARCH_VARIANT_FPU := neon
ARCH_ARM_HAVE_TLS_REGISTER := true
NEEDS_ARM_ERRATA_754319_754320 := true

# Kernel
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_CMDLINE := console=ttyO2,115200n8 mem=463M@0x80000000 init=/init vram=5M omapfb.vram=0:5M
TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := omap4
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := otter
TARGET_PROVIDES_INIT_RC := true
# Would be nice to build this dynamically
TARGET_PREBUILT_KERNEL := device/amazon/otter/kernel

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912
BOARD_USERDATAIMAGE_PARTITION_SIZE := 90537984
# I'm wondering if this should be changed to 4096 (same as what's used
# for cm9 for this device)
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_HAS_NO_MISC_PARTITION := true

# Connectivity - Wi-Fi 
# again this would be nice to get working with a different kernel
BOARD_WPA_SUPPLICANT_DRIVER := CUSTOM
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := libCustomWifi
WPA_SUPPLICANT_VERSION      := VER_0_6_X
HOSTAPD_VERSION             := VER_0_6_X
BOARD_WLAN_DEVICE           := wl1283
BOARD_SOFTAP_DEVICE         := wl1283
#BOARD_WLAN_TI_STA_DK_ROOT   := system/wlan/ti/wilink_6_1
WIFI_DRIVER_MODULE_PATH     := "/system/etc/wifi/tiwlan_drv.ko"
WIFI_DRIVER_MODULE_NAME     := "tiwlan_drv"
WIFI_DRIVER_MODULE_ARG      := ""
WIFI_FIRMWARE_LOADER        := "wlan_loader"
WIFI_DRIVER_FW_STA_PATH     := "/system/etc/wifi/firmware.bin"
WIFI_DRIVER_FW_AP_PATH      := "/system/etc/wifi/softap/firmware_ap.bin"

# Graphics
BOARD_EGL_CFG := device/amazon/otter/misc/egl.cfg
USE_OPENGL_RENDERER := true

# Audio
BOARD_USES_ALSA_AUDIO := true
BUILD_WITH_ALSA_UTILS := true
BOARD_USES_TI_OMAP_MODEM_AUDIO := false

# OMAP
OMAP_ENHANCEMENT := true
ENHANCED_DOMX := true
ifdef OMAP_ENHANCEMENT
COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT -DTARGET_OMAP4
endif

# OMX
HARDWARE_OMX := true
ifdef HARDWARE_OMX
OMX_JPEG := true
OMX_VENDOR := ti
OMX_VENDOR_INCLUDES := \
  hardware/ti/omx/system/src/openmax_il/omx_core/inc \
  hardware/ti/omx/image/src/openmax_il/jpeg_enc/inc
OMX_VENDOR_WRAPPER := TI_OMX_Wrapper
BOARD_OPENCORE_LIBRARIES := libOMX_Core
BOARD_OPENCORE_FLAGS := -DHARDWARE_OMX=1
BOARD_CAMERA_LIBRARIES := libcamera
endif

# Packaging
TARGET_PROVIDES_RELEASETOOLS := true
#TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := ./device/amazon/otter/releasetools/encore_img_from_target_files
#TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./device/amazon/otter/releasetools/encore_ota_from_target_files
TARGET_CUSTOM_RELEASETOOL := ./device/amazon/otter/releasetools/squisher

# Recovery
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/amazon/otter/recovery/recovery_ui.c
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_RECOVERY_PRE_COMMAND := "idme postmode 1;"

# Misc
BOARD_HAVE_FAKE_GPS := true
BOARD_GPS_LIBRARIES := false
BOARD_NEEDS_CUTILS_LOG := true
BOARD_USES_TI_CAMERA_HAL := false
