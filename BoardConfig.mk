DEVICE_PATH := device/xiaomi/songyuan

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := oryon
TARGET_2ND_ARCH :=
TARGET_NO_BOOTLOADER := true
PRODUCT_PLATFORM := canoe
TARGET_BOOTLOADER_BOARD_NAME := canoe
TARGET_BOARD_PLATFORM := sm8850
QCOM_BOARD_PLATFORMS += sm8850
TARGET_USES_HARDWARE_QCOM := true

BOARD_SHIPPING_API_LEVEL := 202504

BOARD_BOOT_HEADER_VERSION := 4
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600
BOARD_RAMDISK_USE_LZ4 := true
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true
BOARD_USES_RECOVERY_AS_BOOT := false
TARGET_KERNEL_ARCH := arm64
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
BOARD_MKBOOTIMG_ARGS += --header_version 4 --pagesize 4096

PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31

AB_OTA_UPDATER := true
BOARD_AVB_ENABLE := true
BOARD_USES_METADATA_PARTITION := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_METADATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_USES_VENDOR_DLKMIMAGE := true
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_DLKMIMAGE_FILE_SYSTEM_TYPE := erofs
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm
TARGET_COPY_OUT_SYSTEM := system
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_SYSTEM_DLKM := system_dlkm
BOARD_SUPER_PARTITION_SIZE := 14495514624

BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_CRYPTO_USE_VENDOR_KEYMINT := true
TW_USE_FSCRYPT_POLICY := 2
TW_INCLUDE_OMAPI := true
BOARD_USES_QCOM_FBE_DECRYPTION := true

TARGET_SCREEN_WIDTH := 1200
TARGET_SCREEN_HEIGHT := 2608
TARGET_SCREEN_DENSITY := 480
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TW_THEME := portrait_hdpi
TW_FRAMERATE := 120
TW_INPUT_BLACKLIST := "hbtp_vm:uinput-xiaomi"
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 16383
TW_DEFAULT_BRIGHTNESS := 950

TW_LOAD_VENDOR_MODULES := "qmi_helpers.ko qcom_glink.ko qcom_glink_smem.ko qcom_smd.ko rproc_qcom_common.ko qcom_pdr_msg.ko pdr_interface.ko qcom_sysmon.ko qcom_q6v5.ko qcom_ramdump.ko qcom_va_minidump.ko qcom_pil_info.ko qcom_q6v5_pas.ko q6_pdr_dlkm.ko q6_notifier_dlkm.ko snd_event_dlkm.ko gpr_dlkm.ko spf_core_dlkm.ko adsp_loader_dlkm.ko q6_dlkm.ko pcie-pdc.ko pci-msm-drv.ko mhi.ko wcd_usbss_i2c.ko usb_f_gsi.ko dwc3-msm.ko repeater.ko redriver.ko ipam.ko gsim.ko rmnet_mem.ko smem-mailbox.ko cfg80211.ko mac80211.ko wlan_firmware_service.ko cnss_prealloc.ko cnss_utils.ko cnss_nl.ko cnss_plat_ipc_qmi_svc.ko cnss2.ko qca_cld3_peach_v2.ko qca_cld3_wcn7750.ko qti_pmic_glink.ko qti_battery_charger.ko panel_event_notifier.ko gh_irq_lend.ko xiaomi_touch.ko focaltech_touch_3685g_1.ko swr_dlkm.ko mca_sysfs.ko mca_event.ko mca_log.ko mca_parse_dts.ko mca_charge_mievent.ko mca_protocol_class.ko mca_protocol_qc_class.ko mca_platform_bc12_class.ko mca_platform_buckchg_class.ko mca_strategy_class.ko mca_adsp_glink.ko mca_qcom_subpmic_proxy.ko leds-qcom-flash.ko leds-qpnp-vibrator-ldo.ko qcom-hv-haptics.ko swr_haptics_dlkm.ko smcinvoke_dlkm.ko qsee_ipc_irq_bridge.ko stm_st54se_gpio.ko stm_nfc_i2c.ko"
TW_LOAD_VENDOR_MODULES_EXCLUDE_GKI := true

TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_FUSE_EXFAT := true
TW_NO_SCREEN_BLANK := true
TW_EXTRA_LANGUAGES := true
TW_EXCLUDE_APEX := true
TW_STATUS_ICONS_ALIGN := center
TW_ENABLE_ALL_PARTITION_TOOLS := true
TW_BACKUP_EXCLUSIONS := /data/fonts
BOARD_HAS_LARGE_FILESYSTEM := true

RECOVERY_SDCARD_ON_DATA := true
TW_INCLUDE_FASTBOOTD := true
TW_USE_DMCTL := true
TW_USE_TOOLBOX := true
TW_INCLUDE_REPACKTOOLS := true
TW_DEFAULT_LANGUAGE := en
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

include vendor/twrp/config/BoardConfigTWRP.mk
