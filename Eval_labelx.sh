set -x

if [ ! -n "$1" ]
then
    echo "must input a eval path: "
else
    echo "the eval path is: "$1
fi

evalPath=$1
scriptFile="/Users/lidexu/Documents/project/Label-x/work-toolkit/labelX-toolkit/labelX_main.py"

runcmd="python -u "$scriptFile" \
--actionFlag 7 \
--dataTypeFlag 2 \
--logJsonList ${evalPath} \
--sandJsonList /Users/lidexu/Documents/project/Label-x/Sand/labelSand/terror-label.json \
--iou 0.63 \
--outputErrorFlag True"

echo ${runcmd}
`eval ${runcmd}`