#set a variable for your directory 
DIR="/g/data/ht96/McLay_UQ/Honours/Output/WGS/SNP_filtering"

#using vcftools, filter the vcf file to remove any sites with a minimum read depth <10
/home/564/km6006/bin/vcftools --vcf ${DIR}/4_max_mean_depth.vcf min-meanDP 10 --out ${DIR}/5_min_mean_depth