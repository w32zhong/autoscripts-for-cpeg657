#!/bin/bash
touch result.txt
s=0
while true; do
	echo "watch $s..."
	let "s+=1"

	wc -l result.txt | awk "{ exit (\$1 < ${2}) }" && ./many_clicks.sh ${1} ${2} && exit
	touch result.txt
	sleep 3
done
