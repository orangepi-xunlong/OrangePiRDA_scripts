#!/bin/bash

# auto mount USB

set -e
if ! hash apt-get 2>/dev/null; then
  echo "This scripts requires a Debian based distrbution. If you not use Debian/Ubunut, pls install:[ usbmount ]"
  exit 1
fi

apt-get -y --no-install-recommends --fix-missing install usbmount

if [ -f /etc/udev/rules.d/automount.rules ]; then
  mv /etc/udev/rules.d/automount.rules /etc/udev/rules.d/automount.rules.bak
fi

cat > "/etc/udev/rules.d/automount.rules" <<EOF
ACTION=="add",KERNEL=="sdb*", RUN+="/usr/bin/pmount --sync --umask 000 %k"
ACTION=="remove", KERNEL=="sdb*", RUN+="/usr/bin/pumount %k"
ACTION=="add",KERNEL=="sdc*", RUN+="/usr/bin/pmount --sync --umask 000 %k"
ACTION=="remove", KERNEL=="sdc*", RUN+="/usr/bin/pumount %k"
EOF

udevadm control --reload-rules
