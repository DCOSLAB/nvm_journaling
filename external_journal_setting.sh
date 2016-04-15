#!/bin/bash

RAMDISK_PATH=/dev/block/ram0
DEVICE_PATH=/dev/block/mmcblk0p2
SYSTEM_PATH=/system

dd if=/dev/zero of=$RAMDISK_PATH bs=1k count=307200

mke2fs -O journal_dev -t ext4 -b 4096 $RAMDISK_PATH

mount -o remount,ro $DEVICE_PATH $SYSTEM_PATH

tune2fs -f -O ^has_journal $DEVICE_PATH

e2fsck -fp $DEVICE_PATH

sleep 5

mount -o remount,rw $DEVICE_PATH $SYSTEM_PATH

tune2fs -J device=$RAMDISK_PATH $DEVICE_PATH

