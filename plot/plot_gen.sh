#!/bin/bash
if [ ! $# -eq 3 ]
then
	echo "arg invalid."
	exit;
fi

a0=`awk "{printf(\"%s,\",\$ ${1});}" input.txt`
seq 1 1 $(wc -l input.txt | awk '{print $1}') | tr '\n' ',' | sed -e 's/,$//' > seq.txt

a1=$(cat seq.txt)
a2=`echo $a0 | sed -e "s/,$//"`

sed -e "s/AAA/$a1/" -e "s/BBB/$a2/" _plot.py > __plot.py

sed -i -e "s/TTT/$2/" __plot.py # title
sed -i -e "s/PPP/$3/" __plot.py # par name

python __plot.py
