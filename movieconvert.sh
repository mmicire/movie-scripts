#!/bin/bash

#Lets get the basename of the file
THE_PATH=$(readlink -f "$1")
echo "Path: " $THE_PATH
FILENAME=`basename "$THE_PATH"`
echo "Outputname: " $FILENAME

#This will try to figure out the original file extension.
#It is fragile, always takes the last glob, and should be done better than this.

ORIGINAL_EXT="unknown"
if [ -d "$THE_PATH"/Original/VIDEO_TS ]
   then
     echo "$filename : DVD file"
     ORIGINAL_EXT=""
fi		

for filename in "$THE_PATH"/Original/*
do
        ext=${filename##*\.}
        case "$ext" in
        avi) echo "$filename : avi file"
             ORIGINAL_EXT=".avi"
           ;;
        flv) echo "$filename : flv file"
             ORIGINAL_EXT=".flv"
           ;;
        iso) echo "$filename : iso file"
             ORIGINAL_EXT=".iso"
            ;;
        mkv) echo "$filename : mkv file"
             ORIGINAL_EXT=".mkv"
             ;;
        mp4) echo "$filename : mp4 file"
             ORIGINAL_EXT=".mp4"
             ;;
        m4v) echo "$filename : m4v file"
             ORIGINAL_EXT=".m4v"
             ;;
        mpg) echo "$filename : mpg file"
             ORIGINAL_EXT=".mpg"
             ;;
        *) echo " $filename : Not a video file"
           ;;
esac
done

if [ "$ORIGINAL_EXT" == 'unknown' ]
   then
     echo "No files to render here.  Something is probably wrong."
     exit
fi
echo "Going to render " "\"""$FILENAME""$ORIGINAL_EXT""\""


#Setup the Handbrake specific options
HANDBRAKE=/usr/bin/HandBrakeCLI
HANDBRAKE_OPTIONS="--optimize --markers"
MOVIE_OPTIONS=""  #Will be sourced from .opt file if present
PRESET_LIST="Universal"
DEFAULT_DIR="Universal"

if [ -f "$THE_PATH"/Original/"$FILENAME".opt ]
  then
    echo -n "Movie specific options exist: "
    source "$THE_PATH"/Original/"$FILENAME".opt
    echo $MOVIE_OPTIONS
fi

for PRESET in $PRESET_LIST     # Splits the variable in parts at whitespace.
do
    if [ ! -d "$THE_PATH"/"$PRESET" ]
      then
       mkdir "$THE_PATH"/"$PRESET"
    fi
    if [ "$ORIGINAL_EXT" == '' ]
      then
        $HANDBRAKE -i "$THE_PATH"/Original/ -o "$THE_PATH"/$PRESET/"$FILENAME".mp4 $HANDBRAKE_OPTIONS $MOVIE_OPTIONS --preset "$PRESET" 2>&1 | tee "$THE_PATH"/"$FILENAME".log
    else
        $HANDBRAKE -i "$THE_PATH"/Original/"$FILENAME""$ORIGINAL_EXT" -o "$THE_PATH"/$PRESET/"$FILENAME".mp4 $HANDBRAKE_OPTIONS $MOVIE_OPTIONS --preset "$PRESET" 2>&1 | tee "$THE_PATH"/"$FILENAME".log
    fi
done

#Now lets link to the version that we want to show in the root of the movie dir
ln -s "$THE_PATH"/"$DEFAULT_DIR"/"$FILENAME".mp4 "$THE_PATH"/"$FILENAME".mp4 



#ffmpeg -i "$FILENAME" -vcodec libx264 -preset ultrafast -profile:v baseline -pix_fmt yuv420p -strict -2 -acodec aac -ab 16k "$FILENAME".m4v

