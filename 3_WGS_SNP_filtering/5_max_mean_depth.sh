#set a variable for your directory 
DIR="/g/data/ht96/McLay_UQ/Honours/Output/WGS/SNP_filtering"

#using vcftools, create a txt file, to visualise the distribution of mean depth per site that can be used to determine the mean depth filter
/home/564/km6006/bin/vcftools --gzvcf ${DIR}/3_sites_missing_data_50.vcf.gz --site-mean-depth --out ${DIR}/mean_depth

#using vcftools filter the zipped VCF file to remove any sites with a mean depth >120. 
/home/564/km6006/bin/vcftools --gzvcf ${DIR}/3_read_depth.vcf.gz max-meanDP 120 --out ${DIR}/4_max_mean_depth