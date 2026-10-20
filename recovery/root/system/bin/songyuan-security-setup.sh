#!/system/bin/sh
# Songyuan adaptation of EkinStrop's recovery security staging architecture.
# Qualcomm TA paths from original ID305 vendor/etc/ssg/ta_config.json.
# Do not stage Nezha trustlets, bind-over /vendor or write to /data.
LOG=/tmp/songyuan-security-setup.log
note(){ echo "$*" >> "$LOG"; }
for path in /vendor/etc/ssg/ta_config.json /vendor/bin/hlosminkdaemon /vendor/firmware_mnt/image; do
    if [ ! -e "$path" ]; then
        note "BLOCKED missing genuine ID305 prerequisite: $path"
        setprop recovery.songyuan.security_firmware_ready 0
        exit 1
    fi
done
# Trustlet resolution remains vendor-first exactly as specified by ID305 TA config.
setprop recovery.songyuan.security_firmware_ready 1
start vendor.minkdaemon
note 'PASS Songyuan OEM firmware view ready; requested original Mink'
