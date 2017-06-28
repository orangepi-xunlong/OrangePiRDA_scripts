#!/bin/sh

set -e
if ! hash apt-get 2>/dev/null; then
        echo "This scripts requires a Debian based distrbution. If you not use Debian/Ubunut, pls install:[ bsdtar mtools u-boot-tools pv bc sunxi-tools gcc automake make qemu dosfstools ]"
        exit 1
fi

apt-get -y --no-install-recommends --fix-missing install \
        gcc make vim git whiptail libjpeg8-dev \
	alsa-utils ppp wvdial ca-certificates 

