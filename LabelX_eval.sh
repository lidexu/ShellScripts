#!/bin/bash
# 评估任务包的准确率

set -x

if [ ! -n "$1" ]
then
	echo "must input a eval path: "
else
	echo "the eval path is: "$1
fi

evalPath=$1
scriptFile="/Users/lidexu/Documents/project/Label-x/work-toolkit/labelX-toolkit/labelX_main.py"

runcmd="pyhon -u "$scriptFile" \
--actionFlag 7 \
--dataTypeFlag 2 \
--logJsonList ${evalPath} \
--sandJsonList /Users/lidexu/Documents/project/Label-x/20180404_rfcn_shazi.json"

echo ${runcmd}
`eval ${runcmd}`
