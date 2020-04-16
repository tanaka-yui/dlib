#!/usr/bin/env bash

export TOOLS=commandlinetools-linux-6200805_latest.zip
apt-get -y update
apt-get -y install openjdk-8-jdk
apt -y install gradle
apt -y install cmake
apt -y install g++
apt -y install wget
wget https://dl.google.com/android/repository/${TOOLS}
unzip ${TOOLS}
yes | ./tools/bin/sdkmanager --install "platforms;android-21" "ndk;21.0.6113669" "build-tools;29.0.3" "cmake;3.10.2.4988404" --sdk_root=./tools/
rm -f ${TOOLS}