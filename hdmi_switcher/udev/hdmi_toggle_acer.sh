#!/bin/bash
USER_NAME=rholk
USER_ID=1000
HDMI_STATUS=$(</sys/class/drm/card0/card0-HDMI-A-1/status)

export PULSE_SERVER="unix:/run/user/"$USER_ID"/pulse/native"
export PULSE_RUNTIME_PATH="/run/user/"$USER_ID"/pulse/"
echo "Toogling hdmi sound: $HDMI_STATUS" > /dev/kmsg
if [[ $HDMI_STATUS == connected ]]
then
    SINK=0
else
    SINK=1
fi
sudo -E -u "$USER_NAME" pacmd set-default-sink $SINK
echo " => New default sink: $SINK" > /dev/kmsg
IFS=$'\n'
for i in `sudo -E -u "$USER_NAME" pacmd list-sink-inputs | grep index: | sed 's/.*index: \(\d*\)/\1/g'` ; do
    echo " => move $i to $SINK" > /dev/kmsg
    sudo -E -u "$USER_NAME" pacmd move-sink-input $i $SINK
done
