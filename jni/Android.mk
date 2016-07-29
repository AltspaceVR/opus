LOCAL_PATH := $(call my-dir)
OPUS_DIR := ..

include $(OPUS_DIR)/Android.mk

include $(CLEAR_VARS)

LOCAL_MODULE    := codec
LOCAL_SRC_FILES := Opus_jni.cpp
LOCAL_CFLAGS    := -DNULL=0
LOCAL_LDLIBS    := -lm -llog
LOCAL_C_INCLUDES := $(OPUS_DIR)/include
LOCAL_SHARED_LIBRARIES := opus

include $(BUILD_SHARED_LIBRARY)
