#!/bin/bash
# get Today data from my bucket
# qrsctl loginLdx

set -x
if [ ! -n "$1" ]
then
	echo "must input the password!"
	exit
else
	echo "Login..."
fi

if [ ! -n "$2" ]
then
	echo "must input a save path!"
else
	echo "the save path is :"$2


password=$1
savePath=$2

/Users/lidexu/Documents/tools/qrsctl login lidexu@qiniu.com password

/Users/lidexu/Documents/tools/qrsctl get 
