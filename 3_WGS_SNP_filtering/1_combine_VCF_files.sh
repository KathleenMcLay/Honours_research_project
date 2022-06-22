module load gatk

#create variable for output directory 
OUTPUTDIR="/g/data/ht96/McLay_UQ/Honours/Output/WGS/SNP_filtering"

#create variable for input directory
IN="/g/data/ht96/McLay_UQ/Honours/Output/WGS/variant_calling"

#combine individual sample VCF files 
gatk CombineGVCFs --reference /scratch/ht96/km6006/Ref_Genome/SLv141Asm_Ch20RN.fasta --variant ${IN}/D1_concat.vcf.gz --variant ${IN}/D4_concat.vcf.gz --variant ${IN}/H1_concat.vcf.gz --variant ${IN}/H5_concat.vcf.gz --variant ${IN}/A3_concat.vcf.gz --variant ${IN}/A7_concat.vcf.gz --variant ${IN}/T1_concat.vcf.gz --variant ${IN}/W2_concat.vcf.gz --output ${OUTPUTDIR}/all.vcf.gz