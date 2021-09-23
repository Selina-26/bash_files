#!/bin/bash

FILENAME=$1
PDBPATH=$2
FASTAPATH=$3
COUNT=0

while read line
do
	COUNT=`expr $COUNT + 1`
	echo "Running Sequence Check on Prot #: "$COUNT
	read -ra ADDR <<< $line
	echo "${ADDR[0]}"
	python3 -u sequence_checker.py ${ADDR[0]} $PDBPATH $FASTAPATH

done < $FILENAME
