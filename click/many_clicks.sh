#!/bin/bash
grp=$1
echo "group number=$grp"

curl --request POST "http://infolab.ece.udel.edu:8008/VIRLab_UD/login.php" --data "username=wzhong&password=g131517" -c a.cookie

curl --request POST "http://infolab.ece.udel.edu:8008/VIRLab_UD/evaFun.php" --data "groupID=${grp}" -b a.cookie | grep "Evaluation</button>" | grep -P "'[0-9]+,[0-9]+'" -o > eval_crawl.txt

sed -i -e "s/'//g" -e "s/,/ /" eval_crawl.txt

################################################
if [ -n "$3" ]
then
	echo "# of doe, robust04, wt2g, ap8889 are:"
	cat eval_crawl.txt | awk '{print $1}' | uniq

	cat eval_crawl.txt | grep "^${3}" > tmp
	mv tmp eval_crawl.txt

	echo "collection selected: ${3}"
	sleep 3
fi
################################################

cat eval_crawl.txt | sort -R > tmp
mv tmp eval_crawl.txt

>result.txt

max_click=$2
cnt=0
rm -f flag

cat eval_crawl.txt | while read -d $'\n' line
do
	if [ $cnt -eq $max_click ] 
	then
		touch flag
		exit	
	fi

	{
	col_id=`echo $line | awk '{print $1}'`;
	fun_id=`echo $line | awk '{print $2}'`;
	echo ./click.sh ${grp} ${col_id} ${fun_id}
	./click.sh ${grp} ${col_id} ${fun_id}
	} &

	let 'cnt+=1'
	echo "${cnt} clicked..."
	sleep 4
done

if [ -e flag ] 
then
	echo "max cnt done."
	exit 1;
fi

echo "all done."
exit 0;
