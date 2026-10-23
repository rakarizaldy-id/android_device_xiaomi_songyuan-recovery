#!/system/bin/sh
# Ekin's eSE -> OMAPI -> Weaver -> prepdecrypt order, using Songyuan MIAuthSecret.
timeout=20
while [ ! -e /dev/st54spi_gpio ] && [ "$timeout" -gt 0 ]; do
    sleep 1
    timeout=$((timeout - 1))
done

start vendor.secure_element
sleep 3
start se_omapi
sleep 2
start miweaver_hal_service
start weaver_hal_service
sleep 2
start odm.prepdecrypt
