# Change interface names to eth0 and wlan0
sudo su
ln -s /dev/null /etc/udev/rules.d/80-net-name-slot.rules

# For the sound to work correctly
sudo -c 'echo "blacklist snd_hda_codec_hdmi" >> /etc/modprobe.d/blacklist.conf'
exit

