#STEP 8: INDEX REALIGNED BAMS 

module load samtools

#create directory variable
INPUTDIR="/g/data/ht96/McLay_UQ/Honours/Output/WGS/realign_indels"

#index the .bam file
samtools index ${INPUTDIR}/${1}_realigned.PCRmrkd.clean.sorted.bam