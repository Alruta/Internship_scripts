#!/usr/bin/env bash
echo "Remember to change to what directory will the script go to look for the files and where is he going to move it!!!"
read -p "Introduce el archivo a leer: " archivo
read -p "Nombre de la carpeta a crear: " folder 
lines=$(cat $archivo)

# Here is where the script go to look for
cd /media/atabaz/DISCO_DURO_ART/IIMCB_internship/PROJECTS/SARS_GENOME_PROJECT/NEW_PROJECT/SELECTING_REGIONS/ALL_SAMPLES_COMMON_REGIONS/SAME_REGIONS/IN_VIVO

mkdir "$folder"

for line in $lines
do 	
	echo "$line"
	cp "$line" "$folder"
done

# Here the script move the files
mv "$folder" /media/atabaz/DISCO_DURO_ART/IIMCB_internship/PROJECTS/SARS_GENOME_PROJECT/NEW_PROJECT/SELECTING_REGIONS/ALL_SAMPLES_COMMON_REGIONS
