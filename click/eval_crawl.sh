#!/bin/bash
if [ ! $# -eq 1 ]
then
	echo "invalid arg."
	exit
fi

if [ $1 = "clean" ]
then
	rm *.cookie
	rm *.txt
	exit
fi

grp=$1
echo "group number=$grp"
echo $grp > grp_id_is

curl --request POST "http://infolab.ece.udel.edu:8008/VIRLab_UD/login.php" --data "username=wzhong&password=g131517" -c a.cookie

curl --request POST "http://infolab.ece.udel.edu:8008/VIRLab_UD/evaFun.php" --data "groupID=${grp}" -b a.cookie | grep "Evaluation</button>" | grep -P "'[0-9]+,[0-9]+'" -o | tee eval_crawl.txt

sed -i -e "s/'//g" -e "s/,/ /" eval_crawl.txt

cat eval_crawl.txt | sort -R > tmp
mv tmp eval_crawl.txt

>result.txt

cat eval_crawl.txt | while read -d $'\n' line
do
	{
	col_id=`echo $line | awk '{print $1}'`;
	fun_id=`echo $line | awk '{print $2}'`;
	./click.sh ${grp} ${col_id} ${fun_id} && echo "${col_id}_${fun_id} finished" >> result.txt;
	} &
	echo "next click..."
	sleep 19
done

wait
echo "please have a cup of tee..." | tee -a result.txt
