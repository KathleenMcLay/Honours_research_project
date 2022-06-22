module load bcftools

#create a variable for the output directory
OUTPUTDIR="/g/data/ht96/McLay_UQ/Honours/Output/WGS/variant_calling"

#create an input variable for the input directory 
IN="/g/data/ht96/McLay_UQ/Honours/Output/WGS/variant_calling/${1}"

#concatenate the 20 individual chromosome files for each individual 
bcftools concat --threads 6 ${IN}/${1}_SLv141Ch1.vcf.gz ${IN}/${1}_SLv141Ch2.vcf.gz ${IN}/${1}_SLv141Ch3.vcf.gz ${IN}/${1}_SLv141Ch4.vcf.gz ${IN}/${1}_SLv141Ch5.vcf.gz ${IN}/${1}_SLv141Ch6.vcf.gz ${IN}/${1}_SLv141Ch7.vcf.gz ${IN}/${1}_SLv141Ch8.vcf.gz ${IN}/${1}_SLv141Ch9.vcf.gz ${IN}/${1}_SLv141Ch10.vcf.gz ${IN}/${1}_SLv141Ch11.vcf.gz ${IN}/${1}_SLv141Ch12.vcf.gz ${IN}/${1}_SLv141Ch13.vcf.gz ${IN}/${1}_SLv141Ch14.vcf.gz ${IN}/${1}_SLv141Ch15.vcf.gz ${IN}/${1}_SLv141Ch16.vcf.gz ${IN}/${1}_SLv141Ch17.vcf.gz ${IN}/${1}_SLv141Ch18.vcf.gz ${IN}/${1}_SLv141Ch19.vcf.gz ${IN}/${1}_SLv141Ch20.vcf.gz --output ${OUTPUTDIR}/${1}_concat.vcf.gz