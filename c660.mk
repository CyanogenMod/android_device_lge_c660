$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/lge/c660/c660-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/c660/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/lge/c660/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Board-specific init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.muscat.rc:root/init.muscat.rc \
    $(LOCAL_PATH)/ueventd.muscat.rc:root/ueventd.muscat.rc

# BT startup
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/init.qcom.bt.sh:system/bin/init.qcom.bt.sh

# configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/AudioFilter.csv:system/etc/AudioFilter.csv

# WiFi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nvram.txt:system/etc/wl/nvram.txt \
    $(LOCAL_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/prebuilt/wireless.ko:system/lib/modules/wireless.ko

# Keyboard layout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/kbd_pp2106.kl:system/usr/keylayout/kbd_pp2106.kl \
    $(LOCAL_PATH)/configs/kbd_pp2106.kcm.bin:system/usr/keychars/kbd_pp2106.kcm.bin

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/chargemode/chargerlogo:root/sbin/chargerlogo \
    $(LOCAL_PATH)/chargemode/images/battery_ani_01.rle:root/chargerimages/battery_ani_01.rle \
    $(LOCAL_PATH)/chargemode/images/battery_ani_02.rle:root/chargerimages/battery_ani_02.rle \
    $(LOCAL_PATH)/chargemode/images/battery_bg_bk.rle:root/chargerimages/battery_bg_bk.rle \
    $(LOCAL_PATH)/chargemode/images/battery_bg.rle:root/chargerimages/battery_bg.rle \
    $(LOCAL_PATH)/chargemode/images/battery_charging_01.rle:root/chargerimages/battery_charging_01.rle \
    $(LOCAL_PATH)/chargemode/images/battery_charging_02.rle:root/chargerimages/battery_charging_02.rle \
    $(LOCAL_PATH)/chargemode/images/battery_charging_03.rle:root/chargerimages/battery_charging_03.rle \
    $(LOCAL_PATH)/chargemode/images/battery_charging_04.rle:root/chargerimages/battery_charging_04.rle \
    $(LOCAL_PATH)/chargemode/images/battery_charging_05.rle:root/chargerimages/battery_charging_05.rle \
    $(LOCAL_PATH)/chargemode/images/battery_charging_06.rle:root/chargerimages/battery_charging_06.rle \
    $(LOCAL_PATH)/chargemode/images/battery_wait_ani_01.rle:root/chargerimages/battery_wait_ani_01.rle \
    $(LOCAL_PATH)/chargemode/images/battery_wait_ani_02.rle:root/chargerimages/battery_wait_ani_02.rle \
    $(LOCAL_PATH)/chargemode/images/black_bg.rle:root/chargerimages/black_bg.rle

# Permission files
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml

$(call inherit-product, build/target/product/full.mk)

PRODUCT_PACKAGES += \
    gralloc.c660 \
    gps.c660 \
    hwaddrs \
    copybit.msm7k \
    libOmxCore

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := c660
PRODUCT_DEVICE := c660
PRODUCT_MODEL := LG Optimus Pro
