#STEP 6: INDEX MARKED PCR DUPLICATES 

module load samtools

#create directory variable
INPUTDIR="/g/data/ht96/McLay_UQ/Honours/Output/WGS/mark_pcr_duplicates"

#index the .bam file
samtools index ${INPUTDIR}/${1}_PCRmrkd.clean.sorted.bam