#!/bin/bash
echo "Wakeup" >> /dev/kmsg
sleep 2
sudo virsh list >> /dev/kmsg
sudo virsh list | grep win10 | grep pmsuspend
if [ $? -eq 0 ] ; then
    echo "win10 is sleeping, waking it up" >> /dev/kmsg
    sudo virsh dompmwakeup win10
    echo "win10 is now awaken"
fi
echo "Wakeup done" >> /dev/kmsg
