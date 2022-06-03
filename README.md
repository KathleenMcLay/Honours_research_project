# Hi-C Library preparation, WGS DNA extraction and sequencing
Hi-C Libraries were prepared using the [Proximo Hi-C (Plant) Kit protocol v4.0](https://github.com/KathleenMcLay/Honours_research_project/blob/main/Laboratory/Proximo_Hi-C_Plant_Kit_Protocol_v4.0_20210208.pdf). 
Sequencing of Hi-C Libraries was completed by the Central Analytical Research Facility (CARF) at Queensland University of Technology (QUT).

DNA was extracted for Whole Genome Sequencing (WGS) using the [DNeasy Plant Pro Kit protocol](https://github.com/KathleenMcLay/Honours_research_project/blob/main/Laboratory/DNeasy%20Plant%20Pro%20Kit%20Protocol.pdf).
WGS Library preparation and sequencing was completed by the Central Analytical Research Facility (CARF) at Queensland University of Technology (QUT).

# Bioinformatics  

## Quality Checking 

Two FASTQ files were received for each individual containing the forward and reverse reads. FASTQ files were quality checked using fastp v.0.20.0. [(Chen et al. 2018)] (https://academic.oup.com/bioinformatics/article/34/17/i884/5093234). PolyG tails trimmed, illumina adaptors were removed, low quality reads (50% of quality scores <10) were removed as were reads shorter than 50 bp. 
```


## Aligning and Sorting 

## Cleaning BAMS
