#!/bin/bash
touch result.txt
s=0
while true; do
	echo "watch $s..."
	let "s+=1"
	wc -l result.txt | awk "{ exit (\$1 < ${2}) }" && s=0

	if [ $s -eq 0 ]
	then
		cat result.txt >> result_save.txt
		./many_clicks.sh ${1} ${2} ${3} && break
	fi

	sleep 3
done

cat result.txt >> result_save.txt
rm result.txt
