#!/system/bin/sh
# Adapted from EkinStrop's eSE/OMAPI/Thales sequencing.
# Songyuan hardware: ST54 + genuine QTI secure element + MiAuthSecret + Thales.
# State=running does not prove AIDL getConfig or FBE CE/PIN success.
LOG=/tmp/songyuan-weaver-start.log
note(){ echo "$*" >> "$LOG"; }
wait_service() {
    name="$1"; i=0
    while [ "$i" -lt 20 ]; do
        [ "$(getprop "init.svc.$name")" = running ] && return 0
        sleep 1; i=$((i+1))
    done
    note "BLOCKED service startup: $name"
    return 1
}
if [ "$(getprop recovery.songyuan.security_firmware_ready)" != 1 ]; then
    note 'BLOCKED genuine firmware stage not ready'
    exit 1
fi
i=0
while [ ! -e /dev/st54spi_gpio ] && [ "$i" -lt 20 ]; do
    sleep 1; i=$((i+1))
done
[ -e /dev/st54spi_gpio ] || { note 'BLOCKED original ST54 device node'; exit 1; }
start vendor.secure_element
wait_service vendor.secure_element || exit 1
# se_omapi is started by the original TWRP16 external/se_omapi init_rc.
wait_service se_omapi || exit 1
start miweaver_hal_service
wait_service miweaver_hal_service || exit 1
start weaver_hal_service
wait_service weaver_hal_service || exit 1
note 'PASS process startup ordering only; require live AIDL registration testing'
