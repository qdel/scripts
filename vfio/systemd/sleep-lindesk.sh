#!/bin/bash

echo "SLEEP: Sleeping" >> /dev/kmsg
#lspci -s 01:00.0 -xxxx > /home/rholk/dumps/vga-before-sleep.reg
#lspci -s 01:00.1 -xxxx > /home/rholk/dumps/snd-before-sleep.reg
sudo rm /tmp/restartwin
IFS=$'\n'
for VM in `virsh list --name` ; do
    sudo virsh list | grep $VM >> /dev/kmsg
    if [ $? -eq 0 ] ; then
	    sudo virsh list | grep $VM | grep running >> /dev/kmsg
	    W=$?
	    while [ $W -eq 0 ] ; do
            echo "SLEEP: $VM running, shutting it down" >> /dev/kmsg
            grep $VM /tmp/restartwin
            if [ ! $? -eq 0 ] ; then
                echo $VM | sudo tee -a /tmp/restartwin
            fi
	        sudo virsh shutdown $VM >> /dev/kmsg
            #sudo virsh dompmsuspend --target disk $VM >> /dev/kmsg
	        echo "SLEEP: Cmd return:"$? >> /dev/kmsg
            sudo virsh list >> /dev/kmsg
	        sudo virsh list | grep $VM | grep running >> /dev/kmsg
            W=$?
	    done
    fi
done
sync
echo "SLEEP: Sleeping done (vm sleeping or shutted down)" >> /dev/kmsg
#lspci -s 01:00.0 -xxxx > /home/rholk/dumps/vga-after-sleep.reg
#lspci -s 01:00.1 -xxxx > /home/rholk/dumps/snd-after-sleep.reg
