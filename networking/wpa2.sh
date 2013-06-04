#!/bin/sh

sudo killall wpa_supplicant
sudo killall dhcpcd
sudo ip link set wlan0 down
sudo ip link set wlan0 up
sudo wpa_supplicant -B -cconfig.wpa2 -iwlan0

sudo dhcpcd wlan0
