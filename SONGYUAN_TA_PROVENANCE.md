# POCO F9 Ultra (songyuan) — Original ID305 eSE TA provenance

Device: songyuan / OS3.0.305.0.WGNIDXM (Android 16)
Source: CRB/OS303050WGNIDXM/Source/modem.img, FAT16 archive entries under `image/`.
Every binary staged here was read from that exact stock image. The listing records Git blob SHA-1 (`SHA1(blob <size>\0<bytes>)`) for byte-for-byte verification; no TA file was edited or patched.

Staged destination: `recovery/root/system/bin/twrp_secure_element_ta/` (also selected in `device.mk`). The recovery's current firmware consumer path remains `/vendor/firmware_mnt/image/`, mounted directly from original Songyuan modem partition in `init.recovery.qcom.rc`. No runtime override or automatic firmware copy is enabled; copying into recovery is not proof that the eSE HAL reads these packaged backup bytes. Functional verification requires a device test.

| Source name (`modem.img::image/`) | Bytes | Git blob SHA-1 |
|---|---:|---|
| `32552B22-89FE-42B4-8A45-A0C4E2DB0326.b00` | 568 | `dcb362d9fc85c9ae17d71ade65f174f7ead7771e` |
| `32552B22-89FE-42B4-8A45-A0C4E2DB0326.b01` | 70473 | `85177a323786834450a7140c3cb5c1a35cae9a82` |
| `32552B22-89FE-42B4-8A45-A0C4E2DB0326.b02` | 266 | `93dc009c8175db9c3f62f0fff6f25699aae7e8a8` |
| `32552B22-89FE-42B4-8A45-A0C4E2DB0326.b03` | 864 | `1b88e3f4e88e40d477460035bcbf138424a768d0` |
| `32552B22-89FE-42B4-8A45-A0C4E2DB0326.b04` | 1536 | `094a305c2da552c54fdfe2604e4e4b9d320182da` |
| `32552B22-89FE-42B4-8A45-A0C4E2DB0326.b05` | 304 | `5128249af58b9a389d2086a484a0802f4611a40b` |
| `32552B22-89FE-42B4-8A45-A0C4E2DB0326.b06` | 8929 | `f697071505192edb29485fe90a6ec687e9bfe1b1` |
| `32552B22-89FE-42B4-8A45-A0C4E2DB0326.b07` | 864 | `1b88e3f4e88e40d477460035bcbf138424a768d0` |
| `32552B22-89FE-42B4-8A45-A0C4E2DB0326.b08` | 4552 | `ef44570165e77838333ea952f9f6e8e7b161b757` |
| `32552B22-89FE-42B4-8A45-A0C4E2DB0326.mdt` | 5120 | `a425efb9f045acccaf60ac3873342d8daac5a819` |
| `FD719D50-FFFB-11EB-9A03-0242AC130003.b00` | 568 | `1da26a139b8436a315048db0dfa10fb3adc998d5` |
| `FD719D50-FFFB-11EB-9A03-0242AC130003.b01` | 57662 | `a6bb08a8326eae51cb5976c4dd5ff714d982bf1b` |
| `FD719D50-FFFB-11EB-9A03-0242AC130003.b02` | 263 | `bbb0a392c0e6f127096f274ece02679f1c7370c2` |
| `FD719D50-FFFB-11EB-9A03-0242AC130003.b03` | 728 | `addfce7884791ff7d5aa34a93286578bfea93731` |
| `FD719D50-FFFB-11EB-9A03-0242AC130003.b04` | 2272 | `15899fa309a3c6c24ebd0b813f2dfce2c49ebc4a` |
| `FD719D50-FFFB-11EB-9A03-0242AC130003.b05` | 304 | `8fb7ee7bc49eeef795022bb06ccef76705371498` |
| `FD719D50-FFFB-11EB-9A03-0242AC130003.b06` | 10251 | `be50ca419be1a25cefddb3b8dc11ef2ff0a38371` |
| `FD719D50-FFFB-11EB-9A03-0242AC130003.b07` | 728 | `addfce7884791ff7d5aa34a93286578bfea93731` |
| `FD719D50-FFFB-11EB-9A03-0242AC130003.b08` | 4552 | `343400098b62a624384b8ce7eecabbf7b96b3993` |
| `FD719D50-FFFB-11EB-9A03-0242AC130003.mdt` | 5120 | `563a841740a0a15252326301dbc5038a4176142f` |
