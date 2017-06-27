#!/bin/bash

# https://github.com/foosel/OctoPrint/wiki/Assorted-OctoPrint-Quick-Tips#flashing-a-new-arduino-firmware-directly-from-your-octoprint-host

echo "stopping OctoPrint"
sudo service octoprint stop

echo "flashing $1"
sudo /usr/bin/avrdude -C/etc/avrdude.conf -v -v -patmega2560 -cwiring -P/dev/ttyUSB0 -b115200 -D -Uflash:w:$1:i

echo "starting OctoPrint"
sudo service octoprint start
