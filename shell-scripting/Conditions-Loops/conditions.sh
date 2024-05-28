#!/bin/bash

set -e
set -o pipefail

r=45
v=18

if [ $r > $v ]
then
	echo "r is greater than v"
else
	echo "v is gretaer than r"
fi

