#
# Setup device specific product configuration.
#

# Inherit some common AOKP stuff.
$(call inherit-product-if-exists, vendor/aokp/config/common_tablet.mk)

# Inherit device configuration for Kindle Fire
$(call inherit-product, device/amazon/otter/full_otter.mk)

PRODUCT_NAME := aokp_otter
PRODUCT_BRAND := android
PRODUCT_DEVICE := otter
PRODUCT_MODEL := Amazon Kindle Fire
PRODUCT_MANUFACTURER := amazon

