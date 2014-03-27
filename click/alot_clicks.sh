#!/bin/bash
if [ $# -eq 0 ]
then
	echo "invalid arg."
	exit
fi

>result.txt

num=40
./many_clicks.sh $1 $num $2 && exit
./watch.sh $1 $num $2
