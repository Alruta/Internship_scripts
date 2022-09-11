#!/usr/bin/env bash
echo "Remember to change to what directory will the script go to look for the files and where is he going to move it!!!"
read -p "File with the list of files to search: " archivo
read -p "Folder that will contein the new files: " folder 
lines=$(cat $archivo)

# Here is where the script go to look for
cd ubication/where/the/script/look/for/the/indicated/files

mkdir "$folder"

for line in $lines
do 	
	echo "$line"
	cp "$line" "$folder"
done

# Here the script move the files
mv "$folder" /ubication/where/move/the/folder/with/data
