#!/usr/bin/env bash

for f in Region_*;
	do
		cd $f
		echo "                                                                         "
		echo "============================ ENTRO EN ""$f""============================"
		echo "                                                                         "
		stockholm="${f}.stockholm"
		cat "${stockholm}"
		#/media/atabaz/DISCO_DURO_ART/IIMCB_internship/PROJECTS/scripts/Auto-INFERNAL.sh
		round=1
		while [[ round -le 3 ]]
			do
				echo ".............................ROUND ""${round}"" HAS BEGAN...................................."
				# Build and calibrate CM
				CM="CM_""${round}"".cm"
				echo "                                                                         "
				echo " ####################### BUILDING A COVARIANCE MODEL ""${round}""##############################"
				/path/to/cmbuild "${CM}" "${stockholm}"
				echo "                                                                         "
				echo " ####################### CALIBRATING COVARIANCE MODEL ""${round}""##############################"
				/path/to/cmcalibrate "${CM}"

				# CMSEARCH
				cmsearch="cmsearch_""${round}"".fasta"
				cm_search_report="cmsearch_report_""${round}"".txt"
				DataBase=/path/to/DataBase.fasta

				echo " ####################### SEARCHING ON THE DATABASE ""${round}""##############################"
				/path/to//cmsearch --incE 10 -A "${cmsearch}" -o "${cm_search_report}" "${CM}" "${DataBase}"
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
		echo "                                                                         "
		echo "============================= SALGO DE ""$f""============================"
		cd ..
	done

