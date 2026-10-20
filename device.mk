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

SONGYUAN_RECOVERY_FILE_PATHS := \
    init.recovery.qcom.rc \
    init.recovery.usb.rc \
    odm/bin/prepdecrypt.sh \
    odm/etc/init/android.hardware.weaver-service.thales.rc \
    odm/etc/init/prepdecrypt.rc \
    odm/etc/init/vendor.xiaomi.hardware.authsecretd.rc \
    system/bin/songyuan-security-setup.sh \
    system/bin/songyuan-touch-init.sh \
    system/bin/songyuan-weaver-start.sh \
    system/manifest.xml \
    vendor/etc/init/android.hardware.gatekeeper-service-qti.rc \
    vendor/etc/init/android.hardware.secure_element-service.qti.rc \
    vendor/etc/init/android.hardware.security.onekeymint-service-qti.rc \
    vendor/etc/init/hlosminkdaemon.rc \
    vendor/etc/init/qseecomd.rc \
    vendor/etc/init/songyuan-weaver-chain.rc \
    vendor/etc/vintf/manifest/android.hardware.boot.xml \
    system/bin/twrp_secure_element_ta/32552B22-89FE-42B4-8A45-A0C4E2DB0326.b00 \
    system/bin/twrp_secure_element_ta/32552B22-89FE-42B4-8A45-A0C4E2DB0326.b01 \
    system/bin/twrp_secure_element_ta/32552B22-89FE-42B4-8A45-A0C4E2DB0326.b02 \
    system/bin/twrp_secure_element_ta/32552B22-89FE-42B4-8A45-A0C4E2DB0326.b03 \
    system/bin/twrp_secure_element_ta/32552B22-89FE-42B4-8A45-A0C4E2DB0326.b04 \
    system/bin/twrp_secure_element_ta/32552B22-89FE-42B4-8A45-A0C4E2DB0326.b05 \
    system/bin/twrp_secure_element_ta/32552B22-89FE-42B4-8A45-A0C4E2DB0326.b06 \
    system/bin/twrp_secure_element_ta/32552B22-89FE-42B4-8A45-A0C4E2DB0326.b07 \
    system/bin/twrp_secure_element_ta/32552B22-89FE-42B4-8A45-A0C4E2DB0326.b08 \
    system/bin/twrp_secure_element_ta/32552B22-89FE-42B4-8A45-A0C4E2DB0326.mdt \
    system/bin/twrp_secure_element_ta/FD719D50-FFFB-11EB-9A03-0242AC130003.b00 \
    system/bin/twrp_secure_element_ta/FD719D50-FFFB-11EB-9A03-0242AC130003.b01 \
    system/bin/twrp_secure_element_ta/FD719D50-FFFB-11EB-9A03-0242AC130003.b02 \
    system/bin/twrp_secure_element_ta/FD719D50-FFFB-11EB-9A03-0242AC130003.b03 \
    system/bin/twrp_secure_element_ta/FD719D50-FFFB-11EB-9A03-0242AC130003.b04 \
    system/bin/twrp_secure_element_ta/FD719D50-FFFB-11EB-9A03-0242AC130003.b05 \
    system/bin/twrp_secure_element_ta/FD719D50-FFFB-11EB-9A03-0242AC130003.b06 \
    system/bin/twrp_secure_element_ta/FD719D50-FFFB-11EB-9A03-0242AC130003.b07 \
    system/bin/twrp_secure_element_ta/FD719D50-FFFB-11EB-9A03-0242AC130003.b08 \
    system/bin/twrp_secure_element_ta/FD719D50-FFFB-11EB-9A03-0242AC130003.mdt \
    vendor/lib64/libGPreqcancel.so \
    vendor/lib64/libdrmtime.so \
    vendor/lib64/libgpt.so \
    vendor/lib64/libops.so \
    vendor/lib64/libqisl.so \
    vendor/lib64/librpmb.so \
    vendor/lib64/libspl.so \
    vendor/lib64/libtaautoload.so \
    vendor/lib64/libGPreqcancel_svc.so \
    vendor/lib64/libtime_genoff.so \
    vendor/lib64/libdrm.so \
    vendor/lib64/vendor.qti.hardware.display.config-V7-ndk.so \
    vendor/lib64/android.hardware.common-V2-ndk.so \
    vendor/etc/gpfspath_oem_config.xml \
    odm/bin/hw/vendor.xiaomi.hardware.vibratorfeature.service \
    vendor/etc/HapticsPolicy.xml \
    vendor/etc/Hapticsconfig.xml \
    vendor/lib64/android.frameworks.sensorservice@1.0.so \
    vendor/lib64/android.hardware.common.fmq-V1-ndk.so \
    vendor/lib64/android.hardware.sensors@1.0.so \
    vendor/lib64/android.hardware.sensors@2.0.so \
    vendor/lib64/android.hardware.vibrator-V2-ndk.so \
    vendor/lib64/libfmq.so \
    vendor/lib64/libpalclient.so \
    vendor/lib64/libsoc_helper.so \
    vendor/lib64/libtinyalsa.so \
    odm/lib64/vendor.hardware.vibratorCL.impl.so \
    vendor/lib64/vendor.hardware.vibratorfeature.IVibratorExt-V1-ndk.so \
    vendor/lib64/vendor.qti.hardware.pal-V1-ndk.so \
    vendor/etc/init/vendor.xiaomi.hardware.vibratorfeature.service.rc \
    vendor/etc/vintf/manifest/android.hardware.vibrator-service.xml
PRODUCT_COPY_FILES += $(foreach rel,$(SONGYUAN_RECOVERY_FILE_PATHS),$(DEVICE_PATH)/recovery/root/$(rel):recovery/root/$(rel))
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery.fstab:recovery/root/system/etc/recovery.fstab \
    $(DEVICE_PATH)/twrp.flags:recovery/root/system/etc/twrp.flags

ifeq ($(wildcard $(DEVICE_PATH)/prebuilt/curated-manifest.json),)
$(error Native Songyuan ID305 prebuilt manifest missing)
endif
ifeq ($(wildcard $(DEVICE_PATH)/prebuilt/kernel),)
$(error Native Songyuan ID305 kernel missing)
endif

SONGYUAN_NATIVE_SERVICES := \
    odm/bin/hw/android.hardware.weaver-service.thales \
    odm/bin/hw/vendor.xiaomi.hardware.authsecretd \
    vendor/bin/hlosminkdaemon \
    vendor/bin/hw/android.hardware.gatekeeper-rust-service-qti \
    vendor/bin/hw/android.hardware.secure_element-service.qti \
    vendor/bin/hw/android.hardware.security.onekeymint-service-qti \
    vendor/bin/qseecomd

SONGYUAN_NATIVE_LIBRARIES := \
    odm/lib64/ese_weaver_thales.so \
    odm/lib64/libjc_weaver_transport.so \
    odm/lib64/vendor.xiaomi.hardware.miauthsecretd-V1-ndk.so \
    vendor/lib64/android.hardware.nfc-V1-ndk.so \
    vendor/lib64/android.hardware.secure_element-V1-ndk.so \
    vendor/lib64/android.hardware.secure_element@1.0.so \
    vendor/lib64/android.hardware.weaver-V2-ndk.so \
    vendor/lib64/android.se.omapi-V1-ndk.so \
    vendor/lib64/hw/libEseUtils.so \
    vendor/lib64/libGPQeSE.so \
    vendor/lib64/libGPTEE_vendor.so \
    vendor/lib64/libQSEEComAPI.so \
    vendor/lib64/libbase.so \
    vendor/lib64/libbinder.so \
    vendor/lib64/libc++.so \
    vendor/lib64/libcrypto.so \
    vendor/lib64/libcutils.so \
    vendor/lib64/libdiag.so \
    vendor/lib64/libdmabufheap.so \
    vendor/lib64/libdrmfs.so \
    vendor/lib64/libhardware.so \
    vendor/lib64/libhidlbase.so \
    vendor/lib64/libhwbinder.so \
    vendor/lib64/libion.so \
    vendor/lib64/libjsoncpp.so \
    vendor/lib64/libminkdescriptor.so \
    vendor/lib64/libminksocket_vendor.so \
    vendor/lib64/libmisight.so \
    vendor/lib64/libqcbor.so \
    vendor/lib64/libqmi_cci.so \
    vendor/lib64/libqmi_common_so.so \
    vendor/lib64/libqmi_csi.so \
    vendor/lib64/libqmi_encdec.so \
    vendor/lib64/libqrtr.so \
    vendor/lib64/libseclog.so \
    vendor/lib64/libstnfc-streset.so \
    vendor/lib64/libutils.so \
    vendor/lib64/libvmmem.so \
    vendor/lib64/libxml2.so \
    vendor/lib64/vendor.xiaomi.hardware.aidl.mtdservice-V1-ndk.so \
    vendor/lib64/vendor.xiaomi.hardware.oldcredential-V1-ndk.so

SONGYUAN_NATIVE_CONFIG := \
    odm/etc/vintf/manifest/android.hardware.weaver-service.thales.xml \
    odm/etc/vintf/manifest/vendor.xiaomi.hardware.miauthsecretd.xml \
    odm/firmware/asic_panel.bin \
    odm/firmware/focaltech_ts_fw_songyuan.bin \
    odm/firmware/paneldata_0x00000032.bin \
    odm/firmware/songyuan_fts_thp_config.cfg \
    vendor/etc/group \
    vendor/etc/passwd \
    vendor/etc/ssg/ta_config.json \
    vendor/etc/vintf/manifest/android.hardware.secure_element.xml \
    vendor/etc/vintf/manifest/android.hardware.security.onekeymint-service-qti.xml

SONGYUAN_SELECTED_OEM_FILES := $(SONGYUAN_NATIVE_SERVICES) $(SONGYUAN_NATIVE_LIBRARIES) $(SONGYUAN_NATIVE_CONFIG)
PRODUCT_COPY_FILES += $(foreach rel,$(SONGYUAN_SELECTED_OEM_FILES),$(DEVICE_PATH)/prebuilt/$(rel):recovery/root/$(rel))

SONGYUAN_MODULE_CLOSURE := \
    adsp_loader_dlkm.ko \
    dwc3-msm.ko \
    focaltech_touch_3685g_1.ko \
    gh_irq_lend.ko \
    gpr_dlkm.ko \
    mca_sysfs.ko \
    panel_event_notifier.ko \
    pdr_interface.ko \
    q6_notifier_dlkm.ko \
    q6_pdr_dlkm.ko \
    qcom-hv-haptics.ko \
    qcom_glink.ko \
    qcom_glink_smem.ko \
    qcom_pdr_msg.ko \
    qcom_smd.ko \
    qmi_helpers.ko \
    qsee_ipc_irq_bridge.ko \
    qti_battery_charger.ko \
    qti_pmic_glink.ko \
    redriver.ko \
    repeater.ko \
    rproc_qcom_common.ko \
    smcinvoke_dlkm.ko \
    snd_event_dlkm.ko \
    spf_core_dlkm.ko \
    stm_st54se_gpio.ko \
    wcd_usbss_i2c.ko \
    xiaomi_touch.ko

PRODUCT_COPY_FILES += $(foreach module,$(SONGYUAN_MODULE_CLOSURE),$(DEVICE_PATH)/prebuilt/vendor_dlkm/lib/modules/$(module):recovery/root/vendor/lib/modules/1.1/$(module))
PRODUCT_COPY_FILES += $(DEVICE_PATH)/prebuilt/vendor_dlkm/lib/modules/modules.dep:recovery/root/vendor/lib/modules/1.1/modules.dep
