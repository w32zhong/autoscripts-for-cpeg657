#!/bin/bash
curl --request POST "http://infolab.ece.udel.edu:8008/VIRLab_UD/login.php" --data "username=wzhong&password=g131517" &>/dev/null -c b.cookie

curl http://infolab.ece.udel.edu:8008/VIRLab_UD/manageFun.php -b b.cookie 2>/dev/null | grep -P 'evalTab.+=' | tee list_tmp.txt | sed -e 's/evalTab//g' > /dev/null

cat list_tmp.txt | sed -e "s/evalTab\['//g" -e "s/'\]=/  /g" | tee list.txt

echo "======================"
echo "# of doe, robust04, wt2g, ap8889 are: 1, 4, 5, 6."
