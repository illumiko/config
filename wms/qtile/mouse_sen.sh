#!/bin/bash

DEVICE_NAME="ELAN1301:00 04F3:3128 Touchpad"
SENSITIVITY_VALUE=0.5

DEVICE_ID=$(libinput list-devices | grep -i "$DEVICE_NAME" -A 4 | grep -i 'id' | awk '{print $3}')
xinput --set-prop $DEVICE_ID "libinput Accel Speed" $SENSITIVITY_VALUE

