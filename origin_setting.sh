

dd if=/dev/zero of=/dev/block/ram0 bs=1k count=307200

mke2fs -t ext4 -b 4096 /dev/block/ram0

mount -t ext4 /dev/block/ram0 /sdcard/ramdisk
