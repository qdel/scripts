#!/bin/bash
echo "Sleeping" >> /dev/kmsg
sudo virsh list >> /dev/kmsg
sudo virsh list | grep win10 | grep running
if [ $? -eq 0 ] ; then
    echo "win10 running, putting it to sleep" >> /dev/kmsg
    sudo virsh dompmsuspend --domain win10 --target mem
    sleep 2
    sudo virsh list >> /dev/kmsg
    sudo virsh list | grep win10 | grep pmsuspend
    if [ $? -eq 0 ] ; then
        echo "win10 now sleeping" >> /dev/kmsg
    else
        echo "win10 not sleeping" >> /dev/kmsg
        exit 1
    fi
fi
echo "Sleeping done" >> /dev/kmsg
