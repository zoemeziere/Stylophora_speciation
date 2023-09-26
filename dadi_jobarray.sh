#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=30
#SBATCH --cpus-per-task=2
#SBATCH --mem=40G
#SBATCH --job-name=nommig_3f
#SBATCH --time=3:00:00
#SBATCH --partition=general
#SBATCH --account=a_riginos
#SBATCH --array=1-30
#SBATCH --output=im2m_C1CBHE-C5CBHE_%A_%a.out

#cd ${PBS_O_WORKDIR}

params=`cat /scratch/project/phd_coral_genomics/Stylophora/RAD_gbr_genome/dadi/C1CBHE-C5CBHE/scripts/im2m_params_1f.txt | tail -n +$SLURM_ARRAY_TASK_ID | head -1`
paramArray=($params) 

# to activate conda
source /QRISdata/Q5253/miniconda3/etc/profile.d/conda.sh

# to activate an environment 
conda activate dadi

# to access the directory contains the scripts
cd /scratch/project/phd_coral_genomics/Stylophora/RAD_gbr_genome/dadi/C1CBHE-C5CBHE/scripts/


#Parameters
a=${paramArray[0]}
b=${paramArray[1]}
c=${paramArray[2]}
d=${paramArray[3]}
e=${paramArray[4]}
f=${paramArray[5]}

python optimise_manual.py C1CBHE-C5CBHE IM2M yes projection 3 -p $a $b $c $d $e $f
