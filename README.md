# POCO F9 Ultra (songyuan) — TWRP 16

**Device:** POCO F9 Ultra (`songyuan`) · Android 16 · Indonesia `OS3.0.305.0.WGNIDXM`.

## Satu keberhasilan terverifikasi
**PASS — audit source dan graph Soong + Make/Kati.** Device tree pada commit `ee0530fb30648a9a1c7b6f569d92ceb72b4d43b1` berhasil melewati staging dan pemeriksaan graph instalasi tanpa konflik dalam [GitHub Actions #39635740480](https://github.com/rakarizaldy-id/Action-TWRP-Builder/actions/runs/39635740480) (`graph_only=true`). **Ini bukan keberhasilan kompilasi ELF maupun pengujian boot/recovery.**

## Batas yang tetap berlaku
- Firmware, kernel, modul, USB configfs, fstab, layanan, dan library hardware harus berasal dari **Songyuan asli**. Referensi implementasi lain hanya untuk logika; **tidak ada donor binary**.
- Wi-Fi recovery **dikecualikan**. File OEM arsip dan metadata provenance/hash dipertahankan demi integritas serta verifikasi source; keberadaannya **tidak** berarti semuanya dimuat oleh recovery.
- Android compile hanya melalui [builder branch `songyuan`](https://github.com/rakarizaldy-id/Action-TWRP-Builder/tree/songyuan). GitHub hanya boleh merilis ELF AArch64, recovery-root archive dan SHA256; **tidak membuat `recovery.img`, CPIO/image atau Actions artifact**.
- Pengemasan image dilakukan terpisah; hanya pengguna yang melakukan flashing dan pengujian di perangkat.

**Langkah berikutnya:** setelah DT dan builder dibersihkan berurutan serta HEAD diverifikasi, jalankan satu full compile dengan `graph_only=false`. Instruksi kerja aktif berada di [MASTER_HANDOFF](https://github.com/rakarizaldy-id/MASTER_HANDOFF), bukan di riwayat commit.
