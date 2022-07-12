#create a variable for the input directory 
IN="/g/data/ht96/McLay_UQ/Honours/Output/WGS/SNP_filtering"

#create a variable for the output directory
OUT="/g/data/ht96/McLay_UQ/Honours/Output/WGS/local_pca"

#using VCFtools, create a new VCF file with individuals W2 and T1 removed. note: 4_100_max_mean_depth_80.vcf has been renamed to 4_stringent_filter_Q20RD10M100MMD80.vcf
/home/564/km6006/bin/vcftools --remove-indv W2 --remove-indv T1 --vcf ${IN}/4_stringent_filter_Q20RD10M100MMD80.vcf --recode --recode-INFO-all --out ${OUT}/D1H1D4H5A3A7.vcf