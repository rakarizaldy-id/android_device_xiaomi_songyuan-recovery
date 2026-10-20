# Native recovery configuration for POCO F9 Ultra (songyuan), Android 16.
DEVICE_PATH := device/xiaomi/songyuan
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression_with_xor.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)
$(call inherit-product, vendor/twrp/config/common.mk)

PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_VIRTUAL_AB_OTA := true
PRODUCT_SHIPPING_API_LEVEL := 36
PRODUCT_TARGET_VNDK_VERSION := 36
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)
PRODUCT_PACKAGES += \
    libsongyuan_memset_compat \
    android.hardware.boot-service.default_recovery
PRODUCT_PROPERTY_OVERRIDES += persist.sys.fuse.passthrough.enable=true

# All recovery-owned init rc, touch scripts and stock fstab are in recovery/root/.
# external/se_omapi alone installs its upstream se_omapi init rc.
SONGYUAN_NATIVE_RECOVERY_COPY_FILES := $(call find-copy-subdir-files,*,$(DEVICE_PATH)/recovery/root,recovery/root)
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery.fstab:recovery/root/system/etc/recovery.fstab \
    $(DEVICE_PATH)/twrp.flags:recovery/root/system/etc/twrp.flags \
    $(SONGYUAN_NATIVE_RECOVERY_COPY_FILES)

# Verified original Indonesian Songyuan OS3.0.305.0.WGNIDXM hardware files.
# A missing manifest/kernel is a hard error: never silently build generic recovery.
ifeq ($(wildcard $(DEVICE_PATH)/prebuilt/curated-manifest.json),)
$(error Native Songyuan ID305 prebuilt manifest missing)
endif
ifeq ($(wildcard $(DEVICE_PATH)/prebuilt/kernel),)
$(error Native Songyuan ID305 kernel missing)
endif

# prebuilt content is staged in original partition-relative paths.
# These mappings install into the TWRP recovery ramdisk; not vendor/odm images.
SONGYUAN_STOCK_VENDOR := $(call find-copy-subdir-files,*,$(DEVICE_PATH)/prebuilt/vendor,recovery/root/vendor)
SONGYUAN_STOCK_ODM := $(call find-copy-subdir-files,*,$(DEVICE_PATH)/prebuilt/odm,recovery/root/odm)
SONGYUAN_STOCK_MODULES := $(call find-copy-subdir-files,*,$(DEVICE_PATH)/prebuilt/vendor_dlkm,recovery/root/vendor_dlkm)
PRODUCT_COPY_FILES += \
    $(SONGYUAN_STOCK_VENDOR) \
    $(SONGYUAN_STOCK_ODM) \
    $(SONGYUAN_STOCK_MODULES)
