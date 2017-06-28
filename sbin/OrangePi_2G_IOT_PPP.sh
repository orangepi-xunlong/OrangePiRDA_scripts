#!/bin/bash

#
# PPP connect wifi

apt-get -y --no-install-recommends --fix-missing install \
	ppp wvdial

if [ -f /etc/wvdial.conf ]; then
  mv /etc/wvdial.conf /etc/wvdial.conf.bak
fi

cat > "/etc/wvdial.conf" <<EOF
[Dialer defaults]
ISDN = 0
Modem Type = Analog Modem
Phone = *99***1#
Stupid Mode = 1
Dial Command = ATDT
Modem = /dev/modem0
Baud = 460800
Init1 = AT+COPS=0
Init2 = AT+CFUN=1
Init3 = AT+CGATT=1
Init4 = AT+CGDCONT=1,"IP","OrangePi_2G-IOT","",0,0
Init5 = AT+CGACT=1,1
Username = " "
Password = " "
EOF

if [ -f /etc/ppp/peers/wvdial ]; then
  mv /etc/ppp/peers/wvdial /etc/ppp/peers/wvdial.bak
fi

cat > "/etc/ppp/peers/wvdial" <<EOF
noauth
name wvdial
defaultroute
replacedefaultroute
EOF
