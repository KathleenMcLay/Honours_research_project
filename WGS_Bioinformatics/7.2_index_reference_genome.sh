#STEP 7: REALIGNING AROUND INDELS

#7.2: INDEX THE REFERENCE GENOME
#does not need to be run in parallel 

module load samtools

#indexing the reference genome with samtools for use with GATK
samtools faidx /scratch/ht96/km6006/Ref_Genome/SLv141Asm_Ch20RN.fasta