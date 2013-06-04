#!/bin/sh

sudo killall wpa_supplicant
sudo killall dhcpcd
sudo ip link set wlan0 down
sudo ip link set wlan0 up
sudo iwconfig wlan0 essid "CHANGEMEWITHSSID" key s:CHANGEMEWITHPW

sudo dhcpcd wlan0

