#!/bin/bash

# Create a folder for mount
sudo mkdir -p /media/ssd

# Mount the SSD as /mnt
sudo mount -t ext4 /dev/nvme0n1p1 /media/ssd
# Copy over the rootfs from the SD card to the SSD
sudo rsync -axHAWX --numeric-ids --info=progress2 --exclude={"/dev/","/proc/","/sys/","/tmp/","/run/","/mnt/","/media/*","/lost+found"} / /mnt
# We want to keep the SSD mounted for further operations
# So we do not unmount the SSD
