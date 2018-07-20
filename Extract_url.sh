#!/bin/bash
# set -x

if[ ! -n "$1" ]
then
	echo "must input file path"
	exit
else
	echo "the input file is:" {$1}
fi

