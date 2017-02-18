#!/bin/bash

clear;

# default scaling factor (percent)
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
