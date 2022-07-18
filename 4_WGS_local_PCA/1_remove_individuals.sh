#create a variable for the input directory 
#IN="/g/data/ht96/McLay_UQ/Honours/Output/WGS/SNP_filtering"

#create a variable for the output directory
DIR="/g/data/ht96/McLay_UQ/Honours/Output/WGS/local_pca"

#using VCFtools, create a new VCF file with the required individual samples removed (in this case its D1 and H1). 
/home/564/km6006/bin/vcftools --remove-indv D1 --remove-indv H1 --vcf ${DIR}/100_D1H1D4H5.vcf --recode --recode-INFO-all --out ${DIR}/100_D4H5