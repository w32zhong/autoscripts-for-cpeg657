#!/bin/bash
if [ ! $# -eq 1 ]
then
	echo "invalid arg."
	exit
fi

if [ $1 = "clean" ]
then
	rm -f *.cookie *.txt flag
	sudo killall curl
	exit
fi

>result.txt

num=2
./many_clicks.sh $1 $num && exit
./watch.sh $1 $num
