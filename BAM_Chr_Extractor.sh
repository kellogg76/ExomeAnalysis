#!/bin/bash

#Extracts a given chromosome from a bam file

echo "***************"
echo "Mats BAM File Chromosome Extractor"
echo "***************"

#Output Directory
OutputDir=/mnt/d/FEVR

#Bam file to be split
bam_file=/mnt/d/FEVR/AP-1_S1.bam

#Name of new output file 
newfile=AP-1_

single_extraction()_{
#Chromosome to extract
Chr=chr3

samtools view  -b $bam_file $Chr > $OutputDir/$newfile_$Chr.bam -@ 8
samtools index $OutputDir/$newfile_$Chr.bam -@ 8
}

range_extraction(){
#Enter Chromosome range that needs splitting here
for chr in {20..21};
do
 echo "Splitting $bam_file Chromosome $chr"
 samtools view -bh $bam_file ${chr} > $bamfile.$chr.bam | samtools sort - ${chr}
samtools index ${chr}.bam
done
}

#Choose whole chromosome extraction or ranged extraction
single_extraction
#range_extraction

echo "Finished."