#STEP 4: CLEAN THE SORTED BAM FILE 

#set variables for input and output files 
CLEAN="/g/data/ht96/McLay_UQ/Honours/Output/WGS/align/${1}_sorted.bam"
OUTPUT="/g/data/ht96/McLay_UQ/Honours/Output/WGS/clean/${1}_clean.sorted.bam"

#clean the bam file with Picard 
java -Xmx2g -jar /home/564/km6006/picard.jar CleanSam INPUT=$CLEAN OUTPUT=$OUTPUT