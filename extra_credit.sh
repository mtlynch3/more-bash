#!/bin/bash

###############################################################################
# Instructions:
################
#
# Implement the body of this script, 
#    following the instructions in instructions/extra_credit.rst
#
###############################################################################
for (( i=0 ; i<12; i++ )); do
    month=$(date --date="$(date) +$i month" +'%B')
    mkdir -p "$1"/"$month"
done


