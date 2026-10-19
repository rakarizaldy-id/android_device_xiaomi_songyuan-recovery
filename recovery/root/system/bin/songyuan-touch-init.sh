#!/system/bin/sh
# Native Songyuan ID305 — OEM FocalTech v35, 148352 bytes; bounded retry.
# No partition writes, no flash, no foreign firmware.
# ID305 modules.dep: FocalTech -> Xiaomi Touch -> panel_event_notifier.
# miev is NOT a module/dependency in the OEM graph: never gate on it.
LOG=/tmp/songyuan-touch-init.log
FW=/odm/firmware/focaltech_ts_fw_songyuan.bin
MOD1=/vendor_dlkm/lib/modules/xiaomi_touch.ko
MOD2=/vendor_dlkm/lib/modules/focaltech_touch_3685g_1.ko
SEARCH=/sys/module/firmware_class/parameters/path
VERSION=/sys/bus/spi/devices/spi19.0/fts_fw_version
RAW=/sys/class/touch/touch_dev/enable_touch_raw
SHA=7a5e927deeda12ac9fe8ea0dbdd673702222ddccbc37088ffc84d7c328b85fcc
log(){ echo "$*" >>"$LOG"; }
loaded(){ [ -d "/sys/module/$1" ] || grep -q "^$1 " /proc/modules 2>/dev/null; }
log 'start native ID305 touch'
i=0
while [ "$i" -lt 45 ]; do
    [ -r "$FW" ] && [ -r "$MOD1" ] && [ -r "$MOD2" ] &&
        loaded panel_event_notifier && break
    i=$((i+1));sleep 1
done
[ -r "$FW" ] && [ -r "$MOD1" ] && [ -r "$MOD2" ] &&
    loaded panel_event_notifier || { log 'FAIL prereq: FocalTech dependency/firmware';exit 1; }
ok=0;i=0
while [ "$i" -lt 20 ]; do
    output=$(wc -c <"$FW" 2>/dev/null);rc=$?
    set -- $output;n=${1:-}
    if [ "$rc" -eq 0 ]; then
        case "$n" in
            148352) ok=1;break ;;
            ''|*[!0-9]*) : ;;
            *) log 'FAIL firmware length';exit 1 ;;
        esac
    fi
    i=$((i+1));sleep 1
done
[ "$ok" -eq 1 ] || exit 1
ok=0;i=0
while [ "$i" -lt 20 ]; do
    h=$(/system/bin/sha256sum "$FW" 2>/dev/null);rc=$?
    digest=${h%% *}
    if [ "$rc" -eq 0 ] && [ "$digest" = "$SHA" ]; then ok=1;break;fi
    [ "$rc" -eq 0 ] && [ -n "$digest" ] && { log 'FAIL wrong hash';exit 1; }
    i=$((i+1));sleep 1
done
[ "$ok" -eq 1 ] || { log 'FAIL hash unavailable';exit 1; }
if [ -w "$SEARCH" ]; then printf '/odm/firmware\n' >"$SEARCH";fi
if ! loaded xiaomi_touch; then /system/bin/insmod "$MOD1" >>"$LOG" 2>&1 || exit 1;fi
loaded xiaomi_touch || exit 1
if ! loaded focaltech_touch_3685g_1; then /system/bin/insmod "$MOD2" >>"$LOG" 2>&1 || exit 1;fi
loaded focaltech_touch_3685g_1 || exit 1
i=0;ver=
while [ "$i" -lt 30 ]; do
    if [ -r "$VERSION" ] && [ -w "$RAW" ]; then
        read -r ver <"$VERSION"
        [ "$ver" = 35 ] && break
    fi
    i=$((i+1));sleep 1
done
[ "$ver" = 35 ] && [ -w "$RAW" ] || { log 'FAIL no OEM v35';exit 1; }
printf '0\n' >"$RAW" || exit 1
read -r value <"$RAW"
[ "$value" = 0 ] || exit 1
log 'SUCCESS OEM FocalTech v35 raw=0'
