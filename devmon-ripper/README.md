This is used in conjunction with the devmon and udevil scripts. 

INSTALL
1)  sudo apt-get install udevil dvdbackup
2)  Download and install makemkv:  http://www.makemkv.com/forum2/viewtopic.php?f=3&t=224
3)  Add "makemkvcon -r --cache=1 info disc:9999 > /tmp/makemkv_info.txt" to your /etc/rc.local
4)  Mount destination drive at /mnt/ripper and chmod 777

EXECUTE
devmon --exec-on-disc "devmonripblueray.sh %d %f %l" --exec-on-video "devmonripdvd.sh %d %f %l"

The system will then rip the blueray or DVD depending on the disc type and automatically eject the disc on completion or error. There is a .log file in the title's directory that you can "tail -f" to monitor the progress of individual movies. 

Be warned:  Each Blueray requires approximately 500MB of RAM.  DVDs do not require RAM, but should be loaded at approximately the same time since they may cause SATA bus resets and may interfere with each other.  
