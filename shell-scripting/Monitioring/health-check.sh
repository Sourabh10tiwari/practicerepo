#!/bin/bash


####################################
# Anuthor: Sourabh
# Date: 22/05/2024
#
# This script is used to fetch the output for server health
#
# Version: 1.0
####################################

#set -x  #This is for debug mode.
set -e  #This will exit the script when any error occurs.
set -o pipefail #The -e only checks the last command of pipe, to check the whole pipe command we have to use this.

echo "Disk space used:"
df -Th

echo "Memory used:"
free -gh

echo "Number of CPU:"
nproc

echo "Process running for amazon:"
ps -ef | grep amazon

echo "Process ID of the running for amazon:"
ps -ef | grep amazon | awk -F" " '{print $2}' #awk is used to print required output



