#!/usr/bin/env bash

COUNTER=0
for f in *.db;
	do 
		echo "                                                                         "
		echo "============================ ""$f"" CM BUILDING BEGIN ""============================"
		echo "                                                                         "
		mkdir "$f""_CM"
		perl path/to/cm-builder -m "$f" -d path/to/database.fasta -s path/to/reference.fasta -k -c core_number -r -o "$f""_CM"
		let COUNTER++
	done

echo "                                                                         "
echo "============================"" ALL DONE ""============================"
echo "Number of files analyzed: ""$COUNTER"
echo "                                                                         "
