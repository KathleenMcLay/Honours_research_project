#STEP 7: REALIGNING AROUND INDELS

#7.3: IDENTIFICATION OF INDELS - GATK

#create directory variables 
INPUTDIR="/g/data/ht96/McLay_UQ/Honours/Output/WGS/mark_pcr_duplicates"
OUTPUTDIR="/g/data/ht96/McLay_UQ/Honours/Output/WGS/id_indels"

#running GATK for each sample to identify indel targets
java -jar /home/564/km6006/GenomeAnalysisTK.jar -T RealignerTargetCreator -R /scratch/ht96/km6006/Ref_Genome/SLv141Asm_Ch20RN.fasta -I ${INPUTDIR}/${1}_PCRmrkd.clean.sorted.bam -nt 2 -o ${OUTPUTDIR}/${1}.intervals
