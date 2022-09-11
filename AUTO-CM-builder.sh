#!/usr/bin/env bash

n=0
for f in *.db;
	do 
		echo "                                                                         "
		echo "============================ ""$f"" CM BUILDING BEGIN ""============================"
		echo "                                                                         "
		mkdir "$f""_CM"
		perl /media/atabaz/DISCO_DURO_ART/IIMCB_internship/PROJECTS/SARS_GENOME_PROJECT/INFERNAL/labtools/cm-builder -m "$f" -d /media/atabaz/DISCO_DURO_ART/IIMCB_internship/PROJECTS/SARS_GENOME_PROJECT/GENOMES/CoV_DataBase/BIG_CoV_DATABASE.fasta -s /media/atabaz/DISCO_DURO_ART/IIMCB_internship/PROJECTS/SARS_GENOME_PROJECT/GENOMES/NC_045512.2-SARS_CoV.fasta -k -c 4 -r -o "$f""_CM"
		n=$n+1
	done

echo "                                                                         "
echo "============================"" ALL DONE ""============================"
echo "Number of files analyzed: ""$n"
echo "                                                                         "
