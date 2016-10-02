#!/bin/bash

###############################################################################
# Instructions:
################
#
# Implement the body of this script, 
#    following the instructions in instructions/a.rst
#
###############################################################################
if [ $# -ne 1 ] || [ $1 -lt 1000 ]; then
    echo "Usage: $0 year"
    exit
fi

if [ -d "$1" ]; then
    rm -r "$1"
fi

mkdir "$1"

for i in January February March April May June July August September October November December; do

    mkdir -p "$1"/"$i"

    case $i in
        January|March|May|July|August|October|December)
            for day in $(seq --separator=" " 1 31); do 
		wget -O $1/$i/$day -q https://en.wikipedia.org/w/index.php?title=${i}_${day}&printable=yes; 
	    done;;
        February)
            if [ $[ $1%400 ] -eq 0 ]; then 
		for day in $(seq --separator=" " 1 29); do 
		    wget -O $1/$i/$day -q https://en.wikipedia.org/w/index.php?title=${i}_${day}&printable=yes; 
		done; 
	    elif [ $[ $1%100 ] -eq 0 ]; then
		for day in $(seq --separator=" " 1 28); do 
		    wget -O $1/$i/$day -q https://en.wikipedia.org/w/index.php?title=${i}_${day}&printable=yes; 
		done;
	    elif [ $[ $1%4 ] -eq 0 ]; then
		for day in $(seq --separator=" " 1 29); do 
		    wget -O $1/$i/$day -q https://en.wikipedia.org/w/index.php?title=${i}_${day}&printable=yes;
		done;
	    else
		for day in $(seq --separator=" " 1 28); do 
		    wget -O $1/$i/$day -q https://en.wikipedia.org/w/index.php?title=${i}_${day}&printable=yes; 
		done;
            fi;;
	April|June|September|November)
            for day in $(seq --separator=" " 1 30); do 
		wget -O $1/$i/$day -q https://en.wikipedia.org/w/index.php?title=${i}_${day}&printable=yes; 
	    done;;
    esac
done
