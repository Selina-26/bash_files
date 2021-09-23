#!/bin/bash
#SBATCH --job-name=distmtx
#SBATCH --account=nn9795k
#SBATCH --time=02:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=30GB

set -o errexit
#set -o nounset

module --quiet purge 
module load Anaconda3/2019.03

export PS1=\$
source ${EBROOTANACONDA3}/etc/profile.d/conda.sh
conda activate /cluster/projects/nn9795k/conda/biopython

# directory where PDB files are stored
pdbfiledir="/cluster/work/users/selina/euk_struct_data/scripts/pdbfiles/"
list=$(ls ${pdbfiledir})
# number of PDB files
lines=$(ls ${pdbfiledir} | wc -l)
lines=$((lines-1))  # because ls always counts +1

# counter to count which PDB file is handled right now
count=1

for file in $list
do
        echo "Handling PDB file ${i} of  ${lines}"
        i=$((i+1))
        python get_resi_distmatrix.py /cluster/work/users/selina/euk_struct_data/scripts/pdbfiles/$file -o /cluster/work/users/selina/distance_matrices/matrices
done


