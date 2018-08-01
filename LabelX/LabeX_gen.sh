#!/bin/bash
# 将RFCN数据集进行处理，按要求生成结果任务包文件, 不足数文件保存在 /Users/lidexu/Documents/project/Label-x/resData
# 从沙子文件中随机抽取200张作为沙子，并将沙子文件以任务名命名。


set -x

if [ ! -n "$1" ]
then
	echo "must input a file Path: eg(/Users/lidexu/Documents/project/20180531)"
	exit
else
	echo "the file path is : "$1
fi

if [ ! -n "$2" ]
then
	echo "must input a length : eg(3800)"
	exit
else
	echo "the length of each task file is : "$2
fi

filePath=$1
taskLen=$2

sand_file="/Users/lidexu/Documents/project/Label-x/Sand/terror-det-sands.json"
task_name=`basename ${filePath}`
echo "task_name is: "${task_name}
# extract 200 lines from sanfile as sands
sands="/Users/lidexu/Documents/project/Label-x/Sand/"${task_name}"-sand.json"
gshuf -n 200 ${sand_file} > ${sands}
# sand_result=${results}
# echo "${sand_result}" >> ${sands}
# echo "sands was saved in: "${sands}

scriptFile="/Users/lidexu/Documents/project/Label-x/work-toolkit/labelX-toolkit/labelX_main.py"
resPath="/Users/lidexu/Documents/project/Label-x/resData/"
# Merge
Save_file="`date +"%Y%m%d"`_rfcn.json"
echo "The file will be saved in : "${Save_file}

# cat *.json > ${Save_file}
# find *.json | cat  >> ${Save_file}
file_list=`ls $filePath`
cd $filePath
for file in $file_list
do
	echo "Merge file :"${file}
    cat $file >> ${Save_file}
done


# Split
split -a 2 -l ${taskLen} ${Save_file} "terror-det-`date +"%Y%m%d"`" 

# Make a dir to add sand
sandDir="addsand-`date +"%Y%m%d"`"
echo "the dir wait to addsand is: "${sandDir}

mkdir ${sandDir}

sandPath=${filePath}"/"${sandDir}
echo "the sandPath is"${sandPath}

mv terror-det* $sandPath

cd $sandPath

# add .json to the taskfile
for i in $(ls)
do 
	mv $i $i".json"
	file_len=`wc -l $i".json" | awk '{print $1}'`

	if [[ ${file_len} -lt ${taskLen} ]]
	then
		mv $i".json" $resPath
	else
		echo "Continue:"
	fi

done


runcmd="python -u "$scriptFile" \
--actionFlag 6 \
--dataTypeFlag 2 \
--logJsonList ${sandPath} \
--sandJsonList ${sands}"


echo ${runcmd}
`eval ${runcmd}`


