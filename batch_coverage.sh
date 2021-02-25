#!/bin/bash
#Save a gene list as a text file, then this script exports a bed file of these genes & searches the BAM file providing coverage for the coding regions of those genes and UTR's
#run ./batch_coverage.sh sample_number eg ./batch_coverage.sh 2450

<<to_add
count genes and estimate completion time (~8mins/gene)

seperate out gene and exon coverage in to seperate functions to make reading clearer

list sample BAM's in a text file just like gene list
to_add

echo "***************"
echo "Mats Batch Gene Coverage Calculator"
echo "***************"

Sample=$1

#Bam file name
BamToSearch=/mnt/d/ExomeData/${Sample}.recalibrated.sorted.bam

#List of Genes
GeneList=/mnt/d/GENE_LIST.txt
dos2unix $GeneList

#Output Directory
OutputDir=/mnt/d/Batch_Coverage/$Sample

#Fasta File
FASTA=/mnt/d/hg19/human_g1k_v37.fasta
 
echo "Creating output directory..."
mkdir  -p $OutputDir
echo "Done."
 
 report(){
#Coverage report
    echo $(date -u) >> $OutputDir/Batch_report.txt
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"  >> $OutputDir/Batch_report.txt
	printf   "%b" \
	"${gene_name}\n"\
	"Total Gene Coverage	Average Gene Coverage\n" >> $OutputDir/Batch_report.txt                               #Uncomment  if  need overall gene coverage 
	#awk 'BEGIN{C=0}; {C=C+$4}; END{print C "\t" C/NR}' $OutputDir/${gene_name}_total_gene_coverage.txt >>$OutputDir/Batch_report.txt                               #Uncomment  if  need overall gene coverage 
	printf "Total Coding Coverage	Average Coding Coverage\n" >> $OutputDir/Batch_report.txt
	awk 'BEGIN{C=0}; {C=C+$4}; END{print C "\t" C/NR}' $OutputDir/${gene_name}_total_exon_coverage.txt  >>$OutputDir/Batch_report.txt
	#Calculate Max, Min and Mean coverage
	printf "Max, Min, Mean Coding Coverage\n" >> $OutputDir/Batch_report.txt
	awk 'NR == 1 { min = $4; max = $4 }
   {
    sum += $4
    if ($4 > max) {
        max = $4
    }
    if ($4 < min) {
        min = $4
    }
   } END {
    print max
    print min
    print sum / NR
   }' $OutputDir/${gene_name}_total_exon_coverage.txt >>$OutputDir/Batch_report.txt
	printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >>$OutputDir/Batch_report.txt
 }
 
while IFS="" read -r gene_name || [ -n "$gene_name" ]
do
  #Export all genes to new bed file
  echo "Exporting gene $gene_name to a BED file"
  #grep -w ${gene_name} /mnt/d/hg19/hg19_genes.bed >$OutputDir/${gene_name}_gene.bed                               #Uncomment  if  need overall gene coverage 
  grep -w ${gene_name} /mnt/d/hg19/hg19_exons.bed >$OutputDir/${gene_name}_exons.bed
  #Remove "chr" from bed file
   #sed 's/chr//' $OutputDir/${gene_name}_gene.bed > $OutputDir/${gene_name}_gene_nochr.bed                     #Uncomment  if  need overall gene coverage 
   sed 's/chr//' $OutputDir/${gene_name}_exons.bed > $OutputDir/${gene_name}_exons_nochr.bed
  #Count coverage
   echo "Calculating coverage of ${gene_name}."
   #samtools mpileup -f $FASTA -l $OutputDir/${gene_name}_gene_nochr.bed $BamToSearch > $OutputDir/${gene_name}_total_gene_coverage.txt                     #Uncomment  if  need overall gene coverage 
  samtools mpileup -Q 1 -f  $FASTA -l $OutputDir/${gene_name}_exons_nochr.bed $BamToSearch > $OutputDir/${gene_name}_total_exon_coverage.txt
   #echo "Coverage for complete gene:"                     																																					#Uncomment  if  need overall gene coverage 
   #echo "Total Reads		Average Coverage Depth"                   																											   		  		    #Uncomment  if  need overall gene coverage 
   #awk 'BEGIN{C=0}; {C=C+$4}; END{print C "\t" C/NR}' $OutputDir/${gene_name}_total_gene_coverage.txt                     #Uncomment  if  need overall gene coverage 
   echo "Coverage for coding exons and UTR's only:"
   echo "Total Reads		Average Coverage Depth"
   awk 'BEGIN{C=0}; {C=C+$4}; END{print C "\t" C/NR}' $OutputDir/${gene_name}_total_exon_coverage.txt
   report
echo "All files from this export can be found in $OutputDir"
done < $GeneList