#!/bin/bash

#Lets get the basename of the file
FILENAME=$1
echo "Filename: " $FILENAME
BASENAME=`basename "$1"`
echo "Basename: " $BASENAME
OUTPUTNAME=${BASENAME%.*}
echo "Outputname: " $OUTPUTNAME

#mkdir "$OUTPUTNAME"
mkdir "$1"/Original
mv "$1"/* "$1"/Original/


