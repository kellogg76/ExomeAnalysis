#!/bin/bash
#Script asks for gene name then searches the BAM file and provides coverage

echo "***************"
echo "Mats Gene Coverage Calculator"
echo "***************"

#Bam file name
BamToSearch=/mnt/d/FEVR101/Control.bwa.sorted.bam

#Output Directory
OutputDir=/mnt/d/GeneCoverage

#Fasta File
FASTA=/mnt/d/hg19/human_g1k_v37.fasta
 
 report(){
#Coverage report
    echo $(date -u) >> $OutputDir/${gene_name}_report.txt
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"  >> $OutputDir/${gene_name}_report.txt
	printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"\
	"${gene_name}"\
	"Total Gene Coverage	Average Gene Coverage" > $OutputDir/${gene_name}_report.txt
	awk 'BEGIN{C=0}; {C=C+$4}; END{print C "\t" C/NR}' $OutputDir/${gene_name}_total_gene_coverage.txt >>$OutputDir/${gene_name}_report.txt
	printf "Total Coding Coverage	Average Coding Coverage\n" >> $OutputDir/${gene_name}_report.txt
	awk 'BEGIN{C=0}; {C=C+$4}; END{print C "\t" C/NR}' $OutputDir/${gene_name}_total_exon_coverage.txt  >>$OutputDir/${gene_name}_report.txt
	printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n" >>$OutputDir/${gene_name}_report.txt
 }
  
#Get gene name from user
echo "Which gene would you like to search for: "
read gene_name
echo "Gene name entered was"  $gene_name
read -p "Is this correct? (y/n) " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "yes"
	mkdir /mnt/d/GeneCoverage
	#Export whole gene and exons to new bed files
	echo "Exporting whole gene and exons to new bed files"
	grep -w ${gene_name} /mnt/d/hg19/hg19_genes.bed >$OutputDir/${gene_name}_gene.bed
	grep -w ${gene_name} /mnt/d/hg19/hg19_exons.bed >$OutputDir/${gene_name}_exons.bed
	#Remove "chr" from bed file
	sed 's/chr//' $OutputDir/${gene_name}_gene.bed > $OutputDir/${gene_name}_gene_nochr.bed
	sed 's/chr//' $OutputDir/${gene_name}_exons.bed > $OutputDir/${gene_name}_exons_nochr.bed
	#Count coverage
	echo "Calculating coverage of ${gene_name}."
	samtools mpileup -f $FASTA -l $OutputDir/${gene_name}_gene_nochr.bed $BamToSearch > $OutputDir/${gene_name}_total_gene_coverage.txt
	samtools mpileup -f $FASTA -l $OutputDir/${gene_name}_exons_nochr.bed $BamToSearch > $OutputDir/${gene_name}_total_exon_coverage.txt
	echo "Coverage for complete gene:"
	echo "Total Reads		Average Coverage Depth"
	awk 'BEGIN{C=0}; {C=C+$4}; END{print C "\t" C/NR}' $OutputDir/${gene_name}_total_gene_coverage.txt
	echo "Coverage for coding exons and UTR's only:"
	echo "Total Reads		Average Coverage Depth"
	awk 'BEGIN{C=0}; {C=C+$4}; END{print C "\t" C/NR}' $OutputDir/${gene_name}_total_exon_coverage.txt
	#Delete temp files
	rm $OutputDir/${gene_name}_gene.bed
	rm $OutputDir/${gene_name}_gene_nochr.bed
	rm $OutputDir/${gene_name}_exons.bed
	rm $OutputDir/${gene_name}_exons_nochr.bed
	report
	echo "Complete."
fi

#add FEVR gene name option to search for all FEVR genes?