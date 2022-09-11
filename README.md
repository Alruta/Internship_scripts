# Internship_scripts
In this Readme.md you will find information about the diferent scripts here loaded.
This bunch of script where written during my internship in yhe International Institute of molecular and Cell Biology. In the Janusz Bujnicki's bioinformaticslaboratory.

**ALL THE SCRIPT (except Show_structure.py maybe) ARE WRITTEN IN A GENERAL WAY, SO THEY HAVE TO BE MODIFY ACCORDING WITH YOUR CONTEXT.**

# AUTO-CM-builder.sh

This bash script was written to automatize and run the perl script cm-builder on a bunch of dot-bracket RNA strucutres. To use it, just write the parames indicates ant run it on a folder where strucutres that are going to be analyzed are in dot bracket notation. The script will create a folder with the same name (finish wed with _CM) where the covariance model and a stockholm file will be put. The options here used skip R-scape step and save the last stockholm file, but many other options can be found runnig perl cm-builder -h.

This script requieres RNA-Framework and INFERNAL installed (maybe other if you add more options). In addition, cm-builder must be connected with RNA Framework libreries by adding 'use lib path/to/RNA-Framework/lib'; to cm-builder script.

The cm-builder script comes from Genome-wide mapping of SARS-CoV-2 RNA structures identifies therapeutically-relevant elements (https://github.com/dincarnato/labtools) and it use INFERNAL to generates Covariance models and look for conserved strucutres in the database that you input. It has some additional criteria that are described in the paper, and are useful for analysis of viruses genomes. 

# Auto-INFERNAL.sh

This bash script will ask you for a stockholm file. This must be in the same shell, and it will be analyzed with INFERNAL. It will build a covariance model, search in a database and build a new stockholm file with the aligments. The script itinerate it 3 times to refine the result. It will output 3 covariance models, 3 search reports, 3 alignment reports and 3 stockholm files. The _3 are the final ones.

This script requieres INFERNAL installed.

It is very similar to what cm-builder do, but without the additional criteria descibe in the paper where it was created (Genome-wide mapping of SARS-CoV-2 RNA structures identifies therapeutically-relevant elements).I reccomned to check INFERNAL documentation (http://eddylab.org/infernal/)

# Bash_automatize_examples

This is only a few examples about how to automatize programs in command line to run them over more than one files. The programs of the examples are DRACO and RNA Framework modules.

# DiffScan_general_script.R

This is a R script that can be modify to run DiffScan. The data can be input in console (the lines 17 and 18 as comments) or by creating a previus file with it. The imput data is reactivities from chemical probing experiments.

Here (https://github.com/yub18/DiffScan) you will find more information about how to use the program, but what is written in DiffScan_general_script.R is a backbone of it. 

# INFERNAL_FOR_ALL.sh

This script allow to run the previous script Auto-INFERNAL.sh on a pool of structures in stockholm file. To use it, run the script in a shell where there are folders call Region_anything. This folders must contain a stockholm file for that regions. The script goes into the folder, run Auto-INFERNAL.sh on the stockholm files and foes to the next. The name of the folder can be chnaged in the for loop to use with folder with different names. 

# Moving_files.sh

This script ask for a file in which there is written one column of other files names. It will also ask for the name of the folder to be create. Once it has a file with the names of the other files, it will goes to the ubication indicated in the first "cd" (also indicated with a comment), it will create a folder with the name indicated in that ubication and it will copy the files indicated in the input file into the new created folder.

Once it has been done, the folder is moved to the ubication indicated in the line 19 (also indicated as a comment). 

# Reactivities_Analysis.R

This R script allow us to generates a scatter plot and a distribution plot. The imput can be any type of data, but it was used to represent reactivity data from chemical probing experiments. 

Data is introduce for console as a vector, then it moves to logaritmic scale, creates a dataframe, removes NAs and create the plot with the R2. 

It also can represent a distribution plot and calculate a wilcox test. 

# Show_structure.py

This script allow us to see the structure in a specific window from a dot bracket notation file. 

