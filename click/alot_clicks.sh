#!/bin/bash
if [ $# -eq 0 ]
then
	echo "invalid arg."
	exit
fi

>result_save.txt
>result.txt

num=8
./many_clicks.sh $1 $num $2 && exit
./watch.sh $1 $num $2
