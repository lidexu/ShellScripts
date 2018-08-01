#!/bin/bash
# 去除审核通过的沙子，以及没有框的结果

set -x

if [ ! -n "$1" ]
then
	echo "must input a traning path: "
else
	echo "the correct data path is: "$1
fi

trianPath=$1
scriptFile="/Users/lidexu/Documents/project/Label-x/work-toolkit/labelX-toolkit/labelX_main.py"

runcmd="python -u "$scriptFile" \
--actionFlag 8 \
--dataTypeFlag 2 \
--logJsonList ${trianPath} \
--sandJsonList /Users/lidexu/Documents/project/Label-x/eval_shazi/20180404_rfcn_shazi.json"

echo ${runcmd}
`eval ${runcmd}`
