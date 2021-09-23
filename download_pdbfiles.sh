# script that downloads PDB files from a list and moves them in a folder called pdbfiles
# make sure to have an empty directory called 'pdbfiles'
# list has to be a file with four digit PDB IDs in every new line
# replace commas with new lines in a list with
# cat list.txt | sed 's/,/\n/g' > list_mod.txt

list=$(cat rcsb_pdb_ids_20210714060822_mod.txt)

for i in $list
do
	id="$(echo $i | tr '[A-Z]' '[a-z]')"  # PDB ID to lowercase
	echo "Downloading " $id "..."
	wget --quiet http://www.rcsb.org/pdb/files/$id.pdb
	mv $id.pdb pdbfiles
	echo "Done"
done
