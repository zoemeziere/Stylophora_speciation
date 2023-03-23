#!/bin/bash

#PBS -A UQ-SCI-BiolSci

#PBS -l select=1:ncpus=2:mem=50GB
#PBS -l walltime=1:00:00
#PBS -N nomig_1f
#PBS -J 1-30:1

#cd ${PBS_O_WORKDIR}


params=`cat /scratch/project/phd_coral_genomics/Stylophora/RAD_gbr_genome/dadi/sympatry_allopatry_pairs/C1_allopatry/scripts/nomig_1f_initial_params.txt | tail -n +${PBS_ARRAY_INDEX} | head -1`
paramArray=($params) 

# to activate conda
source /QRISdata/Q5253/miniconda3/etc/profile.d/conda.sh

# to activate an environment 
conda activate dadi

# to access the directory contains the scripts
cd /scratch/project/phd_coral_genomics/Stylophora/RAD_gbr_genome/dadi/sympatry_allopatry_pairs/C1_allopatry/scripts/

# run optimisations
# sanity check of variables
echo $PBS_ARRAY_INDEX
echo ${paramArray}

#Parameters
a=${paramArray[0]}
b=${paramArray[1]}
c=${paramArray[2]}

python optimise_manual.py C1CBHE-C1ONLI no_mig yes projection 1 -p $a $b $c
