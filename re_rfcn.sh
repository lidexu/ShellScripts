#!/bin/bash
#和已有结果取差集，然后重新以 0.1为阈值的rfcn跑一次

set -x

if [ ! -n "$1" ]
then
    echo "must input a date:"
    exit
else
    echo "the date file is: "$1
fi

filename=$1

rfcn_file="/workspace/data/BK/processJH_Log_Dir/logFiles/"${filename}"_rfcn.json"

rfcn_url=${rfcn_file}"-url"

refineDet_file="/workspace/data/BK/processJH_Log_Dir/logFiles/"$1"-labelxFormat-result.json-url"

re_rfcn_file="/workspace/data/BK/processJH_Log_Dir/logFiles/"${filename}"re_rfcn.json-url"


cat ${rfcn_file} | jq -r '.url' >$"rfcn_url"

grep -F -v -f ${rfcn_url} ${refineDet_file} | sort | uniq > ${re_rfcn_file}

./processInferenceRfcn-dcn.sh ${re_rfcn_file}




