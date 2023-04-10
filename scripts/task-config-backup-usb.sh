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

# Backup
if [[ $(findmnt -M "$dest") ]]; then
    timestamp="$(date +%Y%m%d%H%M%S)"
    # VyOS Commands
    /opt/vyatta/bin/vyatta-op-cmd-wrapper show configuration commands | gzip -3 -c > "${dest}/vyos-commands.${timestamp}.gz"
    # VyOS /config
    tar --exclude="overlay*" --exclude="unifi*" -zvcf "${dest}/vyos-config.${timestamp}.tar.gz" /config
    # Unifi backups
    rsync -r /config/containers/unifi/data/backup/autobackup/ $dest
    # Delete backups older than 1 month
    find $dest -type f -mtime +30 -delete
    # Sync the filesystem
    sync
    # Unmount the drive
    sudo umount $dest
fi
