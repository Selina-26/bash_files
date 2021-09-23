#!/bin/bash
#SBATCH --job-name=SequenceCheck
#SBATCH --account=nn9795k
#SBATCH --time=06:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem-per-cpu=10GB

## Set up job environment:
set -o errexit  # Exit the script on any error
# set -o nounset  # Treat any unset variables as an error

module --quiet purge  # Reset the modules to the system default
module load Anaconda3/2019.03
module load BLAST+/2.10.1-gompi-2020a

export PS1=\$
source ${EBROOTANACONDA3}/etc/profile.d/conda.sh
conda activate /cluster/projects/nn9795k/conda/biopython 

python run_seq_check.py rcsb_pdb_ids_20210714060822.txt -p /cluster/projects/nn9795k/selina/pdbfiles
# python sequence_checker.py pdbfiles/3ep9.pdb -l
