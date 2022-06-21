#creating a dictionary file of the reference genome for use with GATK HaplotypeCaller
java -jar /home/564/km6006/picard.jar CreateSequenceDictionary R=/scratch/ht96/km6006/Ref_Genome/SLv141Asm_Ch20RN.fasta O=/scratch/ht96/km6006/Ref_Genome/SLv141Asm_Ch20RN.dict
