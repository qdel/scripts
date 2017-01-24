#!/bin/bash

echo "WAKE: Start of wakeup script" >> /dev/kmsg
sudo /etc/init.d/fancontrol restart
#lspci -s 01:00.0 -xxxx > /home/rholk/dumps/vga-before-wakeup.reg
#lspci -s 01:00.1 -xxxx > /home/rholk/dumps/snd-before-wakeup.reg
#sudo virsh list | grep win10 | grep pmsuspend >> /dev/kmsg
#W=$?
#while [ $W -eq 0 ] ; do
#    echo "win10 is sleeping, waking it up" >> /dev/kmsg
#    sudo virsh dompmwakeup win10 >> /dev/kmsg
#    echo "win10 is now awaken" >> /dev/kmsg
#    sudo virsh list | grep win10 | grep pmsuspend >> /dev/kmsg
#    W=$?
#done
echo "WAKE: Content of /tmp/restartwin" >> /dev/kmsg
cat /tmp/restartwin >> /dev/kmsg
IFS=$'\n'
for i in `cat /tmp/restartwin` ; do
    echo "WAKE: $i was shutted down by sleep script, assume i should restart it" >> /dev/kmsg
#    sudo virsh dompmwakeup $i
    sudo virsh start $i
done
echo "WAKE: End of wakeup script"
#lspci -s 01:00.0 -xxxx > /home/rholk/dumps/vga-after-wakeup.reg
#lspci -s 01:00.1 -xxxx > /home/rholk/dumps/snd-after-wakeup.reg
nmcli c down Bridge >> /dev/kmsg
nmcli c up Bridge >> /dev/kmsg
sudo brctl addif br eth0 >> /dev/kmsg
