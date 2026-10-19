# POCO F9 Ultra (songyuan). Device identity from stock ID305 ODM.
LOCAL_DEVICE_PATH := device/xiaomi/songyuan
$(call inherit-product, $(LOCAL_DEVICE_PATH)/device.mk)

PRODUCT_DEVICE := songyuan
PRODUCT_NAME := twrp_songyuan
PRODUCT_BRAND := POCO
PRODUCT_MODEL := POCO F9 Ultra
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_SHIPPING_API_LEVEL := 36
