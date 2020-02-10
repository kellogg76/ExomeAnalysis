#!/bin/bash
#Script searches FEVR master Gemini DB for stop_gained variants

echo "***************"
echo "Mats FEVR Truncating Mutation Searcher"
echo "***************"

#Gemini DB to search
GeminiToSearch=/mnt/d/hg19/FEVR.combined.gemini.db

#Output Directory
OutputDir=/mnt/d
 
gemini query -q "select chrom, start, end, gene, codon_change, aa_change, rs_ids, max_aaf_all, aaf_exac_all, gerp_bp_score, impact, (gts).(*) from variants where impact_severity != 'LOW' AND max_aaf_all < 0.01 AND impact = 'stop_gained'" --header $GeminiToSearch > $OutputDir/Stop_Gains_Data.txt

#Pull out column 4
cut -f4 < /mnt/d/Trunc_FEVR.txt > $OutputDir/stop_gain_genes.txt 
#Remove first line header
sed -i '1d' $OutputDir/stop_gain_genes.txt 
#Sort column
sort -o $OutputDir/stop_gain_genes.txt  $OutputDir/stop_gain_genes.txt 
#Count uniq entries
uniq -c $OutputDir/stop_gain_genes.txt   > $OutputDir/stop_gain_genes_count.txt 
#Re-sort on number
sort -k1 -o $OutputDir/stop_gain_genes_count.txt $OutputDir/stop_gain_genes_count.txt
