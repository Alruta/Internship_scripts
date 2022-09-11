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
		/home/atabaz/anaconda3/pkgs/infernal-1.1.4-pl5321hec16e2b_1/bin/cmbuild "${CM}" "${stockholm}"

		echo " ####################### CALIBRATING COVARIANCE MODEL ""${round}""##############################"
		/home/atabaz/anaconda3/pkgs/infernal-1.1.4-pl5321hec16e2b_1/bin/cmcalibrate "${CM}"

		# CMSEARCH
		cmsearch="cmsearch_""${round}"".fasta"
		cm_search_report="cmsearch_report_""${round}"".txt"
		DataBase=/media/atabaz/DISCO_DURO_ART/IIMCB_internship/PROJECTS/SARS_GENOME_PROJECT/GENOMES/CoV_DataBase/CoV_Database.fasta

		echo " ####################### SEARCHING ON THE DATABASE ""${round}""##############################"
		/home/atabaz/anaconda3/pkgs/infernal-1.1.4-pl5321hec16e2b_1/bin/cmsearch --incE 10 -A "${cmsearch}" -o "${cm_search_report}" "${CM}" "${DataBase}"
		cat "${cm_search_report}"

		# CMALIGN
		cmalign="cmalign_""${round}"".stockholm"

		echo " ####################### DOING THE ALIGMENT ""${round}""##############################"
		/home/atabaz/anaconda3/pkgs/infernal-1.1.4-pl5321hec16e2b_1/bin/cmalign -o "${cmalign}" "${CM}" "${cmsearch}"
                
                stockholm="${cmalign}"
		# cat "${cmalign_1}"
		round=$(($round + 1))
		echo "............................ROUND ""${round}"" DONE........................................"
	done

echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ALL DONE :) >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
