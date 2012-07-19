# sysctl parameters

PRODUCT_COPY_FILES += \
    device/amazon/otter/prebuilt/etc/init.d/01sysctl:system/etc/init.d/01sysctl \
    device/amazon/otter/prebuilt/etc/sysctl.conf:system/etc/sysctl.conf

# build.prop tweaks

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.purgeable_assets=1 \
    pm.sleep_mode=1 \
    wifi.supplicant_scan_interval=180 \
    windowsmgr.max_events_per_sec=200
