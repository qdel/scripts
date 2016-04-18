#!/bin/bash
#exit 0
echo "ON" >> /dev/kmsg
echo ON | tee -a /proc/acpi/bbswitch
echo "ON-DONE" >> /dev/kmsg
sleep 1
echo "suspend hook finished" >> /dev/kmsg
