#!/bin/bash
#Command to run this script is ./RNASeq16.sh

echo "***************"
echo "Mats RNASeq Pipeline"
echo "***************"

#Enter sample names below
sample1=
sample2=
sample3=
sample4=
sample5=
sample6=
sample7=
sample8=
sample9=
sample10=
sample11=
sample12=
sample13=
sample14=
sample15=
sample16=

move_fastq() {
#Move files to main directory
find /mnt/d/RNASeq003 -type f -print0 | xargs -0 mv -t /mnt/d/RNASeq003
}

catenate_fastq() {
#Catenate the files
cat 779-med_S1_L001_R1_001.fastq.gz 779-med_S1_L002_R1_001.fastq.gz 779-med_S1_L003_R1_001.fastq.gz 779-med_S1_L004_R1_001.fastq.gz > 779-med-R1.fastq.gz && cat 779-med_S1_L001_R2_001.fastq.gz 779-med_S1_L002_R2_001.fastq.gz 779-med_S1_L003_R2_001.fastq.gz 779-med_S1_L004_R2_001.fastq.gz > 779-med-R2.fastq.gz
cat 779-IL5_S2_L001_R1_001.fastq.gz 779-IL5_S2_L002_R1_001.fastq.gz 779-IL5_S2_L003_R1_001.fastq.gz 779-IL5_S2_L004_R1_001.fastq.gz > 779-IL5-R1.fastq.gz && cat 779-IL5_S2_L001_R2_001.fastq.gz 779-IL5_S2_L002_R2_001.fastq.gz 779-IL5_S2_L003_R2_001.fastq.gz 779-IL5_S2_L004_R2_001.fastq.gz > 779-IL5-R2.fastq.gz

cat 780-med_S3_L001_R1_001.fastq.gz 780-med_S3_L002_R1_001.fastq.gz 780-med_S3_L003_R1_001.fastq.gz 780-med_S3_L004_R1_001.fastq.gz > 780-med-R1.fastq.gz && cat 780-med_S3_L001_R2_001.fastq.gz 780-med_S3_L002_R2_001.fastq.gz 780-med_S3_L003_R2_001.fastq.gz 780-med_S3_L004_R2_001.fastq.gz > 780-med-R2.fastq.gz
cat 780-IL5_S4_L001_R1_001.fastq.gz 780-IL5_S4_L002_R1_001.fastq.gz 780-IL5_S4_L003_R1_001.fastq.gz 780-IL5_S4_L004_R1_001.fastq.gz > 780-IL5-R1.fastq.gz && cat 780-IL5_S4_L001_R2_001.fastq.gz 780-IL5_S4_L002_R2_001.fastq.gz 780-IL5_S4_L003_R2_001.fastq.gz 780-IL5_S4_L004_R2_001.fastq.gz > 780-IL5-R2.fastq.gz

cat 788-med_S5_L001_R1_001.fastq.gz 788-med_S5_L002_R1_001.fastq.gz 788-med_S5_L003_R1_001.fastq.gz 788-med_S5_L004_R1_001.fastq.gz > 788-med-R1.fastq.gz && cat 788-med_S5_L001_R2_001.fastq.gz 788-med_S5_L002_R2_001.fastq.gz 788-med_S5_L003_R2_001.fastq.gz 788-med_S5_L004_R2_001.fastq.gz > 788-med-R2.fastq.gz
cat 788-IL5_S6_L001_R1_001.fastq.gz 788-IL5_S6_L002_R1_001.fastq.gz 788-IL5_S6_L003_R1_001.fastq.gz 788-IL5_S6_L004_R1_001.fastq.gz > 788-IL5-R1.fastq.gz && cat 788-IL5_S6_L001_R2_001.fastq.gz 788-IL5_S6_L002_R2_001.fastq.gz 788-IL5_S6_L003_R2_001.fastq.gz 788-IL5_S6_L004_R2_001.fastq.gz > 788-IL5-R2.fastq.gz

cat 790-med_S7_L001_R1_001.fastq.gz 790-med_S7_L002_R1_001.fastq.gz 790-med_S7_L003_R1_001.fastq.gz 790-med_S7_L004_R1_001.fastq.gz > 790-med-R1.fastq.gz && cat 790-med_S7_L001_R2_001.fastq.gz 790-med_S7_L002_R2_001.fastq.gz 790-med_S7_L003_R2_001.fastq.gz 790-med_S7_L004_R2_001.fastq.gz > 790-med-R2.fastq.gz
cat 790-IL5_S8_L001_R1_001.fastq.gz 790-IL5_S8_L002_R1_001.fastq.gz 790-IL5_S8_L003_R1_001.fastq.gz 790-IL5_S8_L004_R1_001.fastq.gz > 790-IL5-R1.fastq.gz && cat 790-IL5_S8_L001_R2_001.fastq.gz 790-IL5_S8_L002_R2_001.fastq.gz 790-IL5_S8_L003_R2_001.fastq.gz 790-IL5_S8_L004_R2_001.fastq.gz > 790-IL5-R2.fastq.gz

cat 792-med_S9_L001_R1_001.fastq.gz 792-med_S9_L002_R1_001.fastq.gz 792-med_S9_L003_R1_001.fastq.gz 792-med_S9_L004_R1_001.fastq.gz > 792-med-R1.fastq.gz && cat 792-med_S9_L001_R2_001.fastq.gz 792-med_S9_L002_R2_001.fastq.gz 792-med_S9_L003_R2_001.fastq.gz 792-med_S9_L004_R2_001.fastq.gz > 792-med-R2.fastq.gz
cat 792-IL5_S10_L001_R1_001.fastq.gz 792-IL5_S10_L002_R1_001.fastq.gz 792-IL5_S10_L003_R1_001.fastq.gz 792-IL5_S10_L004_R1_001.fastq.gz > 792-IL5-R1.fastq.gz && cat 792-IL5_S10_L001_R2_001.fastq.gz 792-IL5_S10_L002_R2_001.fastq.gz 792-IL5_S10_L003_R2_001.fastq.gz 792-IL5_S10_L004_R2_001.fastq.gz > 792-IL5-R2.fastq.gz

cat 793-med_S11_L001_R1_001.fastq.gz 793-med_S11_L002_R1_001.fastq.gz 793-med_S11_L003_R1_001.fastq.gz 793-med_S11_L004_R1_001.fastq.gz > 793-med-R1.fastq.gz && cat 793-med_S11_L001_R2_001.fastq.gz 793-med_S11_L002_R2_001.fastq.gz 793-med_S11_L003_R2_001.fastq.gz 793-med_S11_L004_R2_001.fastq.gz > 793-med-R2.fastq.gz
cat 793-IL5_S12_L001_R1_001.fastq.gz 793-IL5_S12_L002_R1_001.fastq.gz 793-IL5_S12_L003_R1_001.fastq.gz 793-IL5_S12_L004_R1_001.fastq.gz > 793-IL5-R1.fastq.gz && cat 793-IL5_S12_L001_R2_001.fastq.gz 793-IL5_S12_L002_R2_001.fastq.gz 793-IL5_S12_L003_R2_001.fastq.gz 793-IL5_S12_L004_R2_001.fastq.gz > 793-IL5-R2.fastq.gz

cat 794-med_S13_L001_R1_001.fastq.gz 794-med_S13_L002_R1_001.fastq.gz 794-med_S13_L003_R1_001.fastq.gz 794-med_S13_L004_R1_001.fastq.gz > 794-med-R1.fastq.gz && cat 794-med_S13_L001_R2_001.fastq.gz 794-med_S13_L002_R2_001.fastq.gz 794-med_S13_L003_R2_001.fastq.gz 794-med_S13_L004_R2_001.fastq.gz > 794-med-R2.fastq.gz
cat 794-IL5_S14_L001_R1_001.fastq.gz 794-IL5_S14_L002_R1_001.fastq.gz 794-IL5_S14_L003_R1_001.fastq.gz 794-IL5_S14_L004_R1_001.fastq.gz > 794-IL5-R1.fastq.gz && cat 794-IL5_S14_L001_R2_001.fastq.gz 794-IL5_S14_L002_R2_001.fastq.gz 794-IL5_S14_L003_R2_001.fastq.gz 794-IL5_S14_L004_R2_001.fastq.gz > 794-IL5-R2.fastq.gz

cat 795-med_S15_L001_R1_001.fastq.gz 795-med_S15_L002_R1_001.fastq.gz 795-med_S15_L003_R1_001.fastq.gz 795-med_S15_L004_R1_001.fastq.gz > 795-med-R1.fastq.gz && cat 795-med_S15_L001_R2_001.fastq.gz 795-med_S15_L002_R2_001.fastq.gz 795-med_S15_L003_R2_001.fastq.gz 795-med_S15_L004_R2_001.fastq.gz > 795-med-R2.fastq.gz
cat 795-IL5_S16_L001_R1_001.fastq.gz 795-IL5_S16_L002_R1_001.fastq.gz 795-IL5_S16_L003_R1_001.fastq.gz 795-IL5_S16_L004_R1_001.fastq.gz > 795-IL5-R1.fastq.gz && cat 795-IL5_S16_L001_R2_001.fastq.gz 795-IL5_S16_L002_R2_001.fastq.gz 795-IL5_S16_L003_R2_001.fastq.gz 795-IL5_S16_L004_R2_001.fastq.gz > 795-IL5-R2.fastq.gz

#Catenate the Undetermined reads
cat Undetermined_S0_L001_R1_001.fastq.gz Undetermined_S0_L002_R1_001.fastq.gz Undetermined_S0_L003_R1_001.fastq.gz Undetermined_S0_L004_R1_001.fastq.gz > Undetermined_S0-R1.fastq.gz && cat Undetermined_S0_L001_R2_001.fastq.gz Undetermined_S0_L002_R2_001.fastq.gz Undetermined_S0_L003_R2_001.fastq.gz Undetermined_S0_L004_R2_001.fastq.gz > Undetermined_S0-R2.fastq.gz
}

qc_fastq() {
#QC
fastqc /mnt/d/RNASeq-01/25-R1.fastq.gz
fastqc /mnt/d/RNASeq-01/25-R2.fastq.gz
fastqc /mnt/d/RNASeq-01/59-R1.fastq.gz /mnt/d/RNASeq-01/59-R2.fastq.gz
fastqc /mnt/d/RNASeq-01/59-R2.fastq.gz
}

map_reads() {
#Map Reads
bwa mem -t 7 -M -v 2 /mnt/d/hg19/human_g1k_v37.fasta /mnt/d/RNASeq-01/25-R1.fastq.gz /mnt/d/RNASeq-01/25-R2.fastq.gz | samtools view -u - | samtools sort -@ 7 -O bam -o /mnt/d/RNASeq-01/25.bwa.sorted.bam -T /mnt/d/RNASeq-01/25.bwa.sort.temp
bwa mem -t 7 -M -v 2 /mnt/d/hg19/human_g1k_v37.fasta /mnt/d/RNASeq-01/59-R1.fastq.gz /mnt/d/RNASeq-01/59-R2.fastq.gz | samtools view -u - | samtools sort -@ 7 -O bam -o /mnt/d/RNASeq-01/59.bwa.sorted.bam -T /mnt/d/RNASeq-01/59.bwa.sort.temp
}

##########################
###Select which functions to run###
##########################
move_fastq
catenate_fastq
qc_fastq
#map_reads