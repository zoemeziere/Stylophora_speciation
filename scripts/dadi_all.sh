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

# to activate conda
source /QRISdata/Q5253/miniconda3/etc/profile.d/conda.sh

# to activate an environment 
conda activate dadi

# to access the directory contains the scripts
cd /scratch/project/phd_coral_genomics/Stylophora/RAD_gbr_genome/dadi/C1CBHE-C5CBHE/scripts/

# Step 1 - make SFS

python make_fs.py C1CBHE-C5CBHE yes projection 7 8

# Step 2 - optimise models (here sym_migration as example)

params=`cat /scratch/project/phd_coral_genomics/Stylophora/RAD_gbr_genome/dadi/C1CBHE-C5CBHE/scripts/im2m_params_1f.txt | tail -n +$SLURM_ARRAY_TASK_ID | head -1`
paramArray=($params) 

a=${paramArray[0]}
b=${paramArray[1]}
c=${paramArray[2]}
d=${paramArray[3]}
e=${paramArray[4]}
f=${paramArray[5]}

python optimise_manual.py C1CBHE-C5CBHE sym_migration yes projection 3 -p $a $b $c $d $e $f

# Step 2 - Assess best model fit

python compare_model.py C1CBHE-C5CBHE sym_migration 0.05 -o 10.8094 10.0667 0.0034 16.631

# Step 3 - Bootstrap with optimised parameters

python nonparametric_bootstrap_subsample.py C1CBHE-C5CBHE sym_migration 100 -g 7 8 -o 10.8094 10.0667 0.0034 16.631

# Step 3 - calculate confidence intervals

python FIM_confindence_intervals.py C1CBHE-C5CBHE sym_migration 100 0.01 -o 10.8094 10.0667 0.0034 16.631

# Step 3 - likelihood ratio test to compare models

python LRT_sec_contact.py



