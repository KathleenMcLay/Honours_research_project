#STEP 3: ALIGNING AND SORTING - BWA and Samtools 

module load bwa
module load samtools

#create a variable for the directory where you'll save your output
OUTPUTDIR="/scratch/ht96/km6006/WGS_output/align/"

#Create input variables for forward and reverse read files
BWAONE="/g/data/ht96/McLay_UQ/Honours/Output/WGS/quality_control/${1}_R1_trimmed.fastq.gz"
BWATWO="/g/data/ht96/McLay_UQ/Honours/Output/WGS/quality_control/${1}_R2_trimmed.fastq.gz"

#aligning and adding read groups with BWA, sorting the bam file with Samtools  
bwa mem -t 12 -M -R "@RG\tSM:${1}\tID:${1}\tLB:${1}\tPL:ILLUMINA\tPU:${1}" /scratch/ht96/km6006/Ref_Genome/SLv141Asm_Ch20RN.fasta $BWAONE $BWATWO | samtools sort -@ 12 -T ${OUTPUTDIR}/${1} -o ${OUTPUTDIR}/${1}_sorted.bam -

#Alignment stats 
#samtools flagstat ${OUTPUTDIR}/${1}_sorted.bam &> ${OUTPUTDIR}/${1}_sorted_stats.txt