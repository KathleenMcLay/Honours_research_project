#STEP 1: QUALITY CHECKING  - Fastp

#load fastp 
module load fastp

#create a variable for the directory where you'll save your output
OUTPUTDIR="/scratch/ht96/km6006/WGS_output/quality_checking"

#create a variable each for your forward read and reverse read files 
INPONE="/g/data/ht96/McLay_UQ/Honours/Raw_data/WGS/${1}_R1.fastq.gz"
INPTWO="/g/data/ht96/McLay_UQ/Honours/Raw_data/WGS/${1}_R2.fastq.gz"

#fastp command  
fastp --in1 $INPONE --in2 $INPTWO --out1 ${OUTPUTDIR}/${1}_R1_trimmed.fastq.gz --out2 ${OUTPUTDIR}/${1}_R2_trimmed.fastq.gz --unpaired1 ${OUTPUTDIR}/${1}_R1_unpaired.fastq.gz --unpaired2 ${OUTPUTDIR}/${1}_R2_unpaired.fastq.gz -q 10 -u 50 -l 50 -h ${OUTPUTDIR}/${1}.html &> ${OUTPUTDIR}/${1}.log 
