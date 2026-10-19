# POCO F9 Ultra (songyuan)

Android 16 recovery device configuration for **POCO F9 Ultra**, codename `songyuan`.

## Device information

| Property | Value |
|---|---|
| Device | POCO F9 Ultra |
| Codename | `songyuan` |
| SoC | Qualcomm Snapdragon 8 Elite Gen 5 (SM8850) |
| Platform | `canoe` |
| Android version | 16 |
| Firmware reference | `OS3.0.305.0.WGNIDXM` |
| Recovery | TWRP 16 |

## Repository layout

```text
.
├── Android.bp
├── Android.mk
├── AndroidProducts.mk
├── BoardConfig.mk
├── device.mk
├── twrp_songyuan.mk
├── recovery.fstab
├── system.prop
├── compat/
└── recovery/root/
    ├── init.recovery.qcom.rc
    ├── system/
    ├── vendor/
    └── odm/
```

## Configuration

The device configuration includes recovery partition settings, filesystem definitions, startup services, hardware initialization, and Android 16 recovery properties.

The recovery filesystem configuration targets the reference firmware's EROFS logical partitions and F2FS userdata/metadata layout.

## Status

Work in progress. Boot, touch, USB, and encrypted-data compatibility require verification on the device.
