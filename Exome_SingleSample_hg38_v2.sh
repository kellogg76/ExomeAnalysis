#!/bin/bash

echo "***************"
echo "Mats Exome Pipeline"
echo "This pipeline uses hg38 for all analysis"
echo "***************"

#Run Number
RunCode=FEVRhg38_test

#Enter sample name below
sample1=2644

###Paths to files###
#Linux Paths
buildpath=/mnt/d/hg38
toolpath=~
runpath=/mnt/d/$RunCode
temppath=$runpath/temp
mkdir -p $temppath

############
#Tool Paths#
############
#Picard Path
PICARD=$toolpath/picard.jar
#SNPEff Path
SNPEff=$toolpath/snpEff/snpEff.jar
#GATK Path
GATK=$toolpath/GenomeAnalysisTK.jar

#############
#Build Paths#
#############
#dbSNP Path
dbSNP=$buildpath/dbsnp_146.hg38.vcf    ###Updated for hg38
#Fasta Path
FASTA=$buildpath/Homo_sapiens_assembly38.fasta    ###Updated for hg38
#CCDS Path
CCDS=$buildpath/hg38_v2_ccds.bed  #Seems to be working at the moment.
#Indels Path
INDELS=$buildpath/Mills_and_1000G_gold_standard.indels.hg38.vcf    ###Updated for hg38
#1000 Genomes Indels
G1000=$buildpath/1000G_phase1.snps.high_confidence.hg38.vcf    ###Updated for hg38

# timestamp function
timestamp() {
date +"%Y-%m-%d %H:%M:%S"
}

catenation(){
#Catenation
echo "Catenating: " $sample1
cat $runpath/$sample1\_S2_L001_R1_001.fastq.gz $runpath/$sample1\_S2_L002_R1_001.fastq.gz $runpath/$sample1\_S2_L003_R1_001.fastq.gz $runpath/$sample1\_S2_L004_R1_001.fastq.gz > $runpath/$sample1-R1.fastq.gz
cat $runpath/$sample1\_S2_L001_R2_001.fastq.gz $runpath/$sample1\_S2_L002_R2_001.fastq.gz $runpath/$sample1\_S2_L003_R2_001.fastq.gz $runpath/$sample1\_S2_L004_R2_001.fastq.gz > $runpath/$sample1-R2.fastq.gz

#Add code to delete the uncatenated files
echo "Deleting uncatenated files for: " $sample1
rm $runpath/$sample1\_S1_L001_R1_001.fastq.gz $runpath/$sample1\_S1_L002_R1_001.fastq.gz $runpath/$sample1\_S1_L003_R1_001.fastq.gz $runpath/$sample1\_S1_L004_R1_001.fastq.gz
rm $runpath/$sample1\_S1_L001_R2_001.fastq.gz $runpath/$sample1\_S1_L002_R2_001.fastq.gz $runpath/$sample1\_S1_L003_R2_001.fastq.gz $runpath/$sample1\_S1_L004_R2_001.fastq.gz
}

bwa_step(){
#BWA
echo "*******************************"
echo "*Processing Samples $sample1*"
echo "*******************************"
echo "***************"
echo "******BWA******"
echo "***************"
timestamp
echo "Recalibrating sample: " $sample1
bwa mem -t 7 -M -v 2 $FASTA $runpath/$sample1-R1.fastq.gz $runpath/$sample1-R2.fastq.gz | samtools view -u - | samtools sort -@ 7 -O bam -o $runpath/$sample1.bwa.sorted.bam -T $temppath/$sample1.bwa.sort.temp
}

read_groups(){
#Add Or Replace Read Groups
echo "************************"
echo "*AddOrReplaceReadGroups*"
timestamp
echo "************************"
echo "AddOrReplaceReadGroups sample: " $sample1
java -Xmx24g -jar $PICARD AddOrReplaceReadGroups INPUT=$runpath/$sample1.bwa.sorted.bam OUTPUT=$runpath/$sample1.rg.sorted.bam RGID=$sample1 RGSM=$sample1 RGLB=$sample1 RGPL=illumina RGPU=miseq

}

build_bam_index(){
#Build BAM Index
echo "*******************"
echo "***BuildBamIndex***"
echo "*******************"
timestamp
echo "BuildBamIndex sample: " $sample1
java -Xmx24g -jar $PICARD BuildBamIndex INPUT=$runpath/$sample1.rg.sorted.bam
}

mark_duplicates(){
#Mark Duplicates
echo "*********************"
echo "***Mark Duplicates***"
echo "*********************"
timestamp
echo "MarkDuplicates sample: " $sample1
java -Xmx24g -jar $PICARD MarkDuplicates CREATE_INDEX=true METRICS_FILE=$runpath/$sample1.dedup.metrics INPUT=$runpath/$sample1.rg.sorted.bam OUTPUT=$runpath/$sample1.dedup.sorted.bam
}

realigner1(){
#Realigner Target Creator
echo "****************************"
echo "***RealignerTargetCreator***"
echo "****************************"
timestamp
echo "RealignerTargetCreator sample: " $sample1
java -Xmx24g -jar $GATK -T RealignerTargetCreator -R $FASTA -I $runpath/$sample1.dedup.sorted.bam -o $runpath/$sample1.targets.intervals -known $INDELS -known $G1000 -nt 7
}

realigner2(){
#Indel Realigner
echo "********************"
echo "***IndelRealigner***"
echo "********************"
timestamp
echo "IndelRealigner sample: " $sample1
java -Xmx24g -jar $GATK -T IndelRealigner -R $FASTA -I $runpath/$sample1.dedup.sorted.bam -known $G1000 -known $INDELS -targetIntervals $runpath/$sample1.targets.intervals --read_filter NotPrimaryAlignment -o $runpath/$sample1.realigned.sorted.bam
}

recalibration(){
#Recalibration
echo "***************"
echo "Recalibration"
echo "***************"
timestamp
echo "Recalibrating sample: " $sample1
java -Xmx8g -jar $GATK -T BaseRecalibrator -R $FASTA -I $runpath/$sample1.realigned.sorted.bam -o $runpath/$sample1.recal --knownSites $dbSNP -nct 7
java -Xmx8g -jar $GATK -T PrintReads -R $FASTA -I $runpath/$sample1.realigned.sorted.bam -o $runpath/$sample1.recalibrated.sorted.bam -BQSR $runpath/$sample1.recal -nct 7
}

variant_calling(){
####hg38 fails here :- File associated with name /mnt/d/hg38/hg38_ccds.bed is malformed: Problem reading the interval file caused by Badly formed genome location: Contig chr1_KN196472v1_fix given as location, but this contig isn't present in the Fasta sequence dictionary
#Variant Calling & Annotations
echo "***************"
echo "Variant Calling & Annotations"
echo "***************"
timestamp
echo "Haplotype calling sample: " $sample1
java -Xmx40g -jar $GATK -T HaplotypeCaller -R $FASTA --dbsnp $dbSNP -I $runpath/$sample1.recalibrated.sorted.bam -L $CCDS --emitRefConfidence GVCF --variant_index_type LINEAR --variant_index_parameter 128000 -o $runpath/$sample1.haplotypecaller.g.vcf -nct 7
echo "Generating gVCF"
java -Xmx40g -jar $GATK -T GenotypeGVCFs -R $FASTA --variant $runpath/$sample1.haplotypecaller.g.vcf -o $runpath/$RunCode.haplotypecaller.vcf
echo "zless, sed etc"
zless $runpath/$RunCode.haplotypecaller.vcf | sed "s/ID=AD,Number=./ID=AD,Number=R/" | vt decompose -s - | vt normalize -r $FASTA - > $runpath/$RunCode.hc.normalized.vcf
echo "Variant annotator"
java -Xmx24g -jar $GATK -T VariantAnnotator -R $FASTA -nt 7 --group StandardAnnotation --dbsnp $dbSNP -I $runpath/$sample1.recalibrated.sorted.bam --variant $runpath/$RunCode.hc.normalized.vcf -L $runpath/$RunCode.hc.normalized.vcf -o $runpath/$RunCode.annotated.vcf
echo "Filering variants"
java -Xmx24g -jar $GATK -T VariantFiltration -R $FASTA --filterExpression "MQ0 > 50.0" --filterName "HighMQ0" --filterExpression "DP < 10.0" --filterName "LowDepth" --filterExpression "QUAL < 10.0" --filterName "LowQual" --filterExpression "MQ < 10.0" --filterName "LowMappingQual" --variant $runpath/$RunCode.annotated.vcf -o $runpath/$RunCode.filtered.vcf
echo "...complete."
}

SNPEff(){
#SNPEff
echo "***************"
echo "SNPEff"
echo "***************"
timestamp
java -Xmx40g -jar $SNPEff hg38 $runpath/$RunCode.filtered.vcf > $runpath/$RunCode.snpEff.vcf
mv snpEff_genes.txt $runpath/$RunCode.snpEff_genes.txt
mv snpEff_summary.html $runpath/$RunCode.snpEff_summary.html
echo "...complete."
}

Gemini_update(){
 #Gemini
 echo "***************"
 echo "Gemini updater"
 echo "***************"
timestamp
echo "attempting to update gemini..."
gemini update --dataonly --extra gerp_bp
echo "...complete."
}

Gemini_db(){
echo "***************"
echo "Gemini database creation"
echo "***************"
timestamp
gemini load -v $runpath/$RunCode.snpEff.vcf -t snpEff --cores 8 $runpath/$RunCode.gemini.db
echo "...complete."
}

Gemini_export(){
 #Output Gemini Files
echo "***************"
echo "Outputting Gemini files..."
echo "***************"
timestamp
#Short Export
#Heterozygous
gemini query -q "select chrom, start, end, ref, alt, codon_change, aa_change, gene, transcript, biotype, impact, impact_so, impact_severity, gerp_bp_score, in_omim, clinvar_sig, clinvar_disease_name, clinvar_origin, clinvar_gene_phenotype, is_conserved, cosmic_ids, qual, filter, depth, qual_depth, vcf_id, rs_ids,  (gts).(*) from variants where impact_severity != 'LOW' AND max_aaf_all < 0.01" --header --gt-filter "gt_types.$sample1 == HET " $runpath/$RunCode.gemini.db > $runpath/$RunCode.het_med_high_rare.txt

#Non Homozygous
gemini query -q "select chrom, start, end, ref, alt, codon_change, aa_change, gene, transcript, biotype, impact, impact_so, impact_severity, gerp_bp_score, in_omim, clinvar_sig, clinvar_disease_name, clinvar_origin, clinvar_gene_phenotype, geno2mp_hpo_ct, is_conserved, cosmic_ids, qual, filter, depth, vcf_id, rs_ids, (gts).(*) from variants where impact_severity != 'LOW' AND max_aaf_all < 0.01" --header --gt-filter "gt_types.$sample1 != HOM_REF" $runpath/$RunCode.gemini.db > $runpath/$RunCode.non_hom_med_high_rare.txt

#Homozygous
gemini query -q "select chrom, start, end, ref, alt, codon_change, aa_change, gene, transcript, biotype, impact, impact_so, impact_severity, gerp_bp_score, in_omim, clinvar_sig, clinvar_disease_name, clinvar_origin, clinvar_gene_phenotype, is_conserved, cosmic_ids, qual, filter, depth, qual_depth, vcf_id, rs_ids,  (gts).(*) from variants where impact_severity != 'LOW' AND max_aaf_all < 0.01" --header --gt-filter "gt_types.$sample1 == HOM_ALT" $runpath/$RunCode.gemini.db > $runpath/$RunCode.hom_alt_med_high_rare.txt
echo "...complete."
}

coverage(){
 #Calculating exome coverage
 echo "***************"
 echo "Calculating exome coverage"
 echo "***************"
timestamp
echo "Calculating coverage:  " $sample1
#Perform calculation & export
java -Xmx24g -jar picard.jar CollectHsMetrics I=$runpath/$sample1.recalibrated.sorted.bam O=$runpath/$sample1.collect_hs_metrics.txt R=$FASTA BAIT_INTERVALS=$buildpath/truseq-exome-targeted-regions-manifest-v1-2_hg38.interval_list TARGET_INTERVALS=$buildpath/truseq-exome-targeted-regions-manifest-v1-2_hg38.interval_list
}

vep(){
 #VEP###Doesn't work yet, needs hg38?
 echo "***************"
 echo "Variant Effect Predictor"
 echo "***************"
timestamp
perl variant_effect_predictor.pl -i example.vcf \
    --cache \
    --sift b \
    --polyphen b \
    --symbol \
    --numbers \
    --biotype \
    --total_length \
    -o output \
    --vcf \
    --fields Consequence,Codons,Amino_acids,Gene,SYMBOL,Feature,EXON,PolyPhen,SIFT,Protein_position,BIOTYPE
}

specific_coverage(){
#The coverage of a specific region as defined by the PI
#Count the total and averaged coverage 
samtools mpileup -r 'chr1:1,958,700-1,958,907' $runpath/$sample1.realigned.sorted.bam | awk 'BEGIN{C=0}; {C=C+$4}; END{print C "\t" C/NR}'
}

exomiser(){
java -Xms2g -Xmx4g -jar ~/exomiser-cli-11.0.0/exomiser-cli-11.0.0.jar --analysis /mnt/d/$RunCode/$sample1.yml
}

##########################
###Select which functions to run###
##########################
timestamp
#catenation
#bwa_step
#read_groups
#build_bam_index
#mark_duplicates
#realigner1
#realigner2
#recalibration
#variant_calling
#SNPEff
#Gemini_update
#Gemini_db
#Gemini_export
#coverage 
######vep              ###Not working yet
#specific_coverage

#Generate Report Files
echo "***************"
echo "Outputting Report files..."
echo "***************"
timestamp
 
report_header(){
 #Export nohup.out to text file
 printf "%b\n" "The following report was generated by Mat Nightingale at the Dalhousie Genomics Core, all analysis was done using Human Genome hg38." \
 "If anything is unclear contact Genomics@dal.com" \
 "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" \ > $temppath/Pipeline_Commands.txt
}

report_subscript(){
 printf "%b\n" "Files included with this report :-\n" \
"FASTQ Files are the raw data" \
"$sample1-R1.fastq.qz & $sample1-R2.fastq.qz\n" \
"VCF Files can be imported into Excel or loaded into the IGV Browser" \
"$RunCode.annotated.vcf contains all the annotated variants before filtering." \
"$RunCode.filtered.vcf contains all the variants that pass filtering (low depth, low quality and low mapping quality reads are filtered out)." \
"$RunCode.snpEff.vcf calculates the effects the variants produce on known genes (e.g. amino acid changes).\n" \
"Gemini database files which can be queried by the user (see https://gemini.readthedocs.io/en/latest/index.html for more details).\n"\
"$RunCode.db\n" \
"Various text files detailing the variants found." \
"$RunCode.non_hom_med_high_rare.txt contains all variants that are non homozygous, medium or high risk and rare (<1% max. alt. allele frequency)." \
"$RunCode.het_med_high_rare.txt is contains all variants that are heterozygous, medium or high risk and rare (<1% max. alt. allele frequency)." \
"$RunCode.hom_alt_med_high_rare.txt contains all variants that are homozygous for the alternate allele, medium or high risk and rare (<1% max. alt. allele frequency).\n" \
"BAM files can loaded into the IGV Browser and show the individual reads, and the areas covered by this data." \
"$sample1.recalibrated.sorted.bam\n" \
"If requested, the Exomiser prioritization tool was run using the phenotype ontology terms provided by the user. This tool outputs several files including gene lists and variants files for multiple inheritance patterns (AD, AR, MT, XD and XR) and an HTML file for easy viewing in a web browser.\n" \
"If other exports are required please let me know.\n" \
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" > $temppath/Report_Header.txt
}

variant_count(){
 #How many variants?
 printf   "%b"\
"Total variants seen in this analysis after filtering out poor quality & low coverage reads :-\n" > $temppath/Variant_total.txt
gemini query -q 'select count(*) from variants' --header $runpath/$RunCode.gemini.db >> $temppath/Variant_total.txt
}

snp_indel_count(){
#How many SNPs and INDELs?
printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"\
"Total SNPs and INDELs seen in this analysis after filtering out poor quality & low coverage reads :-" > $temppath/SNP_Indel.txt
gemini query -q 'select type,count(*) from variants group by type' --header $runpath/$RunCode.gemini.db >> $temppath/SNP_Indel.txt
}

severity(){
#The impact severity of the variants
printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"\
"Severity of the variants seen in this analysis :-" > $temppath/Severity.txt
gemini query -q 'select impact_severity,count(*) from variants group by impact_severity' --header $runpath/$RunCode.gemini.db >> $temppath/Severity.txt
}

clinvar_variants(){
#How many variants are in ClinVar and what are their annotations
printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"\
"How many variants are in ClinVar and what are their annotations :-" > $temppath/ClinVar.txt
gemini query -q 'select clinvar_sig,count(*) from variants group by clinvar_sig' --header $runpath/$RunCode.gemini.db >> $temppath/ClinVar.txt
}

clinvar_pathogenic(){
#Find variants that are listed as pathogenic in ClinVar
printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"\
"Pathogenic ClinVar entries seen in this data :-" > $temppath/PathogenicClinVar.txt
gemini query -q 'select chrom, start, end, ref, alt, codon_change, aa_change, gene, transcript, biotype, impact, impact_so, impact_severity, gerp_bp_score, in_omim, clinvar_sig, clinvar_disease_name, clinvar_origin, clinvar_gene_phenotype, is_conserved, cosmic_ids, qual, filter, depth, qual_depth, vcf_id, rs_ids, clinvar_disease_name from variants where clinvar_sig like "%pathogenic%"' --header $runpath/$RunCode.gemini.db >> $temppath/PathogenicClinVar.txt

}

clinvar_keyword(){
#Find variants that are listed  with a keyword in ClinVar
printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"\
"ClinVar entries matching the keyword 'Retinopathy' seen in this data after filtering out poor quality & low coverage reads :-" > $temppath/KeywordClinVar.txt
gemini query -q 'select chrom,start,end,ref,alt,gene,depth,clinvar_disease_name from variants where clinvar_disease_name like "%Retinopathy%"' --header $runpath/$RunCode.gemini.db >> $temppath/KeywordClinVar.txt
}

gemini_results(){
#How many variants are left after filtering in Gemini
printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"\
"How many rare (<1% max. alt. allele frequency) variants remain after filtering for heterozygous variants that have a medium or high impact severity :-" > $temppath/gemini_results_count.txt
wc -l $runpath/$RunCode.het_med_high_rare.txt | awk '{ print $1 -1}' >> $temppath/gemini_results_count.txt

printf  "%b\n" "How many rare (<1% max. alt. allele frequency) variants remain after filtering for non homozygous variants that have a medium or high impact severity :-" >> $temppath/gemini_results_count.txt
wc -l $runpath/$RunCode.non_hom_med_high_rare.txt | awk '{ print $1 -1}' >> $temppath/gemini_results_count.txt

printf  "%b\n" "How many rare (<1% max. alt. allele frequency) variants remain after filtering for homozygous alternate allele variants that have a medium or high impact severity :-" >> $temppath/gemini_results_count.txt
wc -l $runpath/$RunCode.hom_alt_med_high_rare.txt | awk '{ print $1 -1}' >> $temppath/gemini_results_count.txt
}

key_genes(){
#Search for key genes
key_genes=$(<$runpath/gene_list.txt)

printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"\
"Genes associated with this project are :-\n"\
"$key_genes\n\n"\
"Which genes are in the final variants list after filtering for rare (<1% max. alt. allele frequency) heterozygous variants that have a medium or high impact severity :-" > $temppath/key_genes.txt
grep -m1 "" $runpath/$RunCode.het_med_high_rare.txt >>$temppath/key_genes.txt
ps -ef | egrep -wi "$key_genes" $runpath/$RunCode.het_med_high_rare.txt >> $temppath/key_genes.txt

printf  "%b\n" >> $temppath/key_genes.txt
printf  "%b\n" "Which genes are in the final variants list after filtering for rare (<1% max. alt. allele frequency) non homozygous variants that have a medium or high impact severity :-" >> $temppath/key_genes.txt
grep -m1 "" $runpath/$RunCode.non_hom_med_high_rare.txt >>$temppath/key_genes.txt
ps -ef | egrep -wi "$key_genes" $runpath/$RunCode.non_hom_med_high_rare.txt >>$temppath/key_genes.txt

printf  "%b\n" >> $temppath/key_genes.txt
printf  "%b\n" "Which genes are in the final variants list after filtering for rare (<1% max. alt. allele frequency) homozygous variants that have a medium or high impact severity :-" >> $temppath/key_genes.txt
grep -m1 "" $runpath/$RunCode.non_hom_med_high_rare.txt >>$temppath/key_genes.txt
ps -ef | egrep -wi "$key_genes" $runpath/$RunCode.hom_alt_med_high_rare.txt >> $temppath/key_genes.txt
}

exomiser(){
#Exomiser data goes here
printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"\
"See the separate output files for the Exomiser gene prioritization data." > $temppath/exomiser.txt
}

report_supplemental(){
 printf "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"\
 "Supplemental information \n" \
"Methodology :-" \
"Exome Capture: Standard manufacturer protocols were followed to perform target capture with the Illumina Nextera DNA Exome kit. Sequencing is done with 150bp paired-end reads on Illumina NextSeq." \
"The Illumina Nextera DNA Exome kit is designed to produce at least 50x coverage.\n" \
"Data analysis :-" \
"Raw reads are aligned to hg19 with BWA 0.7.12 and indel realignment and base calibration are performed using the GATK 3.7.0. Duplicate reads are marked with Picard 2.19.1 and exlcuded from further analysis." \
"Single nucleotide variants and short insertions and deletions are called using SAMtools 1.9 and BCFtools 1.9 and then filtered by the removal of low sequencing depth, low mapping quality and low quality variants." \
"Variants are annotated using SNPEff 4.3 to identify the effects on known genes, and also if previously seen in dbSNP138 or the 1000 genomes dataset.\n" \
"Test Limitations :-" \
"Illumina Nextera DNA Exome Kit is designed to capture exons annotated by the Consensus Coding Sequence (CCDS) coding regions, however not all exons are captured equally.\n"\
"This can result in some regions which are under represented. Sequence variation in an individual may result in poor or biased allele-specific enrichment and sequence coverage \n"\
"below the threshold resulting in failure to detect a mutation. "\
"This capture kit does not target the mitochondrial genome." > $temppath/Report_Supplemental.txt
}

prediction_scores(){
 #DOESN'T CURRENTLY WORK
 #What are the PolyPhen, SIFT, and CADD scores of any Retinopathy variants?-Maybe change this to get scores for only FEVR associated genes????
 gemini query -q 'select polyphen_score,sift_score,cadd_scaled from variants where clinvar_disease_name == "Retinopathy"' --header $runpath/$RunCode.gemini.db > $temppath/scores1.txt
 sed '1 i PolyPhen, SIFT, and CADD scores for any ClinVar results.' $temppath/scores1.txt > $temppath/scores2.txt
 sed '$ a\ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ' $temppath/scores2.txt > $temppath/Scores.txt

 #How do these scores compare to the rest of the variants in the VCF file?
 gemini query -q 'select polyphen_score,sift_score,cadd_scaled from variants' --header ~/LinuxShare/$RunCode/$RunCode.db > $RunCode/report_scores.tsv

 ###
 echo "Don't forget to run the report_score.tsv through the R script next."
 ###
}

exome_coverage(){
#What was the exome coverage
printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"\
"Fraction of Bases covered at 1x, 2x, 10x, 20x, 30x, 50x, 100x, mean , median, max, zero  \n" \
"Sample: $sample1 = \n"> $temppath/exome_coverage.txt
}

#########################
###Select which reports to run###
#########################
report_header
variant_count
snp_indel_count
severity
clinvar_variants
clinvar_pathogenic
####################prediction_scores -DOESN'T CURRENTLY WORK
exome_coverage
clinvar_keyword
gemini_results
key_genes
report_subscript
report_supplemental

#Merge text reports
cat $temppath/Pipeline_Commands.txt $temppath/Report_Header.txt $temppath/Variant_total.txt $temppath/SNP_Indel.txt $temppath/Severity.txt $temppath/ClinVar.txt $temppath/PathogenicClinVar.txt  $temppath/KeywordClinVar.txt $temppath/gemini_results_count.txt $temppath/key_genes.txt $temppath/exome_coverage.txt $temppath/exomiser.txt $temppath/Report_Supplemental.txt > $runpath/$RunCode.Report.txt

echo "Finished."
timestamp

#Things to add
#See if removal of  Realigner Target Creator & Indel Realigner affects outcome, gatk says they can be removed if using HaplotypeCaller -CAN BE DONE BUT IS NO FASTER.
#See if removal of  --variant_index_parameter & --variant_index_type can be removed as per GATK
#Add report exports to functions so they write as pipeline progresses and reduces the number of lines of code?