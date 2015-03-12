#
# Copyright 2013 The Android Open-Source Project
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

TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Board configuration
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := redhookbay
TARGET_ARCH := x86
TARGET_ARCH_VARIANT := x86
TARGET_CPU_ABI := x86
TARGET_CPU_VARIANT := x86-atom
TARGET_ARCH_VARIANT_FPU := sse
TARGET_CPU_ABI2 := armeabi-v7a
TARGET_CPU_SMP := true
TARGET_PRELINK_MODULE := false
INTEL_INGREDIENTS_VERSIONS := true

# Atom optimizations specified (source:oxavelar)
TARGET_GLOBAL_CFLAGS += \
                        -O2 \
                        -flto \
                        -march=atom \
                        -mmmx \
                        -msse \
                        -msse2 \
                        -msse3 \
                        -mssse3 \
                        -mpclmul \
                        -mcx16 \
                        -msahf \
                        -mmovbe \
                        -ftree-vectorize \
                        -fomit-frame-pointer \
                        -finline-functions \
                        -fpredictive-commoning \
                        -fgcse-after-reload \
                        -fforce-addr \
                        -ffast-math \
                        -fsingle-precision-constant \
                        -floop-block \
                        -floop-interchange \
                        -floop-strip-mine \
                        -floop-parallelize-all \
                        -ftree-parallelize-loops=2 \
                        -ftree-loop-if-convert \
                        -ftree-loop-if-convert-stores \
                        -ftree-loop-distribution \
                        -foptimize-register-move \
                        -fgraphite-identity \

# The following are very specific to our z2560/2580 Atom
TARGET_GLOBAL_CFLAGS += \
                        --param l1-cache-line-size=64 \
                        --param l1-cache-size=48 \
                        --param l2-cache-size=1024 \

TARGET_GLOBAL_CFLAGS += -DUSE_SSSE3 -DUSE_SSE2

TARGET_GLOBAL_CPPFLAGS += -march=atom -fno-exceptions

TARGET_GLOBAL_LDFLAGS += -Wl,-O1

TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/zte/geek/releasetools/ota_from_target_files

TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true
BOARD_CACHEIMAGE_PARTITION_SIZE := 659554304
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1055916032
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1073741824
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_FLASH_BLOCK_SIZE := 4096

BOARD_DATA_DEVICE := /dev/block/mmcblk0p9
BOARD_DATA_FILESYSTEM := ext4
BOARD_CACHE_DEVICE := /dev/block/mmcblk0p6
BOARD_CACHE_FILESYSTEM := ext4
BOARD_SYSTEM_DEVICE := /dev/block/mmcblk0p8
BOARD_SYSTEM_FILESYSTEM := ext4




# Use boot tools to make Intel-formatted images
DEVICE_BASE_BOOT_IMAGE := $(LOCAL_PATH)/boot.img
DEVICE_BASE_RECOVERY_IMAGE := $(LOCAL_PATH)/recovery.img

BOARD_KERNEL_CMDLINE := init=/init pci=noearly console=logk0 earlyprintk=nologger loglevel=0 kmemleak=off androidboot.bootmedia=sdcard androidboot.hardware=redhookbay watchdog.watchdog_thresh=60 androidboot.spid=0000:0000:0003:0002:0000:0021 androidboot.serialno=Medfield988F3F96 ip=50.0.0.2:50.0.0.1::255.255.255.0::usb0:on vmalloc=172M androidboot.wakesrc=06 androidboot.mode=main

BOARD_KERNEL_BASE := 0x10000000


# Recovery configuration global
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
DEVICE_RESOLUTION := 720x1280
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/etc/recovery.fstab
BOARD_HAS_NO_SELECT_BUTTON := true
TW_INCLUDE_INJECTTWRP := true
TWRP_EVENT_LOGGING := false
RECOVERY_SDCARD_ON_DATA := true

BOARD_BLUEDROID_VENDOR_CONF := $(LOCAL_PATH)/bt_vendor.conf

#HW_Renderer
USE_OPENGL_RENDERER	:= true
BOARD_USES_HWCOMPOSER := true
BOARD_ALLOW_EGL_HIBERNATION := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

USE_INTEL_MDP := true
BOARD_USE_LIBVA_INTEL_DRIVER := true
BOARD_USE_LIBVA := true
BOARD_USE_LIBMIX := true
BOARD_USES_WRS_OMXIL_CORE := true

# Force the screenshot path to CPU consumer
COMMON_GLOBAL_CFLAGS += -DFORCE_SCREENSHOT_CPU_PATH
# Enable WEBGL in WebKit
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true
# Turn on GR_STATIC_RECT_VB flag in skia to boost performance
TARGET_USE_GR_STATIC_RECT_VB := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_USE_SKIA_LCDTEXT := true

# Enable dalvik startup with a low memory footprint
TARGET_ARCH_LOWMEM := true
