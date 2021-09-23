#!/bin/bash
#SBATCH --job-name=structAgreementAnalysis
#SBATCH --account=nn9795k
#SBATCH --time=1:00:00
#SBATCH --mem-per-cpu=30GB
#SBATCH --qos=devel
#SBATCH --partition=accel
#SBATCH --gpus=4

set -o errexit
#set -o nounset

module --quiet purge 
module load Anaconda3/2019.03

export PS1=\$
source ${EBROOTANACONDA3}/etc/profile.d/conda.sh
conda activate /cluster/projects/nn9795k/conda/biopython

python structural_agreement_analysis.py