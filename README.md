# Hi-C Library preparation, WGS DNA extraction and sequencing
Hi-C Libraries were prepared using the [Proximo Hi-C (Plant) Kit protocol v4.0](https://github.com/KathleenMcLay/Honours_research_project/blob/main/Laboratory/Proximo_Hi-C_Plant_Kit_Protocol_v4.0_20210208.pdf). 
Sequencing of Hi-C Libraries was completed by the Central Analytical Research Facility (CARF) at Queensland University of Technology (QUT).

DNA was extracted for Whole Genome Sequencing (WGS) using the [DNeasy Plant Pro Kit protocol](https://github.com/KathleenMcLay/Honours_research_project/blob/main/Laboratory/DNeasy%20Plant%20Pro%20Kit%20Protocol.pdf).
WGS Library preparation and sequencing was completed by the Central Analytical Research Facility (CARF) at Queensland University of Technology (QUT).

# WGS Bioinformatics  

## Quality Checking 

Two FASTQ files were received for each individual containing the forward and reverse reads. FASTQ files were quality checked using ```fastp v.0.20.0``` [(Chen et al. 2018)](https://academic.oup.com/bioinformatics/article/34/17/i884/5093234). PolyG tails were trimmed, illumina adaptors were removed, low quality reads (50% of quality scores <10) were removed as were reads shorter than 50 bp. 

## Indexing Reference Genome

The *Senecio lautus* reference genome (v1.41) was indexed using the ```BWA v0.7.17``` [(Li and Durbin, 2009)](https://academic.oup.com/bioinformatics/article/25/14/1754/225615) index function.

```
bwa index -a bwtsw reference_genome.fasta
```

## Aligning and Sorting 

Forward and reverse reads were aligned to the reference genome and read groups were added with ```BWA-MEM v0.7.13``` using default parameters. The BAM files were then sorted using ```Samtools v1.12``` [(Danecek et al. 2021)](https://academic.oup.com/gigascience/article/10/2/giab008/6137722) sort function.

```
bwa mem -t 12 -M -R "@RG\tSM:individual1\tID:individual1\tLB:individual1\tPL:ILLUMINA\tPU:individual1" \  
    reference_genome.fasta \
    individual1_1.fasta.gz \
    individual1_2.fasta.gz |
samtools sort -@ 12 -T individual1 -o individual1_sorted.bam
```

## Cleaning BAMS

The sorted Bam files for each individual were cleaned with ```picard v2.27.2``` [Broad Institute, 2019)](http://broadinstitute.github.io/picard/) CleanSam to softclips alignments outside the reference genome and remove set quality scores for unmapped reads to 0.

```
java -Xmx2g -jar picard.jar CleanSam \
        INPUT=individual1_sorted.bam \
        OUTPUT=individual1_clean.sorted.bam
```

### Marking PCR Duplicates 

PCR duplicates were marked for removal with ```Picard v2.27.2``` MarkDuplicates using default parameters on a sorted file. 

```
java -XX:ConcGCThreads=1 -XX:ParallelGCThreads=1 -Xmx4g -jar picard.jar MarkDuplicates \
        INPUT=individual1_clean.sorted.bam \
        OUTPUT=individual1_PCRmrkd.clean.sorted.bam \
        REMOVE_DUPLICATES=false \
        ASSUME_SORTED=true \
        VALIDATION_STRINGENCY=SILENT \
        READ_NAME_REGEX=null \
        MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=900 \
        METRICS_FILE=individual1_PCRmrkd.clean.sorted.metrics
```

### Indexing BAMS 

BAM files with PCR duplicates marked were indexed using ```Samtools v1.12``` index.

```
samtools index individual1_PCRmrkd.clean.sorted.bam
```

### Realigning around Indels 

```Picard v2.27.2``` CreateSequenceDictionary was used to create a dictionary file of the *Senecio lautus* reference genome (v1.41)

```
java -jar picard.jar CreateSequenceDictionary \
        R=reference_genome.fasta \
        O=reference_genome.dict
```

The *Senecio lautus* reference genome (1.41) was indexed with ```Samtools v1.12``` index. 

```
samtools faidx reference_genome.fasta
```

Targets for realignment were identified using ```GATK v4.2``` [(Van der Auwera and O'Connor, 2020)](https://www.oreilly.com/library/view/genomics-in-the/9781491975183/) RealignerTargetCreator.

```
java -jar GenomeAnalysisTK.jar \
        -T RealignerTargetCreator \
        -R reference_genome.fasta \
        -I individual1_PCRmrkd.clean.sorted.bam \
        -nt 2 \
        -o individual1.intervals
```

The realignment was then performed with ```GATK v4.2``` IndelRealigner, using the targets for realignment, dictionary reference genome file, and reference files. 

```
java -jar GenomeAnalysisTK.jar \
        -T IndelRealigner \
        -R reference_genome.fasta \
        -I individual1_PCRmrkd.clean.sorted.bam \
        -targetIntervals individual1.intervals \
        -o individual1_realigned.PCRmrkd.clean.sorted.bam
```

### Index final BAM files

The final BAM files were indexed using ```Samtools v1.12``` index.

```
samtools index individual1_realigned.PCRmrkd.clean.sorted.bam
```
