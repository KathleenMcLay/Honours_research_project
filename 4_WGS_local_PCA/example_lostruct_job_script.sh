#!/bin/bash -l
#PBS -N local_PCA_H1D1
#PBS -l walltime=5:00:00
#PBS -l ncpus=24
#PBS -l mem=90GB
#PBS -l jobfs=400GB
#PBS -o job_output.out
#PBS -l storage=scratch/ht96+gdata/ht96

#activate the miniconda environment with lostruct installed
source ~/miniconda3/etc/profile.d/conda.sh
conda activate renv

module load bcftools

R CMD BATCH /home/564/km6006/Scripts/local_PCA.R
