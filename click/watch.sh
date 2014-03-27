#!/bin/bash
touch result.txt
s=0
while true; do
	echo "watch $s..."
	let "s+=1"
	wc -l result.txt | awk "{ exit (\$1 < ${2}) }" && s=0 && ./many_clicks.sh ${1} ${2} ${3} && exit
	touch result.txt
	sleep 3
done
