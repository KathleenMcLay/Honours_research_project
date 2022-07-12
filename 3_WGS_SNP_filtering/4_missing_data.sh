#set a variable for your directory 
DIR="/g/data/ht96/McLay_UQ/Honours/Output/WGS/SNP_filtering"

#using VCFtools, filter the zipped VCF file to remove sites where <50% of individual samples have been genotyped | save the output as a zipped VCF file
/home/564/km6006/bin/vcftools --gzvcf ${DIR}/2_read_depth_10.vcf.gz --max-missing 0.3 --recode --recode-INFO-all --stdout | gzip -c > ${DIR}/3_sites_missing_data_30.vcf.gz