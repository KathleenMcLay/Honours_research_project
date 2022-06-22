#QUALITY CHECKING  - FastQC

#load fastQC 
module load fastqc

#create a variable for the output directory
OUTPUTDIR="/g/data/ht96/McLay_UQ/Honours/Output/WGS/fastQC"

#create a variable each for your forward read and reverse read files 
INPONE="/g/data/ht96/McLay_UQ/Honours/Output/WGS/quality_checking/${1}_R1_trimmed.fastq.gz"
INPTWO="/g/data/ht96/McLay_UQ/Honours/Output/WGS/quality_checking/${1}_R2_trimmed.fastq.gz"

#run fastQC 
fastqc ${INPONE} ${INPTWO} -o ${OUTPUTDIR}
