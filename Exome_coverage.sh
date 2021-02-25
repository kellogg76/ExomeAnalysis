#!/bin/bash


echo "***************"
echo "Mats Exome Coverage Calculator"
echo "***************"

Sample1=$1

###Paths to files###
#Output Directory
OutputDir=/mnt/d/Exome_Coverage/

#Bam file name
BamToSearch=/mnt/d/FEVR50/${Sample1}.recalibrated.sorted.bam
#BamToSearch=/mnt/d/Exome_Coverage/244_chr20.bam

#Fasta File
FASTA=/mnt/d/hg19/human_g1k_v37.fasta

#BED File of Exons
EXONS=/mnt/d/hg19/TruSeq_exome_targeted_regions.hg19_no_chr.bed
 
mkdir $OutputDir/${Sample1}

#Count coverage
echo "Calculating coverage of exons..."
samtools mpileup -Q 1 -f $FASTA -l $EXONS $BamToSearch > $OutputDir/${Sample1}/${Sample1}_total_exon_coverage.txt

#Trim off everything except columns 1 and 2 and 4
echo "Trimming columns that are not required..."
awk '{ print $1, $2, $4 }' $OutputDir/${Sample1}/${Sample1}_total_exon_coverage.txt > $OutputDir/${Sample1}/${Sample1}_total_exon_coverage_cut.txt

#Cut by Chromosome
echo "Splitting by chromosome..."
awk -F" " '{print >> ("Chr_" $1".txt")}' $OutputDir/${Sample1}/${Sample1}_total_exon_coverage_cut.txt

#Move Files to subfolder
mv Chr*.txt $OutputDir/${Sample1}/

#Plot by chromosome?
#Doesn't work yet, so run the R script manually from within RStudio
#chmod +x /mnt/c/Users/Bedard_Lab/Documents/GitHub/ExomeAnalysis/Exome_Plotter.R
#dos2unix /mnt/c/Users/Bedard_Lab/Documents/GitHub/ExomeAnalysis/Exome_Plotter.R
#source /mnt/c/Users/Bedard_Lab/Documents/GitHub/ExomeAnalysis/Exome_Plotter.R
