LOCAL_PATH := $(call my-dir)

# Lets clear other make file variable
include $(CLEAR_VARS)

# Give test.c as input file for cross compilation
LOCAL_SRC_FILES := test.cpp

# Give name of the cross compiled binary
LOCAL_MODULE := test

# Give command to build executable
#include $(BUILD_SHARED_LIBRARY)
#include $(BUILD_EXECUTABLE)

#APP_PLATFORM := android-21


#LOCAL_CPP_EXTENSION := .cpp

#LOCAL_CFLAGS += -I<path>,

#include $(LOCAL_PATH)/Android.mk


#../android-ndk-r26b/ndk-build
