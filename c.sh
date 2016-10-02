#!/bin/bash

###############################################################################
# Instructions:
################
#
# Implement the body of this script, 
#    following the instructions in instructions/c.rst
#
###############################################################################
if [ -d "$1" ]; then
    rm -r "$1"
fi

mkdir "$1"

for i in January February March April May June July August September October November December; do
    
    mkdir -p "$1"/"$i"

    case $i in
	January) for day in $(seq --separator=" " 1 31); do touch $1/$i/$day; done;; 
        February) for day in $(seq --separator=" " 1 28); do touch $1/$i/$day; done;;
	March) for day in $(seq --separator=" " 1 31); do touch $1/$i/$day; done;;
	April) for day in $(seq --separator=" " 1 30); do touch $1/$i/$day; done;;
	May) for day in $(seq --separator=" " 1 31); do touch $1/$i/$day; done;;
	June) for day in $(seq --separator=" " 1 30); do touch $1/$i/$day; done;;
	July) for day in $(seq --separator=" " 1 31); do touch $1/$i/$day; done;;
	August) for day in $(seq --separator=" " 1 31); do touch $1/$i/$day; done;;
	September) for day in $(seq --separator=" " 1 30); do touch $1/$i/$day; done;;
	October) for day in $(seq --separator=" " 1 31); do touch $1/$i/$day; done;;
	November) for day in $(seq --separator=" " 1 30); do touch $1/$i/$day; done;;
	December) for day in $(seq --separator=" " 1 31); do touch $1/$i/$day; done;;
    esac
done
