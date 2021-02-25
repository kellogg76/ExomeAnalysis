#!/bin/bash

#Command to run this script is ./Exome_ThreeSamples_hg19_v2.sh sample1 sample2 sample3
#eg ./Exome_ThreeSamples_hg19_v2.sh 549 F10-018 2644

<<to_add
Add ability to call coding_coverage.sh and then Coverage_plot.R script
See if removal of  Realigner Target Creator & Indel Realigner affects outcome, gatk says they can be removed if using HaplotypeCaller -CAN BE DONE BUT IS NO FASTER.
See if removal of  --variant_index_parameter & --variant_index_type can be removed as per GATK
Add report exports to functions so they write as pipeline progresses and reduces the number of lines of code?
to_add

echo "***************"
echo "Mats Exome Pipeline"
echo "This pipeline uses hg19 for all analysis"
echo "***************"

#Run Number
RunCode=FEVR18

#Enter sample names below
sample1=$1
sample2=$2
sample3=$3
sample4=$4
sample5=$5
sample1=$6
sample2=$7
sample3=$8
sample4=$9
sample5=$10

###Paths to files###
#Linux Paths
hg19_BuildPath=/mnt/d/hg19
ToolPath=~
DataPath=/mnt/d/$RunCode
TempPath=$DataPath/temp
mkdir -p $TempPath

#Copy Latest FEVR Gene List
cp /mnt/d/JR_gene_list.txt /$DataPath/FEVR_gene_list.txt
GeneList=/$DataPath/FEVR_gene_list.txt

############
#Tool Paths#
############
#Picard Path
PICARD=$ToolPath/picard.jar
#SNPEff Path
SNPEff=$ToolPath/snpEff/snpEff.jar
#GATK Path
GATK=$ToolPath/GenomeAnalysisTK.jar

#############
#Build Paths#
#############
#dbSNP Path
dbSNP=$hg19_BuildPath/dbsnp_138.b37.vcf
#Fasta Path
FASTA=$hg19_BuildPath/human_g1k_v37.fasta
#CCDS Path
CCDS=$hg19_BuildPath/ccds_hg19.bed
#Indels Path
INDELS=$hg19_BuildPath/Mills_and_1000G_gold_standard.indels.b37.vcf
#1000 Genomes Indels
G1000=$hg19_BuildPath/1000G_phase1.indels.b37.vcf

# timestamp function
timestamp() {
date +"%Y-%m-%d %H:%M:%S"
 #Timestamp
 printf   "%b"\
"$Runcode Analysis Started.\n" > $TempPath/Pipeline_Commands.txt
}



Variant_Calling(){
#Variant Calling & Annotations
echo "***************"
echo "Variant Calling & Annotations"
echo "***************"
timestamp
echo "Haplotype calling sample: " $sample1
java -Xmx40g -jar $GATK -T HaplotypeCaller -R $FASTA --dbsnp $dbSNP -I $DataPath/$sample1.recalibrated.sorted.bam -L $CCDS --emitRefConfidence GVCF --variant_index_type LINEAR --variant_index_parameter 128000 -o $DataPath/$sample1.haplotypecaller.g.vcf -nct 7
echo "Haplotype calling sample: " $sample2
java -Xmx40g -jar $GATK -T HaplotypeCaller -R $FASTA --dbsnp $dbSNP -I $DataPath/$sample2.recalibrated.sorted.bam -L $CCDS --emitRefConfidence GVCF --variant_index_type LINEAR --variant_index_parameter 128000 -o $DataPath/$sample2.haplotypecaller.g.vcf -nct 7
echo "Haplotype calling sample: " $sample3
java -Xmx40g -jar $GATK -T HaplotypeCaller -R $FASTA --dbsnp $dbSNP -I $DataPath/$sample3.recalibrated.sorted.bam -L $CCDS --emitRefConfidence GVCF --variant_index_type LINEAR --variant_index_parameter 128000 -o $DataPath/$sample3.haplotypecaller.g.vcf -nct 7
echo "Haplotype calling sample: " $sample4
java -Xmx40g -jar $GATK -T HaplotypeCaller -R $FASTA --dbsnp $dbSNP -I $DataPath/$sample4.recalibrated.sorted.bam -L $CCDS --emitRefConfidence GVCF --variant_index_type LINEAR --variant_index_parameter 128000 -o $DataPath/$sample4.haplotypecaller.g.vcf -nct 7
echo "Haplotype calling sample: " $sample5
java -Xmx40g -jar $GATK -T HaplotypeCaller -R $FASTA --dbsnp $dbSNP -I $DataPath/$sample5.recalibrated.sorted.bam -L $CCDS --emitRefConfidence GVCF --variant_index_type LINEAR --variant_index_parameter 128000 -o $DataPath/$sample5.haplotypecaller.g.vcf -nct 7
echo "Haplotype calling sample: " $sample6
java -Xmx40g -jar $GATK -T HaplotypeCaller -R $FASTA --dbsnp $dbSNP -I $DataPath/$sample6.recalibrated.sorted.bam -L $CCDS --emitRefConfidence GVCF --variant_index_type LINEAR --variant_index_parameter 128000 -o $DataPath/$sample6.haplotypecaller.g.vcf -nct 7
echo "Haplotype calling sample: " $sample7
java -Xmx40g -jar $GATK -T HaplotypeCaller -R $FASTA --dbsnp $dbSNP -I $DataPath/$sample7.recalibrated.sorted.bam -L $CCDS --emitRefConfidence GVCF --variant_index_type LINEAR --variant_index_parameter 128000 -o $DataPath/$sample7.haplotypecaller.g.vcf -nct 7
echo "Haplotype calling sample: " $sample8
java -Xmx40g -jar $GATK -T HaplotypeCaller -R $FASTA --dbsnp $dbSNP -I $DataPath/$sample8.recalibrated.sorted.bam -L $CCDS --emitRefConfidence GVCF --variant_index_type LINEAR --variant_index_parameter 128000 -o $DataPath/$sample8.haplotypecaller.g.vcf -nct 7
echo "Haplotype calling sample: " $sample9
java -Xmx40g -jar $GATK -T HaplotypeCaller -R $FASTA --dbsnp $dbSNP -I $DataPath/$sample9.recalibrated.sorted.bam -L $CCDS --emitRefConfidence GVCF --variant_index_type LINEAR --variant_index_parameter 128000 -o $DataPath/$sample9.haplotypecaller.g.vcf -nct 7
echo "Haplotype calling sample: " $sample10
java -Xmx40g -jar $GATK -T HaplotypeCaller -R $FASTA --dbsnp $dbSNP -I $DataPath/$sample10.recalibrated.sorted.bam -L $CCDS --emitRefConfidence GVCF --variant_index_type LINEAR --variant_index_parameter 128000 -o $DataPath/$sample10.haplotypecaller.g.vcf -nct 7



echo "Generating gVCF"
java -Xmx40g -jar $GATK -T GenotypeGVCFs -R $FASTA --variant $DataPath/$sample1.haplotypecaller.g.vcf --variant $DataPath/$sample2.haplotypecaller.g.vcf --variant $DataPath/$sample3.haplotypecaller.g.vcf  --variant $DataPath/$sample4.haplotypecaller.g.vcf  --variant $DataPath/$sample5.haplotypecaller.g.vcf  --variant $DataPath/$sample6.haplotypecaller.g.vcf --variant $DataPath/$sample7.haplotypecaller.g.vcf  --variant $DataPath/$sample8.haplotypecaller.g.vcf --variant $DataPath/$sample9.haplotypecaller.g.vcf  --variant $DataPath/$sample10.haplotypecaller.g.vcf -o $DataPath/$RunCode.haplotypecaller.vcf


echo "zless, sed etc"
zless $DataPath/$RunCode.haplotypecaller.vcf | sed "s/ID=AD,Number=./ID=AD,Number=R/" | vt decompose -s - | vt normalize -r $FASTA - > $DataPath/$RunCode.hc.normalized.vcf
echo "Variant annotator"
java -Xmx24g -jar $GATK -T VariantAnnotator -R $FASTA -nt 7 --group StandardAnnotation --dbsnp $dbSNP -I $DataPath/$sample1.recalibrated.sorted.bam -I $DataPath/$sample2.recalibrated.sorted.bam -I $DataPath/$sample3.recalibrated.sorted.bam --variant $DataPath/$RunCode.hc.normalized.vcf -L $DataPath/$RunCode.hc.normalized.vcf -o $DataPath/$RunCode.annotated.vcf
echo "Filering variants"
java -Xmx24g -jar $GATK -T VariantFiltration -R $FASTA --filterExpression "MQ0 > 50.0" --filterName "HighMQ0" --filterExpression "DP < 10.0" --filterName "LowDepth" --filterExpression "QUAL < 10.0" --filterName "LowQual" --filterExpression "MQ < 10.0" --filterName "LowMappingQual" --variant $DataPath/$RunCode.annotated.vcf -o $DataPath/$RunCode.filtered.vcf
echo "...complete."
}

SNPEff(){
#SNPEff
echo "***************"
echo "SNPEff"
echo "***************"
timestamp
java -Xmx40g -jar $SNPEff GRCh37.75 $DataPath/$RunCode.filtered.vcf > $DataPath/$RunCode.snpEff.vcf
mv snpEff_genes.txt $DataPath/$RunCode.snpEff_genes.txt
mv snpEff_summary.html $DataPath/$RunCode.snpEff_summary.html
echo "...complete."
}

Gemini_Update(){
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
gemini load -v $DataPath/$RunCode.snpEff.vcf -t snpEff --cores 8 $DataPath/$RunCode.gemini.db
echo "...complete."
}

Gemini_Export(){
 #Output Gemini Files
echo "***************"
echo "Outputting Gemini files..."
echo "***************"
timestamp
#Short Export
#Heterozygous
gemini query -q "select chrom, start, end, ref, alt, codon_change, aa_change, gene, transcript, biotype, impact, impact_Severity, gerp_bp_score, aaf_exac_all, max_aaf_all, gnomad_num_het, gnomad_num_hom_alt, gnomad_num_chroms, in_omim, clinvar_sig, clinvar_disease_name, clinvar_gene_phenotype, qual, filter, depth, vcf_id, rs_ids,  (gts).(*) from variants where impact_Severity != 'LOW' AND max_aaf_all < 0.01" --header --gt-filter "gt_types.$sample1 == HET OR gt_types.$sample2 == HET OR gt_types.$sample3 == HET" $DataPath/$RunCode.gemini.db > $DataPath/$RunCode.het_med_high_rare.txt

#Non Homozygous
gemini query -q "select chrom, start, end, ref, alt, codon_change, aa_change, gene, transcript, biotype, impact, impact_Severity, gerp_bp_score, aaf_exac_all, max_aaf_all, gnomad_num_het, gnomad_num_hom_alt, gnomad_num_chroms, in_omim, clinvar_sig, clinvar_disease_name, clinvar_gene_phenotype, qual, filter, depth, vcf_id, rs_ids, (gts).(*) from variants where impact_Severity != 'LOW' AND max_aaf_all < 0.01" --header --gt-filter "gt_types.$sample1 != HOM_REF OR gt_types.$sample2 != HOM_REF OR gt_types.$sample3 != HOM_REF" $DataPath/$RunCode.gemini.db > $DataPath/$RunCode.non_hom_med_high_rare.txt

#Homozygous Alt
gemini query -q "select chrom, start, end, ref, alt, codon_change, aa_change, gene, transcript, biotype, impact, impact_Severity, gerp_bp_score, aaf_exac_all, max_aaf_all, gnomad_num_het, gnomad_num_hom_alt, gnomad_num_chroms, in_omim, clinvar_sig, clinvar_disease_name, clinvar_gene_phenotype, qual, filter, depth, vcf_id, rs_ids,  (gts).(*) from variants where impact_Severity != 'LOW' AND max_aaf_all < 0.01" --header --gt-filter "gt_types.$sample1 == HOM_ALT OR gt_types.$sample2 == HOM_ALT OR gt_types.$sample3 == HOM_ALT" $DataPath/$RunCode.gemini.db > $DataPath/$RunCode.hom_alt_med_high_rare.txt
echo "...complete."

#Testing
#gemini query -q "select chrom, start, end, ref, alt, codon_change, aa_change, gene, transcript, biotype, impact, impact_so, impact_Severity, gerp_bp_score, in_omim, clinvar_sig, clinvar_disease_name, clinvar_origin, clinvar_gene_phenotype, is_conserved, cosmic_ids, qual, filter, depth, qual_depth, vcf_id, rs_ids,  (gts).(*) from variants where impact_Severity != 'LOW' AND max_aaf_all < 0.01" --header --gt-filter "gt_types.2644 == HOM_ALT OR gt_types.F10-025 == HOM_ALT OR gt_types.F10-021 == HOM_ALT" /mnt/d/p35_FEVR_Batch001.db > /mnt/d/FEVR1.hom_alt_med_high_rare.txt
}

Coverage(){
 #Calculating exome coverage
 echo "***************"
 echo "Calculating exome coverage"
 echo "***************"
timestamp
echo "Calculating coverage:  " $sample1
#Perform calculation & export
java -Xmx24g -jar picard.jar CollectHsMetrics I=$DataPath/$sample1.recalibrated.sorted.bam O=$DataPath/$sample1.collect_hs_metrics.txt R=$FASTA BAIT_INTERVALS=$hg19_BuildPath/TruSeq_exome_targeted_regions.hg19.list.interval_list TARGET_INTERVALS=$hg19_BuildPath/TruSeq_exome_targeted_regions.hg19.list.interval_list

echo "Calculating coverage:  " $sample2
#Perform calculation & export
java -Xmx24g -jar picard.jar CollectHsMetrics I=$DataPath/$sample2.recalibrated.sorted.bam O=$DataPath/$sample2.collect_hs_metrics.txt R=$FASTA BAIT_INTERVALS=$hg19_BuildPath/TruSeq_exome_targeted_regions.hg19.list.interval_list TARGET_INTERVALS=$hg19_BuildPath/TruSeq_exome_targeted_regions.hg19.list.interval_list

echo "Calculating coverage:  " $sample3
#Perform calculation & export
java -Xmx24g -jar picard.jar CollectHsMetrics I=$DataPath/$sample3.recalibrated.sorted.bam O=$DataPath/$sample3.collect_hs_metrics.txt R=$FASTA BAIT_INTERVALS=$hg19_BuildPath/TruSeq_exome_targeted_regions.hg19.list.interval_list TARGET_INTERVALS=$hg19_BuildPath/TruSeq_exome_targeted_regions.hg19.list.interval_list
}

VEP(){
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

Exomiser(){
#Data location https://data.monarchinitiative.org/exomiser/data/
java -Xms2g -Xmx4g -jar ~/exomiser-cli-11.0.0/exomiser-cli-11.0.0.jar --analysis /mnt/d/$RunCode/$sample1.yml
java -Xms2g -Xmx4g -jar ~/exomiser-cli-11.0.0/exomiser-cli-11.0.0.jar --analysis /mnt/d/$RunCode/$sample2.yml
java -Xms2g -Xmx4g -jar ~/exomiser-cli-11.0.0/exomiser-cli-11.0.0.jar --analysis /mnt/d/$RunCode/$sample3.yml
}

Manta(){
#Run Manta Structural Variant Caller v1.6.0 for 
~/manta1.6.0/bin/configManta.py --bam $DataPath/$sample1.recalibrated.sorted.bam --referenceFasta $FASTA --runDir $DataPath/manta/$sample1 --exome
python $DataPath/manta/runWorkflow.py

~/manta1.6.0/bin/configManta.py --bam $DataPath/$sample2.recalibrated.sorted.bam --referenceFasta $FASTA --runDir $DataPath/manta/$sample2 --exome
python $DataPath/manta/runWorkflow.py

~/manta1.6.0/bin/configManta.py --bam $DataPath/$sample3.recalibrated.sorted.bam --referenceFasta $FASTA --runDir $DataPath/manta/$sample3 --exome
python $DataPath/manta/runWorkflow.py
}

Specific_Coverage(){
#The coverage of a specific region as defined by the PI
#Count the total and averaged coverage 
samtools mpileup -r 'chr1:1,958,700-1,958,907' $DataPath/$sample1.realigned.sorted.bam | awk 'BEGIN{C=0}; {C=C+$4}; END{print C "\t" C/NR}'
}

Merge_FEVR_Files(){ 
#Rename  previous combined files for posterity
echo "Backing up master files..."
cp $hg19_BuildPath/FEVR.combined.vcf.gz $hg19_BuildPath/FEVR.combined_`date +"%Y-%m-%d"`.vcf.gz
cp $hg19_BuildPath/FEVR.combined.gemini.db $hg19_BuildPath/FEVR.combined.gemini_`date +"%Y-%m-%d"`.db

#Merge VCF’s (VCF must be zipped)
echo "Zipping snpEff VCF file"
bgzip $DataPath/$RunCode.snpEff.vcf
echo "Indexing..."
bcftools index $DataPath/$RunCode.snpEff.vcf.gz
bcftools index $hg19_BuildPath/FEVR.combined.vcf.gz
echo "Merging..."
bcftools merge -m id $DataPath/$RunCode.snpEff.vcf.gz $hg19_BuildPath/FEVR.combined.vcf.gz > $hg19_BuildPath/FEVR.combined.vcf.gz

#Convert merged VCF into Gemini DB
echo "Converting VCF to Gemini db..."
gemini load -v $hg19_BuildPath/FEVR.combined.vcf.gz -t snpEff --cores 8 $hg19_BuildPath/FEVR.combined.gemini.db
} 

Files_To_Backup(){
#Copy files to backup into a new folder to make life easier
mkdir /mnt/d/$RunCode/To_Backup/

#FASTQ
cp /mnt/d/$RunCode/*.fastq.gz /mnt/d/$RunCode/To_Backup/

#VCF's
cp /mnt/d/$RunCode/$RunCode.snpEff.vcf /mnt/d/$RunCode/To_Backup/
cp /mnt/d/$RunCode/$RunCode.snpEff.vcf.gz /mnt/d/$RunCode/To_Backup/
cp /mnt/d/$RunCode/$RunCode.snpEff.vcf.gz.gbi /mnt/d/$RunCode/To_Backup/

#Bam's
cp /mnt/d/$RunCode/*.recalibrated.sorted.bam /mnt/d/$RunCode/To_Backup/
cp /mnt/d/$RunCode/*recalibrated.sorted.bai /mnt/d/$RunCode/To_Backup/

#Text files
cp /mnt/d/$RunCode/$RunCode.hom_alt_med_high_rare.txt /mnt/d/$RunCode/To_Backup/
cp /mnt/d/$RunCode/$RunCode.non_hom_med_high_rare.txt /mnt/d/$RunCode/To_Backup/
cp /mnt/d/$RunCode/$RunCode.het_med_high_rare.txt /mnt/d/$RunCode/To_Backup/

#Gemini_DB
cp /mnt/d/$RunCode/*.db /mnt/d/$RunCode/To_Backup/
}

FEVR_Email_Export(){
 #Output FEVR Email Files
echo "***************"
echo "Outputting FEVR files..."
echo "***************"
timestamp
dos2unix $GeneList

#Heterozygous
#Sample 1
gemini query -q "select  gene, codon_change, aa_change, rs_ids, max_aaf_all, aaf_exac_all, gerp_bp_score, gts.$sample1 from variants where impact_Severity != 'LOW' AND max_aaf_all < 0.01" --header --gt-filter "gt_types.$sample1 == HET " $DataPath/$RunCode.gemini.db > $TempPath/$RunCode.FEVR1_all_hets.txt
#Now extract only genes in $GeneList
grep -w -f  $GeneList $TempPath/$RunCode.FEVR1_all_hets.txt >> $TempPath/FEVR1_email_hets.txt
#Sample 2
gemini query -q "select  gene, codon_change, aa_change, rs_ids, max_aaf_all, aaf_exac_all, gerp_bp_score, gts.$sample2 from variants where impact_Severity != 'LOW' AND max_aaf_all < 0.01" --header --gt-filter "gt_types.$sample2 == HET " $DataPath/$RunCode.gemini.db > $TempPath/$RunCode.FEVR2_all_hets.txt
#Now extract only genes in $GeneList
grep -w -f  $GeneList $TempPath/$RunCode.FEVR2_all_hets.txt >> $TempPath/FEVR2_email_hets.txt
#Sample 3
gemini query -q "select  gene, codon_change, aa_change, rs_ids, max_aaf_all, aaf_exac_all, gerp_bp_score, gts.$sample3 from variants where impact_Severity != 'LOW' AND max_aaf_all < 0.01" --header --gt-filter "gt_types.$sample3 == HET " $DataPath/$RunCode.gemini.db > $TempPath/$RunCode.FEVR3_all_hets.txt
#Now extract only genes in $GeneList
grep -w -f  $GeneList $TempPath/$RunCode.FEVR3_all_hets.txt >> $TempPath/FEVR3_email_hets.txt

#Non Homozygous
#Sample1
gemini query -q "select  gene, codon_change, aa_change, rs_ids, max_aaf_all, aaf_exac_all, gerp_bp_score, gts.$sample1 from variants where impact_Severity != 'LOW' AND max_aaf_all < 0.01" --header --gt-filter "gt_types.$sample1 != HOM_REF" $DataPath/$RunCode.gemini.db > $TempPath/$RunCode.FEVR1_all_non_homs.txt
#Now extract only genes in $GeneList
grep -w -f  $GeneList $TempPath/$RunCode.FEVR1_all_non_homs.txt >> $TempPath/FEVR1_email_non_homs.txt
#Sample2
gemini query -q "select  gene, codon_change, aa_change, rs_ids, max_aaf_all, aaf_exac_all, gerp_bp_score, gts.$sample2 from variants where impact_Severity != 'LOW' AND max_aaf_all < 0.01" --header --gt-filter "gt_types.$sample2 != HOM_REF" $DataPath/$RunCode.gemini.db > $TempPath/$RunCode.FEVR2_all_non_homs.txt
#Now extract only genes in $GeneList
grep -w -f  $GeneList $TempPath/$RunCode.FEVR2_all_non_homs.txt >> $TempPath/FEVR2_email_non_homs.txt
#Sample3
gemini query -q "select  gene, codon_change, aa_change, rs_ids, max_aaf_all, aaf_exac_all, gerp_bp_score, gts.$sample3 from variants where impact_Severity != 'LOW' AND max_aaf_all < 0.01" --header --gt-filter "gt_types.$sample3 != HOM_REF" $DataPath/$RunCode.gemini.db > $TempPath/$RunCode.FEVR3_all_non_homs.txt
#Now extract only genes in $GeneList
grep -w -f  $GeneList $TempPath/$RunCode.FEVR3_all_non_homs.txt >> $TempPath/FEVR3_email_non_homs.txt

#Homozygous Alt
#Sample1
gemini query -q "select  gene, codon_change, aa_change, rs_ids, max_aaf_all, aaf_exac_all, gerp_bp_score, gts.$sample1 from variants where impact_Severity != 'LOW' AND max_aaf_all < 0.01" --header --gt-filter "gt_types.$sample1 == HOM_ALT" $DataPath/$RunCode.gemini.db > $TempPath/$RunCode.FEVR1_all_hom_alt.txt
#Now extract only genes in $GeneList
grep -w -f  $GeneList $TempPath/$RunCode.FEVR1_all_hom_alt.txt >> $TempPath/FEVR1_email_hom_alt.txt
#Sample2
gemini query -q "select  gene, codon_change, aa_change, rs_ids, max_aaf_all, aaf_exac_all, gerp_bp_score, gts.$sample2 from variants where impact_Severity != 'LOW' AND max_aaf_all < 0.01" --header --gt-filter "gt_types.$sample2 == HOM_ALT" $DataPath/$RunCode.gemini.db > $TempPath/$RunCode.FEVR2_all_hom_alt.txt
#Now extract only genes in $GeneList
grep -w -f  $GeneList $TempPath/$RunCode.FEVR2_all_hom_alt.txt >> $TempPath/FEVR2_email_hom_alt.txt
#Sample3
gemini query -q "select  gene, codon_change, aa_change, rs_ids, max_aaf_all, aaf_exac_all, gerp_bp_score, gts.$sample3 from variants where impact_Severity != 'LOW' AND max_aaf_all < 0.01" --header --gt-filter "gt_types.$sample3 == HOM_ALT" $DataPath/$RunCode.gemini.db > $TempPath/$RunCode.FEVR3_all_hom_alt.txt
#Now extract only genes in $GeneList
grep -w -f  $GeneList $TempPath/$RunCode.FEVR3_all_hom_alt.txt >> $TempPath/FEVR3_email_hom_alt.txt

#Merging Files
cat $TempPath/FEVR1_email_hets.txt $TempPath/FEVR1_email_non_homs.txt $TempPath/FEVR1_email_hom_alt.txt > $TempPath/$1_EMAIL.txt
cat $TempPath/FEVR2_email_hets.txt $TempPath/FEVR2_email_non_homs.txt $TempPath/FEVR2_email_hom_alt.txt > $TempPath/$2_EMAIL.txt
cat $TempPath/FEVR3_email_hets.txt $TempPath/FEVR3_email_non_homs.txt $TempPath/FEVR3_email_hom_alt.txt > $TempPath/$3_EMAIL.txt
#Delete duplicate lines
cat $TempPath/$1_EMAIL.txt | sort | uniq > $DataPath/$1_EMAIL.txt
cat $TempPath/$2_EMAIL.txt | sort | uniq > $DataPath/$2_EMAIL.txt
cat $TempPath/$3_EMAIL.txt | sort | uniq > $DataPath/$3_EMAIL.txt
#Write Header
echo 'Gene	Codon Change	AA Change	rsID	Max Allele Freq.	ExAc Freq.	Gerp Scores	Genotype' | cat - $DataPath/$1_EMAIL.txt > temp && mv temp $DataPath/$1_EMAIL.txt
echo 'Gene	Codon Change	AA Change	rsID	Max Allele Freq.	ExAc Freq.	Gerp Scores	Genotype' | cat - $DataPath/$2_EMAIL.txt > temp && mv temp $DataPath/$2_EMAIL.txt
echo 'Gene	Codon Change	AA Change	rsID	Max Allele Freq.	ExAc Freq.	Gerp Scores	Genotype' | cat - $DataPath/$3_EMAIL.txt > temp && mv temp $DataPath/$3_EMAIL.txt

echo "...complete."
}


##########################
###Select which functions to run###
##########################
timestamp
#Catenation


#Variant_Calling
#SNPEff
#Gemini_Update
#Gemini_db
#Gemini_Export
#####################Coverage #Not working yet for hg19
#####################VEP            #Not working yet
#######Exomiser                    #Rarely used
#######Manta                           #Rarely used
#######Specific_Coverage  #Rarely used
Merge_FEVR_Files
#Files_To_Backup
#FEVR_Email_Export
#test_function

#Generate Report Files
Report_Start(){
echo "***************"
echo "Outputting Report files..."
echo "***************"
timestamp
}
 
Report_Header(){
 #Export nohup.out to text file
 printf "%b\n" "The following report was generated by Mat Nightingale at the Dalhousie Genomics Core, all analysis was done using Human Genome hg19." \
 "If anything is unclear contact Genomics@Dal.ca" \
 "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" \ > $TempPath/Pipeline_Commands.txt
}

Report_Subscript(){
 printf "%b\n" "Files included with this report :-\n" \
"FASTQ Files are the raw data" \
"$sample1-R1.fastq.qz & $sample1-R2.fastq.qz\n" \
"VCF Files can be imported into Excel or loaded into the IGV Browser" \
"$RunCode.annotated.vcf contains all the annotated variants before filtering." \
"$RunCode.filtered.vcf contains all the variants that pass filtering (low depth, low quality and low mapping quality reads are filtered out)." \
"$RunCode.snpEff.vcf calculates the effects the variants produce on known genes (e.g. amino acid changes).\n" \
"Gemini database files which can be queried by the user (see https://gemini.readthedocs.io/en/latest/index.html for more details)\n"\
"$RunCode.db\n" \
"Various text files detailing the variants found" \
"$RunCode.non_hom_med_high_rare.txt contains all variants that are non homozygous, medium or high risk and rare (<1% max. alt. allele frequency)." \
"$RunCode.het_med_high_rare.txt is contains all variants that are heterozygous, medium or high risk and rare (<1% max. alt. allele frequency)." \
"$RunCode.hom_alt_med_high_rare.txt contains all variants that are homozygous for the alternate allele, medium or high risk and rare (<1% max. alt. allele frequency).\n" \
"BAM files can loaded into the IGV Browser and show the individual reads, and the areas covered by this data." \
"$sample1.recalibrated.sorted.bam\n" \
"If requested, the Exomiser prioritization tool was run using the phenotype ontology terms provided by the user. This tool outputs several files including gene lists and variants files for multiple inheritance patterns (AD, AR, MT, XD and XR) and an HTML file for easy viewing in a web browser.\n" \
"Manta Structural Variant Caller" \
"Manta calls structural variants (SVs) and indels from mapped paired-end sequencing reads. It is optimized for analysis of germline variation in small sets of individuals and somatic variation in tumor/normal sample pairs."\
"Manta discovers, assembles and scores large-scale SVs, medium-sized indels and large insertions. More details can be found here https://github.com/Illumina/manta" \
"diploidSV.vcf.gz\n"\
"SVs and indels scored and genotyped under a diploid model for the set of samples in a joint diploid sample analysis or for the normal sample in a tumor/normal subtraction analysis."\
"In the case of a tumor/normal subtraction, the scores in this file do not reflect any information from the tumor sample.\n"\
"somaticSV.vcf.gz\n"\
"SVs and indels scored under a somatic variant model. This file will only be produced if a tumor sample alignment file is supplied during configuration.\n"\
"candidateSV.vcf.gz\n"\
"Unscored SV and indel candidates. Only a minimal amount of supporting evidence is required for an SV to be entered as a candidate in this file. An SV or indel must be a candidate to be considered for scoring,"\
"therefore an SV cannot appear in the other VCF outputs if it is not present in this file. Note that by default this file includes indels of size 8 and larger. The smallest indels in this set are intended to be passed on"\
"to a small variant caller without scoring by manta itself (by default manta scoring starts at size 50).\n"\
"candidateSmallIndels.vcf.gz\n"\
"Subset of the candidateSV.vcf.gz file containing only simple insertion and deletion variants less than the minimum scored variant size (50 by default). Passing this file to a small variant caller will provide"\
"continuous coverage over all indel sizes when the small variant caller and manta outputs are evaluated together. Alternate small indel candidate sets can be parsed out of the candidateSV.vcf.gz file"\
"if this candidate set is not appropriate.\n"\
"If other exports are required please let me know.\n" \
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" > $TempPath/Report_Header.txt
}

Variant_Count(){
 #How many variants?
 printf   "%b"\
"Total variants seen in this analysis after filtering out poor quality & low coverage reads :-\n" > $TempPath/Variant_total.txt
gemini query -q 'select count(*) from variants' --header $DataPath/$RunCode.gemini.db >> $TempPath/Variant_total.txt
}

SNP_Indel_Count(){
#How many SNPs and INDELs?
printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"\
"Total SNPs and INDELs seen in this analysis after filtering out poor quality & low coverage reads :-" > $TempPath/SNP_Indel.txt
gemini query -q 'select type,count(*) from variants group by type' --header $DataPath/$RunCode.gemini.db >> $TempPath/SNP_Indel.txt
}

Severity(){
#The impact Severity of the variants
printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"\
"Severity of the variants seen in this analysis :-" > $TempPath/Severity.txt
gemini query -q 'select impact_Severity,count(*) from variants group by impact_Severity' --header $DataPath/$RunCode.gemini.db >> $TempPath/Severity.txt
}

Clinvar_Variants(){
#How many variants are in ClinVar and what are their annotations
printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"\
"How many variants are in ClinVar and what are their annotations :-" > $TempPath/ClinVar.txt
gemini query -q 'select clinvar_sig,count(*) from variants group by clinvar_sig' --header $DataPath/$RunCode.gemini.db >> $TempPath/ClinVar.txt
}

Clinvar_Pathogenic(){
#Find variants that are listed as pathogenic in ClinVar
printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"\
"Pathogenic ClinVar entries seen in this data :-" > $TempPath/PathogenicClinVar.txt
gemini query -q 'select chrom, start, end, ref, alt, codon_change, aa_change, gene, transcript, biotype, impact, impact_Severity, gerp_bp_score, aaf_exac_all, max_aaf_all, gnomad_num_het, gnomad_num_hom_alt, gnomad_num_chroms, in_omim, clinvar_sig, clinvar_disease_name, clinvar_gene_phenotype, qual, filter, depth, vcf_id, rs_ids, clinvar_disease_name from variants where clinvar_sig like "%pathogenic%"' --header $DataPath/$RunCode.gemini.db >> $TempPath/PathogenicClinVar.txt

}

Clinvar_Keyword(){
#Find variants that are listed  with a keyword in ClinVar
printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"\
"ClinVar entries matching the keyword 'Retinopathy' seen in this data after filtering out poor quality & low coverage reads :-" > $TempPath/KeywordClinVar.txt
gemini query -q 'select chrom, start, end, ref, alt, codon_change, aa_change, gene, transcript, biotype, impact, impact_Severity, gerp_bp_score, aaf_exac_all, max_aaf_all, gnomad_num_het, gnomad_num_hom_alt, gnomad_num_chroms, in_omim, clinvar_sig, clinvar_disease_name, clinvar_gene_phenotype, qual, filter, depth, vcf_id, rs_ids, clinvar_disease_name from variants where clinvar_disease_name like "%Retinopathy%"' --header $DataPath/$RunCode.gemini.db >> $TempPath/KeywordClinVar.txt
}

Exome_Coverage(){
#What was the exome coverage
printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"\
"Fraction of Bases covered at 1x, 2x, 10x, 20x, 30x, 50x, 100x, mean , median, max, zero  \n" \
"Sample: $sample1 = \n"\
"Sample: $sample2 = \n"\
"Sample: $sample3 = \n"> $TempPath/exome_coverage.txt
}

Gemini_Results(){
#How many variants are left after filtering in Gemini
printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"\
"How many rare (<1% max. alt. allele frequency) variants remain after filtering for heterozygous variants that have a medium or high impact Severity :-" > $TempPath/Gemini_Results_count.txt
wc -l $DataPath/$RunCode.het_med_high_rare.txt | awk '{ print $1 -1}' >> $TempPath/Gemini_Results_count.txt

printf  "%b\n" "How many rare (<1% max. alt. allele frequency) variants remain after filtering for non homozygous variants that have a medium or high impact Severity :-" >> $TempPath/Gemini_Results_count.txt
wc -l $DataPath/$RunCode.non_hom_med_high_rare.txt | awk '{ print $1 -1}' >> $TempPath/Gemini_Results_count.txt

printf  "%b\n" "How many rare (<1% max. alt. allele frequency) variants remain after filtering for homozygous alternate allele variants that have a medium or high impact Severity :-" >> $TempPath/Gemini_Results_count.txt
wc -l $DataPath/$RunCode.hom_alt_med_high_rare.txt | awk '{ print $1 -1}' >> $TempPath/Gemini_Results_count.txt

}

Key_Genes(){
#Search for key genes
Key_Genes=$(<$DataPath/gene_list.txt)

printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"\
"Genes associated with this project are :-\n"\
"$Key_Genes\n\n"\
"Which genes are in the final variants list after filtering for rare (<1% max. alt. allele frequency) heterozygous variants that have a medium or high impact Severity :-" > $TempPath/Key_Genes.txt
grep -m1 "" $DataPath/$RunCode.het_med_high_rare.txt >>$TempPath/Key_Genes.txt
ps -ef | egrep -wi "$Key_Genes" $DataPath/$RunCode.het_med_high_rare.txt >> $TempPath/Key_Genes.txt

printf  "%b\n" >> $TempPath/Key_Genes.txt
printf  "%b\n" "Which genes are in the final variants list after filtering for rare (<1% max. alt. allele frequency) non homozygous variants that have a medium or high impact Severity :-" >> $TempPath/Key_Genes.txt
grep -m1 "" $DataPath/$RunCode.non_hom_med_high_rare.txt >>$TempPath/Key_Genes.txt
ps -ef | egrep -wi "$Key_Genes" $DataPath/$RunCode.non_hom_med_high_rare.txt >>$TempPath/Key_Genes.txt

printf  "%b\n" >> $TempPath/Key_Genes.txt
printf  "%b\n" "Which genes are in the final variants list after filtering for rare (<1% max. alt. allele frequency) homozygous variants that have a medium or high impact Severity :-" >> $TempPath/Key_Genes.txt
grep -m1 "" $DataPath/$RunCode.non_hom_med_high_rare.txt >>$TempPath/Key_Genes.txt
ps -ef | egrep -wi "$Key_Genes" $DataPath/$RunCode.hom_alt_med_high_rare.txt >> $TempPath/Key_Genes.txt
}

Exomiser_Text(){
#Exomiser data goes here
printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"\
"See the separate output files for the Exomiser gene prioritization data if it was requested." > $TempPath/exomiser.txt
}

Report_Supplemental(){
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
"This capture kit does not target the mitochondrial genome." > $TempPath/Report_Supplemental.txt
}

prediction_scores(){
 #DOESN'T CURRENTLY WORK
 #What are the PolyPhen, SIFT, and CADD scores of any Retinopathy variants?-Maybe change this to get scores for only FEVR associated genes????
 gemini query -q 'select polyphen_score,sift_score,cadd_scaled from variants where clinvar_disease_name == "Retinopathy"' --header $DataPath/$RunCode.gemini.db > $TempPath/scores1.txt
 sed '1 i PolyPhen, SIFT, and CADD scores for any ClinVar results.' $TempPath/scores1.txt > $TempPath/scores2.txt
 sed '$ a\ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ' $TempPath/scores2.txt > $TempPath/Scores.txt

 #How do these scores compare to the rest of the variants in the VCF file?
 gemini query -q 'select polyphen_score,sift_score,cadd_scaled from variants' --header ~/LinuxShare/$RunCode/$RunCode.db > $RunCode/report_scores.tsv

 ###
 echo "Don't forget to run the report_score.tsv through the R script next."
 ###
}

Report_End(){
#Merge text reports
cat $TempPath/Pipeline_Commands.txt $TempPath/Report_Header.txt $TempPath/Variant_total.txt $TempPath/SNP_Indel.txt $TempPath/Severity.txt $TempPath/ClinVar.txt $TempPath/PathogenicClinVar.txt  $TempPath/KeywordClinVar.txt $TempPath/Gemini_Results_count.txt $TempPath/Key_Genes.txt $TempPath/exome_coverage.txt $TempPath/exomiser.txt $TempPath/Report_Supplemental.txt > $DataPath/$RunCode.Report.txt
}

#########################
###Select which reports to run###
#########################
#Report_Start
#Report_Header
#Report_Subscript
#Variant_Count
#SNP_Indel_Count
#Severity
#Clinvar_Variants
#Clinvar_Pathogenic
#Clinvar_Keyword
#Gemini_Results
#Exomiser_Text
#Key_Genes
#Exome_Coverage
#Report_Supplemental
###################Prediction_Scores -DOESN'T CURRENTLY WORK
#Report_End

echo "Finished."
timestamp