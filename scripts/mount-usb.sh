#!/bin/bash
#
# Description: Backup VyOS configuration to a USB device
#
dest="/media/vyos-backup"
disk="/dev/disk/by-id/usb-Kingston_DataTraveler_3.0_40B0767E23131611A6534646-0:0-part2"
user="vyos"

# Mount a formatted exfat USB
if [[ ! $(findmnt -M "$dest") ]]; then
    sudo mkdir -p $dest
    sudo mount.exfat-fuse -o "rw,uid=${user},gid=vyattacfg" $disk $dest
fi
