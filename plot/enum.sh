#!/bin/bash
cnt=1
for i in `cat xy.txt | head -1`
do
	for j in `cat xy.txt | tail -1`
	do
		line=`cat input.txt|head -$cnt|tail -1`
		echo "[$i, $j]: $line"
		let "cnt+=1"
	done	
done
