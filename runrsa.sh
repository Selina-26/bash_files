#!/bin/bash
#SBATCH --job-name=pydcaremap
#SBATCH --account=nn9795k
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=30GB
#SBATCH --time=05:00:00

set -o errexit
#set -o nounset

module --quiet purge 
module load Anaconda3/2019.03

export PS1=\$
source ${EBROOTANACONDA3}/etc/profile.d/conda.sh
conda activate /cluster/projects/nn9795k/conda/biopython

list=$(cat all_remapfiles.txt)


for i in $list
do
	PDBID=${i:0:4}

	python dca_and_rsa.py pdbfiles/"$PDBID".pdb remapfiles/$i
done


