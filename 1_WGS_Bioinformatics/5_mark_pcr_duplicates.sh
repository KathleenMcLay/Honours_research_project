#STEP 5: MARK PCR DUPLICATES IN THE CLEAN SORTED BAM FILES 

#create directory variables 
INPUTDIR="/g/data/ht96/McLay_UQ/Honours/Output/WGS/clean"
OUTPUTDIR="/g/data/ht96/McLay_UQ/Honours/Output/WGS/mark_pcr_duplicates"

#marking PCR duplicates for removal with Picard MarkDuplicates
java -XX:ConcGCThreads=1 -XX:ParallelGCThreads=1 -Xmx4g -jar /home/564/km6006/picard.jar MarkDuplicates \
        INPUT=${INPUTDIR}/${1}_clean.sorted.bam \
        OUTPUT=${OUTPUTDIR}/${1}_PCRmrkd.clean.sorted.bam \
        REMOVE_DUPLICATES=false \
        ASSUME_SORTED=true \
        VALIDATION_STRINGENCY=SILENT \
        READ_NAME_REGEX=null \
        MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=900 \
        METRICS_FILE=${OUTPUTDIR}/${1}_PCRmrkd.clean.sorted.metrics