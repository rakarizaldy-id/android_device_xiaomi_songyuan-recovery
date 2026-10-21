#!/system/bin/sh
# Songyuan ID305 native firmware stage, following Ekin recovery's eSE startup pattern.
LOG=/tmp/songyuan-security-setup.log
note() { echo "$*" >> "$LOG"; }
fail() {
    note "BLOCKED: $*"
    setprop recovery.songyuan.security_firmware_ready 0
    exit 1
}
setprop recovery.songyuan.security_firmware_ready 0

stock=/vendor/firmware_mnt
stage=/tmp/songyuan-secure-element-fwroot
fragments=/system/bin/twrp_secure_element_ta

# init.recovery.qcom.rc mounts the original slot-specific modem VFAT read-only.
[ -d "$stock/image" ] || fail "original Songyuan modem image is not mounted"
[ -d "$fragments" ] || fail "Songyuan native TA directory missing"
mkdir -p "$stage/image" || fail "unable to prepare recovery firmware overlay"
cp -af "$stock/image/." "$stage/image/" || fail "unable to stage original modem firmware"

for mapping in \
    'gpqese 32552B22-89FE-42B4-8A45-A0C4E2DB0326' \
    'st_eseservice FD719D50-FFFB-11EB-9A03-0242AC130003'; do
    set -- $mapping
    alias_name="$1"
    uuid="$2"
    for part in b00 b01 b02 b03 b04 b05 b06 b07 b08 mdt; do
        original="$fragments/$uuid.$part"
        target="$stage/image/$uuid.$part"
        [ -s "$original" ] || fail "missing native Songyuan TA $uuid.$part"
        cp -f "$original" "$target" || fail "TA stage copy failed: $uuid.$part"
        cp -f "$target" "$stage/image/$alias_name.$part" || fail "TA alias failed: $alias_name.$part"
    done
done

chmod 0644 "$stage"/image/* || fail "unable to set staged firmware permissions"
mount --bind "$stage" "$stock" || fail "cannot bind native firmware overlay"
[ -s "$stock/image/gpqese.mdt" ] || fail "gpqese firmware alias not visible"
[ -s "$stock/image/st_eseservice.mdt" ] || fail "eSE firmware alias not visible"

setprop recovery.songyuan.security_firmware_ready 1
setprop ctl.start vendor.minkdaemon
note 'PASS Songyuan ID305 modem and native eSE TA overlay staged; Mink requested'
