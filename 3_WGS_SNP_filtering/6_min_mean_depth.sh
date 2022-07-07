#set a variable for your directory 
DIR="/g/data/ht96/McLay_UQ/Honours/Output/WGS/SNP_filtering"

#using vcftools, filter the vcf file to remove any sites with a minimum read depth <10
/home/564/km6006/bin/vcftools --gzvcf ${DIR}/4_30_max_mean_depth_60.vcf.gz --recode --recode-INFO-all --min-meanDP 10 --stdout | gzip -c > ${DIR}/5_30_min_mean_depth_10.vcf.gz