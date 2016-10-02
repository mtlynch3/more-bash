#!/bin/bash

###############################################################################
# Instructions:
################
#
# Implement the body of this script, 
#    following the instructions in instructions/b.rst
#
###############################################################################
if [ $# -ne 1 ]; then
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
	    for day in $(seq --separator=" " 1 31); do touch $1/$i/$day; done;;
        February)
	    if [ $[ $1%4 ] -eq 0 ]; then for day in $(seq --separator=" " 1 29); do touch $1/$i/$day; done; fi
	    for day in $(seq --separator=" " 1 28); do touch $1/$i/$day; done;;
        April|June|September|November) 
	    for day in $(seq --separator=" " 1 30); do touch $1/$i/$day; done;;
    esac
done

