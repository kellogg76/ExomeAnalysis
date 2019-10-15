#!/bin/bash
#Gene coverage
#Python script asks for gene name then searches FEVR.combined.gemini.db for all hits in that gene

echo "***************"
echo "Mats Gene Coverage Calculator"
echo "***************"

#hg19 all genes
#/mnt/d/hg19/hg19.gene.bed

#FEVR genes
#/mnt/d/hg19/FEVR_genes.bed

#Bam file name
BamToSearch=/mnt/d/FEVR101/Control.bwa.sorted.bam
 
 report(){
#Coverage report
	printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"\
	"${gene_name}"\
	"Total Gene Coverage	Average Gene Coverage" > /mnt/d/${gene_name}_report.txt
	awk 'BEGIN{C=0}; {C=C+$4}; END{print C "\t" C/NR}' /mnt/d/${gene_name}_total_gene_coverage.txt >>/mnt/d/${gene_name}_report.txt
	printf "Total Coding Coverage	Average Coding Coverage\n" >> /mnt/d/${gene_name}_report.txt
	awk 'BEGIN{C=0}; {C=C+$4}; END{print C "\t" C/NR}' /mnt/d/${gene_name}_total_exon_coverage.txt  >>/mnt/d/${gene_name}_report.txt
	printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n" >>/mnt/d/${gene_name}_report.txt
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
	#Export all FEVR genes to new bed file
	echo "Exporting gene to a BED file"
	grep -w ${gene_name} /mnt/d/hg19/hg19_genes.bed >/mnt/d/${gene_name}_gene.bed
	grep -w ${gene_name} /mnt/d/hg19/hg19_exons.bed >/mnt/d/${gene_name}_exons.bed
	#Remove "chr" from bed file
	sed 's/chr//' /mnt/d/${gene_name}_gene.bed > /mnt/d/${gene_name}_gene_nochr.bed
	sed 's/chr//' /mnt/d/${gene_name}_exons.bed > /mnt/d/${gene_name}_exons_nochr.bed
	#Count coverage
	echo "Calculating coverage of ${gene_name}."
	samtools mpileup -f /mnt/d/hg19/human_g1k_v37.fasta -l /mnt/d/${gene_name}_gene_nochr.bed $BamToSearch > /mnt/d/${gene_name}_total_gene_coverage.txt
	samtools mpileup -f /mnt/d/hg19/human_g1k_v37.fasta -l /mnt/d/${gene_name}_exons_nochr.bed $BamToSearch > /mnt/d/${gene_name}_total_exon_coverage.txt
	echo "Coverage for complete gene:"
	echo "Total Reads		Average Coverage Depth"
	awk 'BEGIN{C=0}; {C=C+$4}; END{print C "\t" C/NR}' /mnt/d/${gene_name}_total_gene_coverage.txt
	echo "Coverage for coding exons and UTR's only:"
	echo "Total Reads		Average Coverage Depth"
	awk 'BEGIN{C=0}; {C=C+$4}; END{print C "\t" C/NR}' /mnt/d/${gene_name}_total_exon_coverage.txt
	#Delete temp files
	rm /mnt/d/${gene_name}_gene.bed
	rm /mnt/d/${gene_name}_gene_nochr.bed
	rm /mnt/d/${gene_name}_exons.bed
	rm /mnt/d/${gene_name}_exons_nochr.bed
	report
	echo "Complete."
fi

#add FEVR gene name option to search for all FEVR genes?