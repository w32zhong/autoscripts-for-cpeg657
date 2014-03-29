# !/bin/bash
# $1=grp_id; $2=collection_id; $3=fun_id;
cookie=${1}_${2}_${3}.cookie
result=${1}_${2}_${3}.res

echo "cmd: $0 $@" >> $result
echo "==========" >> $result

curl --request POST "http://infolab.ece.udel.edu:8008/VIRLab_UD/login.php" --data "username=wzhong&password=g131517" -c $cookie &> /dev/null
curl --request POST "http://infolab.ece.udel.edu:8008/VIRLab_UD/evaFun.php" --data "collectionID=${2}&functionID=${3}&groupID=${1}" -i -c $cookie -b $cookie >> $result 2>&1 

status=1
cat $result | grep --max-count 1 Evaluation && status=0
if [ $status -eq 0 ] 
then
	echo "${1}_${2}_${3} done." >> result.txt
else
	echo "${1}_${2}_${3} fail." >> result.txt
fi
