LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
    LOCAL_MODULE := realme_prebuilt
    LOCAL_MODULE_TAGS := optional
    LOCAL_MODULE_CLASS := ETC
    LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)
    LOCAL_POST_INSTALL_CMD += \
        cp -rf $(LOCAL_PATH)/modules.load.recovery $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib/modules/1.1/; \
        mkdir -p $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware; \
        cp -rf $(LOCAL_PATH)/$(PRODUCT_RELEASE_NAME)/firmware $(TARGET_RECOVERY_ROOT_OUT)/vendor/;
include $(BUILD_PHONY_PACKAGE)