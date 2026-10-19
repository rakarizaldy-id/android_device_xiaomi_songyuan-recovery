# POCO F9 Ultra (songyuan)

Native Android 16 recovery device tree for POCO F9 Ultra, Qualcomm SM8850 (canoe).

| Item | Source |
|---|---|
| Device | POCO F9 Ultra |
| Codename | songyuan |
| OS reference | OS3.0.305.0.WGNIDXM (Indonesia, Android 16) |
| Recovery partition | 100 MiB |
| Source binary provenance | Original extracted device firmware, SHA-256 verified |

## Directory layout
- 'prebuilt/kernel': original firmware kernel.
- 'prebuilt/vendor/', 'prebuilt/odm/': original vendor/ODM security services, firmware, and required libraries.
- 'prebuilt/vendor_dlkm/': original kernel module closure and metadata.
- 'prebuilt/curated-manifest.json': SHA-256 and byte count of every OEM payload.
- 'recovery/root/': device-specific recovery init services and touchscreen bootstrap.
- 'device.mk': installs device-owned init and verified OEM prebuilts into the recovery ramdisk.
- 'BoardConfig.mk': partition geometry, filesystem and TWRP16 configuration.

## Current status
Firmware assets and repository source are assembled and checksum verified. This is **NOT evidence of a successful recovery build, boot, touchscreen operation, USB behavior, or decryption**.

A full TWRP16 recovery build, generated image size check against the 100 MiB partition, same-build ELF ABI/linker checks, and physical device tests are still required.

## Build safety
All vendor binaries here originate from the specified Songyuan firmware. Source checks should fail if the manifest is missing or hashes differ. No images, kernels, firmware or executables from other devices are included.
