#STEP 7: REALIGNING AROUND INDELS

#7.1: MAKE A DICTIONARY FILE OF THE REFERENCE GENOME
#does not need to be run in parallel 

#creating a dictionary file of the reference genome for GATK to use in indel realignment steps
java -jar /home/564/km6006/picard.jar CreateSequenceDictionary R=/scratch/ht96/km6006/Ref_Genome/SLv141Asm_Ch20RN.fasta O=/scratch/ht96/km6006/Ref_Genome/SLv141Asm_Ch20RN.dict
