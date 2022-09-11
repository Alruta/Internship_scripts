#!/usr/bin/env bash
set -e
set -u
set -o pipefail
# Check this header

read -p "Introduce el archivo .stockholm: "  stockholm

round=1

echo " ####################### THIS IS THE INPUT FILE ##############################"

cat "${stockholm}"

while [[ round -le 3 ]]
	do
		echo ".............................ROUND ""${round}"" HAS BEGAN...................................."
		# Build and calibrate CM
		CM="CM_""${round}"".cm"

		echo " ####################### BUILDING A COVARIANCE MODEL ""${round}""##############################"
		/path/to/cmbuild "${CM}" "${stockholm}"

		echo " ####################### CALIBRATING COVARIANCE MODEL ""${round}""##############################"
		/path/to/cmcalibrate "${CM}"

		# CMSEARCH
		cmsearch="cmsearch_""${round}"".fasta"
		cm_search_report="cmsearch_report_""${round}"".txt"
		DataBase=/path/to/Database.fasta

		echo " ####################### SEARCHING ON THE DATABASE ""${round}""##############################"
		/path/to/cmsearch --incE 10 -A "${cmsearch}" -o "${cm_search_report}" "${CM}" "${DataBase}"
		cat "${cm_search_report}"

		# CMALIGN
		cmalign="cmalign_""${round}"".stockholm"

		echo " ####################### DOING THE ALIGMENT ""${round}""##############################"
		/path/to/cmalign -o "${cmalign}" "${CM}" "${cmsearch}"
                
                stockholm="${cmalign}"
		# cat "${cmalign_1}"
		round=$(($round + 1))
		echo "............................ROUND ""${round}"" DONE........................................"
	done

echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ALL DONE :) >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
