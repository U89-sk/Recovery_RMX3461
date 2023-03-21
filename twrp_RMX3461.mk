#
# Copyright (C) 2023 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/realme/RMX3461

# Release name
PRODUCT_RELEASE_NAME := RMX3461

$(call inherit-product, $(DEVICE_PATH)/device.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := RMX3461
PRODUCT_NAME := twrp_RMX3461
PRODUCT_BRAND := Realme
PRODUCT_MODEL := RMX3461
PRODUCT_MANUFACTURER := Realme

# Assert
TARGET_OTA_ASSERT_DEVICE := RE54BFL1,RMX3461
