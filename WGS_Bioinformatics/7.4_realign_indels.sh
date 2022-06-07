#STEP 7: REALIGNING AROUND INDELS

#STEP 7.4: REALIGN TARGET REGIONS WITH INDELS 

#create directory variables 
INPUTDIR="/g/data/ht96/McLay_UQ/Honours/Output/WGS/mark_pcr_duplicates"
TARGETDIR="/g/data/ht96/McLay_UQ/Honours/Output/WGS/id_indels"
OUTPUTDIR="/g/data/ht96/McLay_UQ/Honours/Output/WGS/id_indels"

#realigning regions with indels in the sample using GATK3.8 IndelRealigner
#note: using intervals file from storage because IndelRealigner can't handle the character '[' in the TMPDIR file path
java -jar /home/564/km6006/GenomeAnalysisTK.jar -T IndelRealigner -R /scratch/ht96/km6006/Ref_Genome/SLv141Asm_Ch20RN.fasta -I ${INPUTDIR}/${1}_PCRmrkd.clean.sorted.bam -targetIntervals ${TARGETDIR}/${1}.intervals -o ${OUTPUTDIR}/${1}_realigned.PCRmrkd.clean.sorted.bam