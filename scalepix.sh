#!/bin/bash

clear;

# check dependencies
echo "Checking dependencies:"

if hash exiv2 2>/dev/null; then
    echo "exiv2: found!"
else
    echo "\"exiv2\" must be installed. Aborting."
    exit 1;
fi

if hash convert 2>/dev/null; then
    echo "convert: found!"
else
    echo "\"convert\" must be installed. Aborting."
    exit 1;
fi

# set default scaling factor (percent)
percent=50

# check if args
if [ $# -ne 0 ]
    then
        case $1 in
            ''|*[!0-9]*) echo "Argument must be a number. Aborting."
                exit 1;
                ;;
            *) percent=$1
                ;;
        esac
fi

# ask to continue
read -p "Converting images in folder:
Scaling: $percent%
Proceed? [y][N]: " answer

case "$answer" in
    Yes|yes|Y|y) echo "Processing..."
        ;;
    No|no|N|n|"") echo "Aborting."
        exit 1
        ;;
    *) echo "Unknown input. Please type \"y\" or \"n\". Aborting."
        exit 1
        ;;
esac

# get a list of all jpeg files files in the current directory
# (-iname = case insensitive: finds ".jpg" or ".JPG")
pictures=`find . -maxdepth 1 -iname '*.jpg'`

# force lower case file extension
for picture in $pictures; do

    # current file
    current_file=$picture

    # full filename (with extension)
    full_filename=${current_file##*/}

    # filename without extension
    filename=${full_filename%.*}

    # save with lowercase jpg extension
    mv -f $picture $filename.jpg

done
