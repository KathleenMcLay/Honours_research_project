#!/bin/bash -l
#PBS -N WGS_ALIGN 
#PBS -l walltime=06:00:00
#PBS -l ncpus=8 
#PBS -l jobsf=400GB
#PBS -l mem=100GB 
#PBS -o job_output.out 
#PBS -l storage=scratch/ht96+gdata/ht96 

#load gnu parallel 
module load parallel 

#run eight jobs in parallel using an input text file containing the file path to the bioinformatics command script at index zero (0) and the identifier for each individual at index one (1)
parallel --jobs 8 < /home/564/km6006/Scripts/align.txt 
