This is used in conjunction with the devmon and udevil scripts. 

INSTALL
1)  sudo apt-get install udevil dvdbackup
2)  Download and install makemkv:  http://www.makemkv.com/forum2/viewtopic.php?f=3&t=224
3)  Add "makemkvcon -r --cache=1 info disc:9999 > /tmp/makemkv_info.txt" to your /etc/rc.local
4)  Mount destination drive at /mnt/ripper and chmod 777

EXECUTE
devmon --exec-on-disc "devmonripblueray.sh %d %f %l" --exec-on-video "devmonripdvd.sh %d %f %l"

