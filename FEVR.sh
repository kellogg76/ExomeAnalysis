#!/bin/bash
#Script to search the master database for mutations in gene_list and export a single report for each sample
#eg ./FEVR.sh 549

<<to_add
to_add

echo "***************"
echo "Mats FEVR Gene Report"
echo "***************"

#Enter sample name below
sample1=$1

#Gemini DB to search
#GeminiToSearch=/mnt/d/hg19/FEVR1-27.combined.gemini.db
GeminiToSearch=/mnt/d/FEVR32/FEVR32.gemini.db

#Max alternate allele frequency
#1% = 0.01
max_aaf=0.01

#List of Genes
#GeneList=/mnt/d/JR_gene_list.txt
GeneList=/mnt/d/test_gene_list.txt
dos2unix $GeneList

#Output Directory
OutputDir=/mnt/d/FEVR_Gene_Searcher
mkdir $OutputDir

#Querying the database
echo "Querying the database..."
gemini query -q "select chrom, start, end, ref, alt, gene, codon_change, aa_change, rs_ids, max_aaf_all, aaf_exac_all, gerp_bp_score, gts.$sample1 from variants where impact_severity != 'LOW' AND max_aaf_all < $max_aaf" --header --gt-filter "gt_types.$sample1 == HET or gt_types.$sample1 == HOM_ALT" $GeminiToSearch > $OutputDir/${sample1}_Variants_List.txt

new_method(){
#Sort All_Sample_Variants_List.txt
#sort -k 4 $OutputDir/${sample1}_Variants_List.txt > $OutputDir/Sorted_${sample1}_Variants_List.txt

#Cut 1st line from $OutputDir/All_Sample_Variants_List.txt to get headers
awk 'NR == 1' $OutputDir/${sample1}_Variants_List.txt >>$OutputDir/${sample1}_Variants_Filtered_List.txt

#grep source.file reference.file
echo "$gene_name"
grep -Fwf $GeneList $OutputDir/${sample1}_Variants_List.txt >> $OutputDir/${sample1}_Variants_Filtered_List.txt
echo "All files from this export can be found in $OutputDir"
}

file_stripper(){
#Remove all ./. entries to make the list more readable
grep -v "\./\." $OutputDir/${sample1}_Variants_Filtered_List.txt >$OutputDir/temp.txt && mv $OutputDir/temp.txt $OutputDir/${sample1}_Variants_Final.txt
}

new_method
file_stripper