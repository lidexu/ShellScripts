#!/bin/bash
# 将RFCN结果合成到一个文件
set -x
if [ ! -n "$1" ]
then
	echo "must input a file path : "
	exit
else
	echo "the file path is : "{$1}
fi
filePath=$1

save_file="`basename $filePath`.json"

cd ${filePath}

file_length=`find "split_file-**-result*" | wc -l`

echo "there are ${file_length} split files to be merged"

cat split_file-**-result* > ${save_file}


