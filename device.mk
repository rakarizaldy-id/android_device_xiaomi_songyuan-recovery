# POCO F9 Ultra source-only product definition.
DEVICE_PATH := device/xiaomi/songyuan
# Private OEM prebuilts are injected into recovery/root AFTER hash checking.
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, vendor/twrp/config/common.mk)

PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_VIRTUAL_AB_OTA := true
PRODUCT_SHIPPING_API_LEVEL := 36
PRODUCT_TARGET_VNDK_VERSION := 36
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)
# Compile and install the source-owned ARM64 compatibility shim in the
# recovery partition. Dynamic linking / loading is a separate runtime gate.
PRODUCT_PACKAGES += libsongyuan_memset_compat
PRODUCT_PROPERTY_OVERRIDES += persist.sys.fuse.passthrough.enable=true

# Genuine Songyuan ID305 OEM files only. Follow the EkinStrop/TWRP16
# single-owner approach: external/se_omapi provides its own init_rc and VINTF.
# Do NOT copy or mutate a second device-side se_omapi.rc.
SONGYUAN_NATIVE_RECOVERY_COPY_FILES := $(call find-copy-subdir-files,*,$(DEVICE_PATH)/recovery/root,recovery/root)
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery.fstab:recovery/root/system/etc/recovery.fstab \
    $(SONGYUAN_NATIVE_RECOVERY_COPY_FILES)
