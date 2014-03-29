#!/bin/bash
if [ ! $# -eq 1 ]
then
	echo "invalid arg."
	exit
fi

if [ $1 = "file" ]
then
	rm -f *.cookie *.txt flag *.res
	exit
fi

if [ $1 = "curl" ]
then
	sudo killall curl
	exit
fi

echo "invalid arg."
