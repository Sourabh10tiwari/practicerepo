#!/bin/bash
#
############
#For Loop
############

set -e
set -o pipefail

echo "Print 1 to 5"
for i in {1..5}
do 
	echo $i 
done


echo "Print 5 to 1"
for ((i = 5; i>=1; i--))
do
	echo $i
done

