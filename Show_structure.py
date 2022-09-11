#Script to get the structure of a selected region.
#It can be input a dot bracket notation with sequence or only the structure.

# Input the file with sequence and structure or only structure
name = input("Introduce a structure: ",) 

# Input the range of nucleotides that you want to see 
a = input("Show from nucleotide: ")
a = int(a)
b = input ("to: ")
b = int(b)

# Open the file and generate a list with a ( or . in each position
with open(name, "r") as f:
    dbn_file = f.read()
notation = dbn_file.split("\n")[-2].split(" ")[0]
notation_list = list(notation)

# Select the region
selected_region_list = list()
selected_region_list = notation_list[a-1:b]

# Convert the selected region froma list to a string and print the result
selected_region_string = ''.join(selected_region_list)
print("The selected region from", a, "to", b,"is:")
print(selected_region_string)


