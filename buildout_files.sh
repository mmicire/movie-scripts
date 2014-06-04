#!/bin/bash

#Lets get the basename of the file
FILENAME=$1
echo "Filename: " $FILENAME
BASENAME=`basename "$1"`
echo "Basename: " $BASENAME
OUTPUTNAME=${BASENAME%.*}
echo "Outputname: " $OUTPUTNAME

mkdir "$OUTPUTNAME"
mkdir "$OUTPUTNAME"/Original
cp "$1" "$OUTPUTNAME"/Original/


