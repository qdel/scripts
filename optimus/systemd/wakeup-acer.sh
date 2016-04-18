#!/bin/bash

sleep 1
echo "OFF" >> /dev/kmsg
echo OFF | tee -a /proc/acpi/bbswitch
echo "OFF DONE" >> /dev/kmsg
/home/rholk/sbin/tpacer
