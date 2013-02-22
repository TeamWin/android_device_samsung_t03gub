$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/t03gub/t03gub-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/t03gub/overlay

LOCAL_PATH := device/samsung/t03gub
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernAl
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernAl

PRODUCT_COPY_FILES += \
        device/samsung/t03gub/recovery/root/init.rc:root/init.rc \
        device/samsung/t03gub/recovery/root/lpm.rc:root/lpm.rc \
        device/samsung/t03gub/recovery/root/fstab.smdk4x12:root/fstab.smdk4x12 \
        device/samsung/t03gub/recovery/root/ueventd.smdk4x12.rc:root/ueventd.smdk4x12.rc \
        device/samsung/t03gub/recovery/root/lib/modules/btlock.ko:root/lib/modules/btlock.ko \
        device/samsung/t03gub/recovery/root/lib/modules/dhd.ko:root/lib/modules/dhd.ko \
        device/samsung/t03gub/recovery/root/lib/modules/exfat_core.ko:root/lib/modules/exfat_core.ko \
        device/samsung/t03gub/recovery/root/lib/modules/exfat_fs.ko:root/lib/modules/exfat_fs.ko \
        device/samsung/t03gub/recovery/root/lib/modules/scsi_wait_scan.ko:root/lib/modules/scsi_wait_scan.ko

# Samsung encrypt
#PRODUCT_COPY_FILES += \
#        device/samsung/t03gub/modules/exfat_fs.ko:root/system/lib/exfat_fs.ko \
#        device/samsung/t03gub/modules/exfat_core.ko:root/system/lib/exfat_core.ko \
#        device/samsung/t03gub/recovery/encryption/libkeyutils.so:root/sbin/libkeyutils.so \
#        device/samsung/t03gub/recovery/encryption/libsec_ecryptfs.so:root/sbin/libsec_ecryptfs.so \
#        device/samsung/t03gub/recovery/encryption/libsec_km.so:root/sbin/libsec_km.so

$(call inherit-product, build/target/product/full.mk)

PRODUCT_NAME := cm_t03gub
PRODUCT_BRAND := Samsung
