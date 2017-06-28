#!/bin/bash

#
# Install camera module of gc2035 into kernel

KERN_VER=$(uname -r)
MODULE_PATH=/lib/modules/${KERN_VER}/kernel/drivers/media/v4l2-core/rda/
MODULE=rda_cam_sensor

if [ -f ${MODULE_PATH}/${MODULE}.ko ]; then
  insmod ${MODULE_PATH}/${MODULE}.ko > /dev/null 2>&1
fi

TEST_FILE=
LINK=https://raw.githubusercontent.com/OrangePiLibra/OrangePiRDA_external/master/CameraTest/CameraTest.c
# Install camera test applicattion
if [ ! -d /usr/local/share/orangepi ]; then
  mkdir -p /usr/local/share/orangepi
fi
curl -o /usr/local/share/orangepi/OrangePi_camera_test.c ${LINK}
# compile
gcc /usr/local/share/orangepi/OrangePi_camera_test.c -ljpeg -o /usr/local/bin/OrangePi_Camera

