#!/usr/bin/env bash

export DLIB_PATH=`pwd`
export ANDROID_HOME=$DLIB_PATH/tools
export ANDROID_NDK=$ANDROID_HOME/ndk/21.0.6113669
export CMAKE_HOME=$ANDROID_HOME/cmake/3.10.2.4988404
export CMAKE=$CMAKE_HOME/bin/cmake
export CMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake
export ARM_NEON_IS_AVAILABLE=FALSE

cmake -DCMAKE_TOOLCHAIN_FILE="${CMAKE_TOOLCHAIN_FILE}" \
      -DCMAKE_INSTALL_PREFIX="${DLIB_PATH}/dlib_native" \
      -DCMAKE_BUILD_TYPE="Release" \
      -DCMAKE_CXX_FLAGS="-std=c++11 -frtti -fexceptions -w" \
      -DANDROID_NDK="${ANDROID_NDK}" \
      -DANDROID_ABI="armeabi-v7a" \
      -DANDROID_ARM_NEON=FALSE \
      -DANDROID_PLATFORM="android-21" \
      -DANDROID_TOOLCHAIN="clang" \
      -DANDROID_STL="c++_static" \
      -DANDROID_CPP_FEATURES="rtti exceptions" \
      -DANDROID_LINKER_FLAGS="-landroid -llog" \
      -DDLIB_PNG_SUPPORT=ON \
      -DDLIB_JPEG_SUPPORT=ON \
      -DDLIB_NO_GUI_SUPPORT=TRUE \
      -DDLIB_USE_BLAS=FALSE \
      -DDLIB_USE_LAPACK=FALSE \
      -DARM_NEON_IS_AVAILABLE=FALSE \
      -DDLIB_USE_CUDA=FALSE \
      "${DLIB_PATH}/CMakeLists.txt"

cmake --build .