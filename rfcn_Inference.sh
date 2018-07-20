# !/bin/bash
# 该脚本通过查看进程控制 processInferenceRfcn-dcn.sh 挂起跳出

set -x

if [ ! -n "$1" ]
then
    echo "must input the refindet results!"
    exit
else
    echo "the refindet results file is:"$1

./processInferenceRfcn-dcn.sh $1

count=1

while[ ${count} -gt 0 ]; do
    count=`ps auxww | grep rfcn_dcn_inference_JH_logProcess.py | grep -v defunct | wc -l`
done
