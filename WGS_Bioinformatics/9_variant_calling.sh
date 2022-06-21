module load gatk 
 
#create a varaible for the output directory 
OUTPUTDIR="/g/data/ht96/McLay_UQ/Honours/Output/WGS/variant_calling/A3"

#create a variable for your input file 
BAMFILE="/g/data/ht96/McLay_UQ/Honours/Output/WGS/mark_pcr_duplicates/A3_PCRmrkd.clean.sorted.bam"

#create an array containing the 20 chromosomes 
declare -a arr=("SLv141Ch1" "SLv141Ch2" "SLv141Ch3" "SLv141Ch4" "SLv141Ch5" "SLv141Ch6" "SLv141Ch7" "SLv141Ch8" "SLv141Ch9" "SLv141Ch10" "SLv141Ch11" "SLv141Ch12" "SLv141Ch13" "SLv141Ch14" "SLv141Ch15" "SLv141Ch16" "SLv141Ch17" "SLv141Ch18" "SLv141Ch19" "SLv141Ch20")

#run gatk HaplotypeCaller on the array in a loop - using the 'wait' command allows each iteration to run in the background once it starts processing allowing the function to execute in parallele for all 20 chromosomes
for i in "${arr[@]}";
do
    gatk --java-options "-Xmx8g" HaplotypeCaller --input ${BAMFILE} --output ${OUTPUTDIR}/A3_${i}.vcf.gz --reference /scratch/ht96/km6006/Ref_Genome/SLv141Asm_Ch20RN.fasta --emit-ref-confidence GVCF --intervals $i &
done

wait