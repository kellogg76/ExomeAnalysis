###GATK4 Pipeline###
##Pre script instructions can be found here https://docs.google.com/spreadsheets/d/1cStts3pQTa07LA4DVCILJM_59--ZyKmNKc8O6DGpVhg/edit#gid=44310744 ###

#!/bin/bash

#Run Number
RunCode=FEVR101

#Enter sample name below
sample1=$1

###Paths to files###
#Linux Paths
ToolPath=~
DataPath=/mnt/d/$RunCode
TempPath=$DataPath/temp
mkdir -p $TempPath

#############
#      Tool Paths     #
#############
#SNPEff Path
SNPEff=$ToolPath/snpEff/snpEff.jar
#Fasta Path
FASTA=/mnt/d/hg38/Homo_sapiens_assembly38.fasta

#timestamp function
timestamp() {
date +"%Y-%m-%d %H:%M:%S"
}

Exome_QC(){
echo "***************"
echo "       Exome_QC      "
echo "***************"
#FastQC - needs to use latest version of java, so change if needed, and then change back to java 8
#sudo update-alternatives --config java
fastqc $DataPath/*.fastq.gz

#MultiQC
python3 -m multiqc .

#Move QC Files to new dir
mkdir fastqc
mv *_fastqc* fastqc
}

SNPEff(){
echo "***************"
echo "           SNPEff          "
echo "***************"
timestamp
java -Xmx40g -jar $SNPEff GRCh38.86 $DataPath/$sample1.g.vcf > $DataPath/$sample1.snpEff.vcf
mv snpEff_genes.txt $DataPath/$RunCode.snpEff_genes.txt
mv snpEff_summary.html $DataPath/$RunCode.snpEff_summary.html
echo "...complete."
}

Gemini_db(){
echo "*************************"
echo "   Gemini database creation   "
echo "*************************"
timestamp
gemini load -v $DataPath/$sample1.snpEff.vcf -t snpEff --cores 8 $DataPath/$sample1.gemini.db
echo "...complete."
}

Gemini_Export(){
echo "*************************"
echo "   Outputting Gemini files...    "
echo "*************************"
timestamp
#Short Export
#Heterozygous
gemini query -q "select chrom, start, end, ref, alt, codon_change, aa_change, gene, transcript, biotype, impact, impact_severity, gerp_bp_score, aaf_exac_all, max_aaf_all, gnomad_num_het, gnomad_num_hom_a$
#Non Homozygous
#gemini query -q "select chrom, start, end, ref, alt, codon_change, aa_change, gene, transcript, biotype, impact, impact_severity, gerp_bp_score,  aaf_exac_all, max_aaf_all, gnomad_num_het, gnomad_num_hom$
#Homozygous
#gemini query -q "select chrom, start, end, ref, alt, codon_change, aa_change, gene, transcript, biotype, impact, impact_severity, gerp_bp_score,  aaf_exac_all, max_aaf_all, gnomad_num_het, gnomad_num_hom$echo "...complete."
}

##########################
###Select which functions to run###
##########################
timestamp
Exome_QC
#SNPEff
#Gemini_db
#Gemini_Export