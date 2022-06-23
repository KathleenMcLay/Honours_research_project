module load bcftools

#create variable for output directory 
OUTPUTDIR="/g/data/ht96/McLay_UQ/Honours/Output/WGS/SNP_filtering"

#create variable for input directory
IN="/g/data/ht96/McLay_UQ/Honours/Output/WGS/variant_calling"

#combine individual sample VCF files 
bcftools merge --threads 6 ${IN}/D1_concat.vcf.gz ${IN}/D4_concat.vcf.gz ${IN}/H1_concat.vcf.gz ${IN}/H5_concat.vcf.gz ${IN}/A3_concat.vcf.gz ${IN}/A7_concat.vcf.gz ${IN}/T1_concat.vcf.gz ${IN}/W2_concat.vcf.gz --output ${OUTPUTDIR}/chicken.vcf.gz --gvcf /scratch/ht96/km6006/Ref_Genome/SLv141Asm_Ch20RN.fasta