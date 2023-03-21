#
# Copyright (C) 2023 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Configure base.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Configure core_64_bit_only.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

# Configure Virtual A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Configure virtual_ab compression.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)

# Configure emulated_storage.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Configure twrp common.mk
$(call inherit-product, vendor/twrp/config/common.mk)

# A/B support
AB_OTA_UPDATER := true

# A/B updater updatable partitions list. Keep in sync with the partition list
# with "_a" and "_b" variants in the device. Note that the vendor can add more
# more partitions to this list for the bootloader and radio.
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    system \
    system_ext \
    odm \
    vendor \
    vendor_dlkm \
    vendor_boot \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor

PRODUCT_PACKAGES += \
    otapreopt_script \
    update_engine \
    update_engine_sideload \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true
    
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true
    
# Userdata Checkpointing OTA GC
PRODUCT_PACKAGES += \
    checkpoint_gc

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-qti.recovery \
    bootctrl.$(PRODUCT_PLATFORM).recovery

# Fastbootd stuff
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# SHIPPING API
PRODUCT_SHIPPING_API_LEVEL := 30

# VNDK API
PRODUCT_TARGET_VNDK_VERSION := 33

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

ifneq ($(TW_SKKK_VER_CODE),)
PRODUCT_PROPERTY_OVERRIDES += ro.twrp.version.skkk.code=$(TW_SKKK_VER_CODE)
endif


