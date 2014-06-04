#!/bin/bash

MOUNT_POINT="$1"
DEVICE="$2"
LABEL="$3"

DISC=`cat /tmp/makemkv_info.txt | grep "$DEVICE" | cut -d "," -f 1 | cut -d ":" -f 2`
#DISC=`makemkvcon -r --cache=1 info disc:9999 | grep "$DEVICE" | cut -d "," -f 1 | cut -d ":" -f 2`
echo "disc: variable set to " $DISC

mkdir /mnt/ripper/"$LABEL" 
makemkvcon backup --directio=true --cache=128 --noscan --progress=-same disc:"$DISC" /mnt/ripper/"$LABEL"/"$LABEL"  &>/mnt/ripper/"$LABEL"/"$LABEL".log
eject "$DEVICE"
