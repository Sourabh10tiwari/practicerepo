#!/bin/bash
#
#Print number divisible by 3 & 5 but not by 15
#

set -e
set -o pipefail


for((i=1; i<=30; i++))
do
	if ([ `expr $i % 3` == 0 ] || [ `expr $i % 5` == 0 ]) && [ `expr $i % 15` != 0 ]
	then
		echo $i
	fi
done
