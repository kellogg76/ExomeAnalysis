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
#GATK
GATK=~/GenomeAnalysisTK.jar

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

#MultiQC - Done in a Conda environment
#conda activate py3.6
#cd to directory and then 
#multiqc .

#Move QC Files to new dir
mkdir fastqc
mv *_fastqc* fastqc
}

GVCF2VCF(){
echo "***************"
echo "gvcf2vcf"
echo "***************"
#Convert gvcf from Terra.bio pipeilne to standard vcf
java -Xmx24g -jar $GATK -T GenotypeGVCFs -R $FASTA --variant $DataPath/$sample1.g.vcf.gz -o $DataPath/$sample1.vcf.gz

#Testing new GATK build
java -Xmx24g -jar $GATK GenotypeGVCFs -R /mnt/d/hg38/Homo_sapiens_assembly38.fasta --variant /mnt/d/FEVR101/Control.g.vcf.gz -O /mnt/d/FEVR101/Control.gatk4.vcf.gz
#if works then copy the new GATK to ~ and re run the workflow (SNPEFF, Gemini)

echo "...complete."
}

Filter(){
echo "Filering variants"
java -Xmx24g -jar $GATK -T VariantFiltration -R $FASTA --filterExpression "MQ0 > 50.0" --filterName "HighMQ0" --filterExpression "DP < 10.0" --filterName "LowDepth" --filterExpression "QUAL < 10.0" --filterName "LowQual" --filterExpression "MQ < 10.0" --filterName "LowMappingQual" --variant $DataPath/$sample1.vcf.gz -o $DataPath/$sample1.filtered.vcf

}

SNPEff(){
echo "***************"
echo " SNPEff "
echo "***************"
timestamp
#java -Xmx40g -jar $SNPEff GRCh38.86 $DataPath/$sample1.vcf > $DataPath/$sample1.snpEff.vcf
#java -Xmx40g -jar $SNPEff GRCh38.86 $DataPath/$sample1.filtered.vcf > $DataPath/$sample1.filtered.snpEff.vcf
java -Xmx40g -jar $SNPEff GRCh38.86 $DataPath/$sample1.gatk4.vcf.gz > $DataPath/$sample1.gatk4.snpEff.vcf
mv snpEff_genes.txt $DataPath/$RunCode.snpEff_genes.txt
mv snpEff_summary.html $DataPath/$RunCode.snpEff_summary.html
echo "...complete."
}

Gemini_db(){
echo "*************************"
echo "Gemini database creation"
echo "*************************"
timestamp
gemini load -v $DataPath/$sample1.snpEff.vcf -t snpEff --cores 8 $DataPath/$sample1.gemini.db
#gemini load -v $DataPath/$sample1.filtered.snpEff.vcf -t snpEff --cores 8 $DataPath/$sample1.filtered.gemini.db
echo "...complete."
}

Gemini_Export(){
echo "*************************"
echo "Outputting Gemini files"
echo "*************************"
timestamp
#Short Export
#Heterozygous
gemini query -q "select chrom, start, end, ref, alt, codon_change, aa_change, gene, transcript, biotype, impact, impact_severity, gerp_bp_score, aaf_exac_all, max_aaf_all, gnomad_num_het, gnomad_num_hom_alt, gnomad_num_chroms, in_omim, clinvar_sig, clinvar_disease_name, clinvar_gene_phenotype, qual, filter, depth, vcf_id, rs_ids,  (gts).(*) from variants where impact_severity != 'LOW' AND max_aaf_all < 0.01" --header --gt-filter "gt_types.$sample1 == HET" $DataPath/$sample1.gemini.db > $DataPath/$RunCode.het_med_high_rare.txt

#Non Homozygous
gemini query -q "select chrom, start, end, ref, alt, codon_change, aa_change, gene, transcript, biotype, impact, impact_severity, gerp_bp_score,  aaf_exac_all, max_aaf_all, gnomad_num_het, gnomad_num_hom_alt, gnomad_num_chroms, in_omim, clinvar_sig, clinvar_disease_name, clinvar_gene_phenotype, qual, filter, depth, vcf_id, rs_ids, (gts).(*) from variants where impact_severity != 'LOW' AND max_aaf_all < 0.01" --header --gt-filter "gt_types.$sample1 != HOM_REF" $DataPath/$sample1.gemini.db > $DataPath/$RunCode.non_hom_med_high_rare.txt

#Homozygous
gemini query -q "select chrom, start, end, ref, alt, codon_change, aa_change, gene, transcript, biotype, impact, impact_severity, gerp_bp_score,  aaf_exac_all, max_aaf_all, gnomad_num_het, gnomad_num_hom_alt, gnomad_num_chroms, in_omim, clinvar_sig, clinvar_disease_name, clinvar_gene_phenotype, qual, filter, depth, vcf_id, rs_ids,  (gts).(*) from variants where impact_severity != 'LOW' AND max_aaf_all < 0.01" --header --gt-filter "gt_types.$sample1 == HOM_ALT" $DataPath/$sample1.gemini.db > $DataPath/$RunCode.hom_alt_med_high_rare.txt
echo "...complete."
}

##########################
###Select which functions to run###
##########################
timestamp
#Exome_QC
#GVCF2VCF
######Filter ######Doesn't seem to do anything
SNPEff
#Gemini_db
#Gemini_Export