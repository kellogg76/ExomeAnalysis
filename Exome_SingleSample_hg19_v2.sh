#!/bin/bash

#Command to run this script is ./Exome_ThreeSamples_hg19_v2.sh sample1
#eg ./Exome_ThreeSamples_hg19_v2.sh 549

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
RunCode=Twist-01

#Enter sample name below
sample1=$1

###Paths to files###
#Linux Paths
hg19_buildpath=/mnt/d/hg19
ToolPath=~
DataPath=/mnt/d/$RunCode
TempPath=$DataPath/temp
mkdir -p $TempPath

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
dbSNP=$hg19_buildpath/dbsnp_138.b37.vcf
#Fasta Path
FASTA=$hg19_buildpath/human_g1k_v37.fasta
#CCDS Path
CCDS=$hg19_buildpath/ccds_hg19.bed
#Indels Path
INDELS=$hg19_buildpath/Mills_and_1000G_gold_standard.indels.b37.vcf
#1000 Genomes Indels
G1000=$hg19_buildpath/1000G_phase1.indels.b37.vcf

Header_text(){
WHITE='\033[1;37m'
BLUE='\033[0;34m'
DGRAY='\033[1;30m'
printf "${WHITE}   
           ____   __   __       ___  ____  __ _   __   _  _  __  ___  ____ 
          (    \ / _\ (  )     / __)(  __)(  ( \ /  \ ( \/ )(  )/ __)/ ___)
           ) D (/    \/ (_/\  ( (_ \ ) _) /    /(  O )/ \/ \ )(( (__ \___ \   
          (____/\_/\_/\____/   \___/(____)\_)__) \__/ \_)(_/(__)\___)(____/
    	             ___  __  ____  ____  ____    __     __   ____		 	   
                    / __)/  \(  _ \(  __)/ ___)  (  )   / _\ (  _ \  
                   ( (__(  O ))   / ) _) \___ \  / (_/\/    \ ) _ (                       
                    \___)\__/(__\_)(____)(____/  \____/\_/\_/(____/                      
              ${BLUE}    Contact: Mat Nightingale     	Email: Genomics@Dal.ca
 ${DGRAY}      o O       o O       o O       o O       o O       o O       o O       o O 
     o | | O   o | | O   o | | O   o | | O   o | | O   o | | O   o | | O   o | | O
   O | | | | O | | | | O | | | | O | | | | O | | | | O | | | | O | | | | O | | | | O
     O | | o   O | | o   O | | o   O | | o   O | | o   O | | o   O | | o   O | | o
       O o       O o       O o       O o       O o       O o       O o       O o\n"
}

# timestamp function
timestamp() {
date +"%Y-%m-%d %H:%M:%S"
}


move_fastq() {
# move files from sub folders
timestamp
find $DataPath -type f -print0 | xargs -0 mv -t $DataPath
}

Catenation(){
#Catenation
echo "Catenating: " $sample1
cat $DataPath/$sample1\_S2_L001_R1_001.fastq.gz $DataPath/$sample1\_S2_L002_R1_001.fastq.gz $DataPath/$sample1\_S2_L003_R1_001.fastq.gz $DataPath/$sample1\_S2_L004_R1_001.fastq.gz > $DataPath/$sample1-R1.fastq.gz
cat $DataPath/$sample1\_S2_L001_R2_001.fastq.gz $DataPath/$sample1\_S2_L002_R2_001.fastq.gz $DataPath/$sample1\_S2_L003_R2_001.fastq.gz $DataPath/$sample1\_S2_L004_R2_001.fastq.gz > $DataPath/$sample1-R2.fastq.gz

#Add code to delete the uncatenated files
echo "Deleting uncatenated files for: " $sample1
rm $DataPath/$sample1\_S1_L001_R1_001.fastq.gz $DataPath/$sample1\_S1_L002_R1_001.fastq.gz $DataPath/$sample1\_S1_L003_R1_001.fastq.gz $DataPath/$sample1\_S1_L004_R1_001.fastq.gz
rm $DataPath/$sample1\_S1_L001_R2_001.fastq.gz $DataPath/$sample1\_S1_L002_R2_001.fastq.gz $DataPath/$sample1\_S1_L003_R2_001.fastq.gz $DataPath/$sample1\_S1_L004_R2_001.fastq.gz
}

BWA_Step(){
#BWA
echo "*******************************"
echo "*Processing Samples $sample1*"
echo "*******************************"
echo "***************"
echo "******BWA******"
echo "***************"
timestamp
echo "Recalibrating sample: " $sample1
bwa mem -t 7 -M -v 2 $FASTA $DataPath/$sample1-R1.fastq.gz $DataPath/$sample1-R2.fastq.gz | samtools view -u - | samtools sort -@ 7 -O bam -o $DataPath/$sample1.bwa.sorted.bam -T $TempPath/$sample1.bwa.sort.temp
}

Read_Groups(){
#Add Or Replace Read Groups
echo "************************"
echo "*AddOrReplaceReadGroups*"
timestamp
echo "************************"
echo "AddOrReplaceReadGroups sample: " $sample1
java -Xmx24g -jar $PICARD AddOrReplaceReadGroups INPUT=$DataPath/$sample1.bwa.sorted.bam OUTPUT=$DataPath/$sample1.rg.sorted.bam RGID=$sample1 RGSM=$sample1 RGLB=$sample1 RGPL=illumina RGPU=miseq

}

Build_Bam_Index(){
#Build BAM Index
echo "*******************"
echo "***BuildBamIndex***"
echo "*******************"
timestamp
echo "BuildBamIndex sample: " $sample1
java -Xmx24g -jar $PICARD BuildBamIndex INPUT=$DataPath/$sample1.rg.sorted.bam
}

Mark_Duplicates(){
#Mark Duplicates
echo "*********************"
echo "***Mark Duplicates***"
echo "*********************"
timestamp
echo "MarkDuplicates sample: " $sample1
java -Xmx24g -jar $PICARD MarkDuplicates CREATE_INDEX=true METRICS_FILE=$DataPath/$sample1.dedup.metrics INPUT=$DataPath/$sample1.rg.sorted.bam OUTPUT=$DataPath/$sample1.dedup.sorted.bam
}

Realigner1(){
#Realigner Target Creator
echo "****************************"
echo "***RealignerTargetCreator***"
echo "****************************"
timestamp
echo "RealignerTargetCreator sample: " $sample1
java -Xmx24g -jar $GATK -T RealignerTargetCreator -R $FASTA -I $DataPath/$sample1.dedup.sorted.bam -o $DataPath/$sample1.targets.intervals -known $INDELS -known $G1000 -nt 7
}

Realigner2(){
#Indel Realigner
echo "********************"
echo "***IndelRealigner***"
echo "********************"
timestamp
echo "IndelRealigner sample: " $sample1
java -Xmx24g -jar $GATK -T IndelRealigner -R $FASTA -I $DataPath/$sample1.dedup.sorted.bam -known $G1000 -known $INDELS -targetIntervals $DataPath/$sample1.targets.intervals --read_filter NotPrimaryAlignment -o $DataPath/$sample1.realigned.sorted.bam
}

Recalibration(){
#Recalibration
echo "***************"
echo "Recalibration"
echo "***************"
timestamp
echo "Recalibrating sample: " $sample1
java -Xmx8g -jar $GATK -T BaseRecalibrator -R $FASTA -I $DataPath/$sample1.realigned.sorted.bam -o $DataPath/$sample1.recal --knownSites $dbSNP -nct 7
java -Xmx8g -jar $GATK -T PrintReads -R $FASTA -I $DataPath/$sample1.realigned.sorted.bam -o $DataPath/$sample1.recalibrated.sorted.bam -BQSR $DataPath/$sample1.recal -nct 7
}

Variant_Calling(){
#Variant Calling & Annotations
echo "***************"
echo "Variant Calling & Annotations"
echo "***************"
timestamp
echo "Haplotype calling sample: " $sample1
java -Xmx40g -jar $GATK -T HaplotypeCaller -R $FASTA --dbsnp $dbSNP -I $DataPath/$sample1.recalibrated.sorted.bam -L $CCDS --emitRefConfidence GVCF --variant_index_type LINEAR --variant_index_parameter 128000 -o $DataPath/$sample1.haplotypecaller.g.vcf -nct 7
echo "Generating gVCF"
java -Xmx40g -jar $GATK -T GenotypeGVCFs -R $FASTA --variant $DataPath/$sample1.haplotypecaller.g.vcf -o $DataPath/$RunCode.haplotypecaller.vcf
echo "zless, sed etc"
zless $DataPath/$RunCode.haplotypecaller.vcf | sed "s/ID=AD,Number=./ID=AD,Number=R/" | vt decompose -s - | vt normalize -r $FASTA - > $DataPath/$RunCode.hc.normalized.vcf
echo "Variant annotator"
java -Xmx24g -jar $GATK -T VariantAnnotator -R $FASTA -nt 7 --group StandardAnnotation --dbsnp $dbSNP -I $DataPath/$sample1.recalibrated.sorted.bam --variant $DataPath/$RunCode.hc.normalized.vcf -L $DataPath/$RunCode.hc.normalized.vcf -o $DataPath/$RunCode.annotated.vcf
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
gemini query -q "select chrom, start, end, ref, alt, codon_change, aa_change, gene, transcript, biotype, impact, impact_severity, gerp_bp_score, aaf_exac_all, max_aaf_all, gnomad_num_het, gnomad_num_hom_alt, gnomad_num_chroms, in_omim, clinvar_sig, clinvar_disease_name, clinvar_gene_phenotype, qual, filter, depth, vcf_id, rs_ids,  (gts).(*) from variants where impact_severity != 'LOW' AND max_aaf_all < 0.01" --header --gt-filter "gt_types.$sample1 == HET" $DataPath/$RunCode.gemini.db > $DataPath/$RunCode.het_med_high_rare.txt

#Non Homozygous
gemini query -q "select chrom, start, end, ref, alt, codon_change, aa_change, gene, transcript, biotype, impact, impact_severity, gerp_bp_score,  aaf_exac_all, max_aaf_all, gnomad_num_het, gnomad_num_hom_alt, gnomad_num_chroms, in_omim, clinvar_sig, clinvar_disease_name, clinvar_gene_phenotype, qual, filter, depth, vcf_id, rs_ids, (gts).(*) from variants where impact_severity != 'LOW' AND max_aaf_all < 0.01" --header --gt-filter "gt_types.$sample1 != HOM_REF" $DataPath/$RunCode.gemini.db > $DataPath/$RunCode.non_hom_med_high_rare.txt

#Homozygous
gemini query -q "select chrom, start, end, ref, alt, codon_change, aa_change, gene, transcript, biotype, impact, impact_severity, gerp_bp_score,  aaf_exac_all, max_aaf_all, gnomad_num_het, gnomad_num_hom_alt, gnomad_num_chroms, in_omim, clinvar_sig, clinvar_disease_name, clinvar_gene_phenotype, qual, filter, depth, vcf_id, rs_ids,  (gts).(*) from variants where impact_severity != 'LOW' AND max_aaf_all < 0.01" --header --gt-filter "gt_types.$sample1 == HOM_ALT" $DataPath/$RunCode.gemini.db > $DataPath/$RunCode.hom_alt_med_high_rare.txt
echo "...complete."
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

Coverage(){
 echo "***************"
 echo "Calculating exome coverage"
 echo "***************"
timestamp
echo "Calculating coverage:  " $sample1
#Perform calculation & export
java -Xmx24g -jar picard.jar CollectHsMetrics I=$DataPath/$sample1.recalibrated.sorted.bam O=$DataPath/$sample1.collect_hs_metrics.txt R=$FASTA BAIT_INTERVALS=$hg19_buildpath/TruSeq_exome_targeted_regions.hg19.list.interval_list TARGET_INTERVALS=$hg19_buildpath/TruSeq_exome_targeted_regions.hg19.list.interval_list
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
}

Manta(){
#Run Manta Structural Variant Caller v1.6.0 for 
~/manta1.6.0/bin/configManta.py --bam $DataPath/$sample1.recalibrated.sorted.bam --referenceFasta $FASTA --runDir $DataPath/manta --exome
python $DataPath/manta/runWorkflow.py
}

Specific_Coverage(){
#The coverage of a specific region as defined by the PI
#Count the total and averaged coverage 
samtools mpileup -r 'chr1:1,958,700-1,958,907' $sample1.recalibrated.sorted.bam | awk 'BEGIN{C=0}; {C=C+$4}; END{print C "\t" C/NR}'
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

#Non Homozygous
#Sample1
gemini query -q "select  gene, codon_change, aa_change, rs_ids, max_aaf_all, aaf_exac_all, gerp_bp_score, gts.$sample1 from variants where impact_Severity != 'LOW' AND max_aaf_all < 0.01" --header --gt-filter "gt_types.$sample1 != HOM_REF" $DataPath/$RunCode.gemini.db > $TempPath/$RunCode.FEVR1_all_non_homs.txt
#Now extract only genes in $GeneList
grep -w -f  $GeneList $TempPath/$RunCode.FEVR1_all_non_homs.txt >> $TempPath/FEVR1_email_non_homs.txt

#Homozygous Alt
#Sample1
gemini query -q "select  gene, codon_change, aa_change, rs_ids, max_aaf_all, aaf_exac_all, gerp_bp_score, gts.$sample1 from variants where impact_Severity != 'LOW' AND max_aaf_all < 0.01" --header --gt-filter "gt_types.$sample1 == HOM_ALT" $DataPath/$RunCode.gemini.db > $TempPath/$RunCode.FEVR1_all_hom_alt.txt
#Now extract only genes in $GeneList
grep -w -f  $GeneList $TempPath/$RunCode.FEVR1_all_hom_alt.txt >> $TempPath/FEVR1_email_hom_alt.txt

#Merging Files
cat $TempPath/FEVR1_email_hets.txt $TempPath/FEVR1_email_non_homs.txt $TempPath/FEVR1_email_hom_alt.txt > $TempPath/$1_EMAIL.txt
#Delete duplicate lines
cat $TempPath/$1_EMAIL.txt | sort | uniq > $DataPath/$1_EMAIL.txt
#Write Header
echo 'Gene	Codon Change	AA Change	rsID	Max Allele Freq.	ExAc Freq.	Gerp Scores	Genotype' | cat - $DataPath/$1_EMAIL.txt > temp && mv temp $DataPath/$1_EMAIL.txt

echo "...complete."
}

Exome_Coverage_PDF(){
#Run script to generate coverage plots
dos2unix /mnt/c/Users/Bedard_Lab/Documents/GitHub/ExomeAnalysis/complete_coverage.sh
source /mnt/c/Users/Bedard_Lab/Documents/GitHub/ExomeAnalysis/complete_coverage.sh $sample1
}

test_func(){
#Run script to generate FEVR Gene coverage plots

#First run coding_coverage.sh
#dos2unix /mnt/c/Users/Bedard_Lab/Documents/GitHub/ExomeAnalysis/coding_coverage.sh
#source /mnt/c/Users/Bedard_Lab/Documents/GitHub/ExomeAnalysis/coding_coverage.sh $sample1

dos2unix /mnt/c/Users/Bedard_Lab/Documents/GitHub/ExomeAnalysis/Coverage_plot.R
source /mnt/c/Users/Bedard_Lab/Documents/GitHub/ExomeAnalysis/Coverage_plot.R $sample1

}

##########################
###Select which functions to run###
##########################
timestamp
Header_text
#move_fastq
#Catenation
#BWA_Step
#Read_Groups
#Build_Bam_Index
#Mark_Duplicates
#Realigner1
#Realigner2
#Recalibration
Variant_Calling
SNPEff
Gemini_Update
Gemini_db
Gemini_Export
Exome_QC
#####################Coverage #Not working yet for hg19
#####################VEP            #Not working yet
#######Exomiser                    #Rarely used
#######Manta                           #Rarely used
#######Specific_Coverage  #Rarely used
#Merge_FEVR_Files
#FEVR_Export
#Files_To_Backup
#FEVR_Email_Export
#Exome_Coverage_PDF
#test_func

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
#The impact severity of the variants
printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"\
"Severity of the variants seen in this analysis :-" > $TempPath/Severity.txt
gemini query -q 'select impact_severity,count(*) from variants group by impact_severity' --header $DataPath/$RunCode.gemini.db >> $TempPath/Severity.txt
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
gemini query -q 'select chrom, start, end, ref, alt, codon_change, aa_change, gene, transcript, biotype, impact, impact_severity, gerp_bp_score, aaf_exac_all, max_aaf_all, gnomad_num_het, gnomad_num_hom_alt, gnomad_num_chroms, in_omim, clinvar_sig, clinvar_disease_name, clinvar_gene_phenotype, qual, filter, depth, vcf_id, rs_ids, clinvar_disease_name from variants where clinvar_sig like "%pathogenic%"' --header $DataPath/$RunCode.gemini.db >> $TempPath/PathogenicClinVar.txt
}

Clinvar_Keyword(){
#Find variants that are listed  with a keyword in ClinVar
printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"\
"ClinVar entries matching the keyword 'Retinopathy' seen in this data after filtering out poor quality & low coverage reads :-" > $TempPath/KeywordClinVar.txt
gemini query -q 'select chrom, start, end, ref, alt, codon_change, aa_change, gene, transcript, biotype, impact, impact_severity, gerp_bp_score, aaf_exac_all, max_aaf_all, gnomad_num_het, gnomad_num_hom_alt, gnomad_num_chroms, in_omim, clinvar_sig, clinvar_disease_name, clinvar_gene_phenotype, qual, filter, depth, vcf_id, rs_ids, clinvar_disease_name from variants where clinvar_disease_name like "%Retinopathy%"' --header $DataPath/$RunCode.gemini.db >> $TempPath/KeywordClinVar.txt
}

Gemini_Results(){
#How many variants are left after filtering in Gemini
printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"\
"How many rare (<1% max. alt. allele frequency) variants remain after filtering for heterozygous variants that have a medium or high impact severity :-" > $TempPath/Gemini_Results_count.txt
wc -l $DataPath/$RunCode.het_med_high_rare.txt | awk '{ print $1 -1}' >> $TempPath/Gemini_Results_count.txt

printf  "%b\n" "How many rare (<1% max. alt. allele frequency) variants remain after filtering for non homozygous variants that have a medium or high impact severity :-" >> $TempPath/Gemini_Results_count.txt
wc -l $DataPath/$RunCode.non_hom_med_high_rare.txt | awk '{ print $1 -1}' >> $TempPath/Gemini_Results_count.txt

printf  "%b\n" "How many rare (<1% max. alt. allele frequency) variants remain after filtering for homozygous alternate allele variants that have a medium or high impact severity :-" >> $TempPath/Gemini_Results_count.txt
wc -l $DataPath/$RunCode.hom_alt_med_high_rare.txt | awk '{ print $1 -1}' >> $TempPath/Gemini_Results_count.txt
}

Exomiser_Text(){
#Exomiser data goes here
printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"\
"See the separate output files for the Exomiser gene prioritization data." > $TempPath/exomiser.txt
}

Key_Genes(){
#Search for key genes
Key_Genes=$(<$DataPath/gene_list.txt)

printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"\
"Genes associated with this project are :-\n"\
"$Key_Genes\n\n"\
"Which genes are in the final variants list after filtering for rare (<1% max. alt. allele frequency) heterozygous variants that have a medium or high impact severity :-" > $TempPath/Key_Genes.txt
grep -m1 "" $DataPath/$RunCode.het_med_high_rare.txt >>$TempPath/Key_Genes.txt
ps -ef | egrep -wi "$Key_Genes" $DataPath/$RunCode.het_med_high_rare.txt >> $TempPath/Key_Genes.txt

printf  "%b\n" >> $TempPath/Key_Genes.txt
printf  "%b\n" "Which genes are in the final variants list after filtering for rare (<1% max. alt. allele frequency) non homozygous variants that have a medium or high impact severity :-" >> $TempPath/Key_Genes.txt
grep -m1 "" $DataPath/$RunCode.non_hom_med_high_rare.txt >>$TempPath/Key_Genes.txt
ps -ef | egrep -wi "$Key_Genes" $DataPath/$RunCode.non_hom_med_high_rare.txt >>$TempPath/Key_Genes.txt

printf  "%b\n" >> $TempPath/Key_Genes.txt
printf  "%b\n" "Which genes are in the final variants list after filtering for rare (<1% max. alt. allele frequency) homozygous variants that have a medium or high impact severity :-" >> $TempPath/Key_Genes.txt
grep -m1 "" $DataPath/$RunCode.non_hom_med_high_rare.txt >>$TempPath/Key_Genes.txt
ps -ef | egrep -wi "$Key_Genes" $DataPath/$RunCode.hom_alt_med_high_rare.txt >> $TempPath/Key_Genes.txt
}

Exome_Coverage(){
#What was the exome coverage
printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"\
"Fraction of Bases covered at 1x, 2x, 10x, 20x, 30x, 50x, 100x, mean , median, max, zero  \n" \
"Sample: $sample1 = \n"> $TempPath/Exome_Coverage.txt
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

Prediction_Scores(){
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
cat $TempPath/Pipeline_Commands.txt $TempPath/Report_Header.txt $TempPath/Variant_total.txt $TempPath/SNP_Indel.txt $TempPath/Severity.txt $TempPath/ClinVar.txt $TempPath/PathogenicClinVar.txt  $TempPath/KeywordClinVar.txt $TempPath/Gemini_Results_count.txt $TempPath/Key_Genes.txt $TempPath/Exome_Coverage.txt $TempPath/exomiser.txt $TempPath/Report_Supplemental.txt > $DataPath/$RunCode.Report.txt
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