#set a variable for your directory 
DIR="/g/data/ht96/McLay_UQ/Honours/Output/WGS/SNP_filtering"

#using vcf tools, filter the zipped VCF file to remove genotype data for individual samples with less than 10 reads 
/home/564/km6006/bin/vcftools --gzvcf ${DIR}/1_Q_score_filter_20.vcf.gz --minDP 10 --recode --recode-INFO-all --stdout | gzip -c > ${DIR}/2_read_depth_10.vcf.gz