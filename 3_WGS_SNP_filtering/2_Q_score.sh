#set a variable for your directory 
DIR="/g/data/ht96/McLay_UQ/Honours/Output/WGS/SNP_filtering"

#using vcftools, filter the zipped vcf file to remove any sites with a quality score of <20 | save the output as a zipped VCF file
/home/564/km6006/bin/vcftools --gzvcf ${DIR}/all.individuals.vcf.gz --minQ 20 --recode --recode-INFO-all --stdout | gzip -c > ${DIR}/Q_score_filter_20.vcf.gz