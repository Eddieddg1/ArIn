#!/bin/bash

sure1=n
sure2=n

while [[ ! ($sure1 == y && $sure2 == y || $sure1 == Y && $sure2 == Y || $sure1 == "" && $sure2 == "") ]]; do
    clear

    echo "Available disks:"
    fdisk -l | grep "Disk /dev/"
    read -p "Enter the disk to partition (e.g., sda, nvme0n1): " DISK

    if [[ ! $DISK =~ ^(sd[a-z]|nvme[0-9]n[0-9])$ ]]; then
        read -p "Are you sure this is the one? y/n: " sure1
        read -p "Please double check just in case. y/n: " sure2
    elif [[ $DISK =~ ^(sd[a-z]|nvme[0-9]n[0-9])$ ]]; then
        read -p "Are you sure? y/n: " sure1
        sure2=$sure1
        break
    fi
done

if [[ $DISK == nvme* ]]; then
    PART_SUFFIX="p"
else
    PART_SUFFIX=""
fi

clear

read -p "Do you want a seperate '/home' partition? y/n: " Home
if [[ $Home == y || $Home == Y || $Home == "" ]]; then
    read -p "Root partition size. Just enter a number, said number will represent GB.(at least 30): " RootSize
    rtAttempts=0
    while [[ $RootSize -lt 30 ]]; do
        echo "Too small, I said at least '30'."
        read -p "Root partition size. Just enter a number, said number will represent GB.(at least 30): " RootSize
        ((rtAttempts++))
        if [[ $rtAttempts -ge 10 ]]; then
            Home=n
            break
        fi
    done
fi

export $DISK
export $PART_SUFFIX
export $RootSize
export $Home
