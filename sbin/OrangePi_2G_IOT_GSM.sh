#!/bin/bash

#
# Install GSM into User space

TEST_FILE=
LINK=https://raw.githubusercontent.com/OrangePiLibra/OrangePiRDA_external/master/2G/OrangePi_2G_IOT_GSM_Demo.c
# Install camera test applicattion
if [ ! -d /usr/local/share/orangepi ]; then
  mkdir -p /usr/local/share/orangepi
fi
curl -o /usr/local/share/orangepi/OrangePi_2G_IOT_GSM.c ${LINK}
# compile
gcc /usr/local/share/orangepi/OrangePi_2G_IOT_GSM.c -o /usr/local/bin/OrangePi_GSM

