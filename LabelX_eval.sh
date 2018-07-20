#!/bin/bash
# 评估任务包的准确率
# 输入参数评估目录，输入抽取的沙子目录

set -x

if [ ! -n "$1" ]
then
	echo "must input a eval path: "
else
	echo "the eval path is: "$1
fi

if [ ! -n "$2" ]
then
    echo "must input the eval sands: "
else
    echo "the eval sands is: "$2




evalPath=$1
sands=$2
evalsandsPath="/Users/lidexu/Documents/project/Label-x/Sand/"${sands}
savePath="/Users/lidexu/Documents/project/Label-x/Sand/labelSand/"${sands}
labelSands="/Users/lidexu/Documents/project/Label-x/Sand/labelSand/terror-label.json"
Newsands=${savePath}"-lablex"

cat ${evalsandsPath} | jq -r '.url' >${savePath}

grep -F -f ${savePath} $labelSands >${Newsands}

scriptFile="/Users/lidexu/Documents/project/Label-x/work-toolkit/labelX-toolkit/labelX_main.py"

runcmd="python -u "$scriptFile" \
--actionFlag 7 \
--dataTypeFlag 2 \
--logJsonList ${evalPath} \
--sandJsonList ${Newsands} \
--iou 0.63 \
--outputErrorFlag True"

echo ${runcmd}
`eval ${runcmd}`
