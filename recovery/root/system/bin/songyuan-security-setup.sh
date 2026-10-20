#!/system/bin/sh
LOG=/tmp/songyuan-security-setup.log
note(){ echo "$*" >> "$LOG"; }
for path in /vendor/etc/ssg/ta_config.json /vendor/bin/hlosminkdaemon /vendor/firmware_mnt/image; do
    if [ ! -e "$path" ]; then
        note "BLOCKED missing genuine ID305 prerequisite: $path"
        setprop recovery.songyuan.security_firmware_ready 0
        exit 1
    fi
done
setprop recovery.songyuan.security_firmware_ready 1
setprop ctl.start vendor.minkdaemon
note 'PASS Songyuan OEM firmware view ready; requested original Mink'
