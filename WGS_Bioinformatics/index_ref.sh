#STEP 2: INDEX REFERENCE GENOME - BWA
#does not need to be run in parallel

module load bwa

#set the file path  
bwa index -a is /scratch/ht96/km6006/Ref_Genome/SLv141Asm_Ch20RN.fasta