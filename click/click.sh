#!/bin/bash
# $1=grp_id; $2=collection_id; $3=fun_id;
cookie=${1}_${2}_${3}.cookie

curl --request POST "http://infolab.ece.udel.edu:8008/VIRLab_UD/login.php" --data "username=wzhong&password=g131517" -c $cookie &> /dev/null
curl --request POST "http://infolab.ece.udel.edu:8008/VIRLab_UD/evaFun.php" --data "collectionID=${2}&functionID=${3}&groupID=${1}" -b $cookie &> /dev/null
