#create a variable for the output directory
DIR="/g/data/ht96/McLay_UQ/Honours/Output/WGS/local_pca"

#create an array containing the 20 chromosomes 
declare -a arr=("SLv141Ch1" "SLv141Ch2" "SLv141Ch3" "SLv141Ch4" "SLv141Ch5" "SLv141Ch6" "SLv141Ch7" "SLv141Ch8" "SLv141Ch9" "SLv141Ch10" "SLv141Ch11" "SLv141Ch12" "SLv141Ch13" "SLv141Ch14" "SLv141Ch15" "SLv141Ch16" "SLv141Ch17" "SLv141Ch18" "SLv141Ch19" "SLv141Ch20")

#using VCFtools, create a new file, containing only records for the chromosome specfied after --chr
#run VCFtools on the array in a loop - using the 'wait' command allows each iteration to run in the background once it starts processing allowing the function to execute in parallel for all 20 chromosomes
for i in "${arr[@]}";
do
    echo ${i} > /home/564/km6006/Scripts/output_realtime.txt
    # sleep $((RANDOM % 10))
    # echo ${i} &
    /home/564/km6006/bin/vcftools --chr ${i}  --vcf ${DIR}/100_D1H1D4H5A3A7.vcf --recode --recode-INFO-all --out ${DIR}/100_D1H1D4H5A3A7_${i}_chr
done

wait