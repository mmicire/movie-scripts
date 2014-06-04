#!/bin/bash

MOUNT_POINT="$1"
DEVICE="$2"
LABEL="$3"

mkdir /mnt/ripper/"$LABEL" 
dvdbackup -M -v -p -i "$DEVICE" -o /mnt/ripper/"$LABEL" &>/mnt/ripper/"$LABEL"/"$LABEL".log
eject "$DEVICE"
