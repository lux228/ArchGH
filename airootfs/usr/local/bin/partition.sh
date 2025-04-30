#!/usr/bin/env bash
set -e

whiptail --title "Disk partitioning tool" --yesno "Do you want to launch cfdisk to partition your disk?" 10 60

if [ $? -eq 0 ]; then
    DISK=$(lsblk -d -n -o NAME,SIZE | whiptail --title "Select disk" --menu "Choose a disk to partition:" 20 70 10 $(lsblk -d -n -o NAME,SIZE | awk '{print $1, $2}') 3>&1 1>&2 2>&3)
    [ -n "$DISK" ] && cfdisk "/dev/$DISK"
else
    echo "Partitioning aborted."
fi
