#!/bin/bash
if [ ! $# -eq 3 ]
then
	echo "arg invalid."
	exit;
fi

a0=`awk "{printf(\"%s,\",\$ ${1});}" input.txt`
a1=`echo $a0 | sed -e "s/,$//"`
sed -e "s/BBB/$a1/" _plot.py > __plot.py

sed -i -e "s/TTT/$2/" __plot.py # title
sed -i -e "s/PPP/$3/" __plot.py # par name
python __plot.py
