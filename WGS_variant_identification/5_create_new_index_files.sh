module load gatk

#create a variable for the input directory 
IN="/g/data/ht96/McLay_UQ/Honours/Output/WGS/variant_calling"

#create index files 
gatk IndexFeatureFile --input ${IN}/${1}_concat.vcf.gz