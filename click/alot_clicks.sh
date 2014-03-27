#!/bin/bash
if [ ! $# -eq 1 ]
then
	echo "invalid arg."
	exit
fi

>result.txt

num=40
./many_clicks.sh $1 $num && exit
./watch.sh $1 $num
