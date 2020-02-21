#!/bin/bash
#Script searches  master Gemini DB for variants in genes found in Gene List
#./Batch_Gene_Searcher.sh

echo "***************"
echo "Mats FEVR Mutation Searcher"
echo "***************"

#Gemini DB to search
GeminiToSearch=/mnt/d/hg19/FEVR1-17.gemini.db

#Max alternate allele frequency
#1% = 0.01
max_aaf=0.01

#List of Genes
GeneList=/mnt/d/JR_gene_list.txt

#Output Directory
OutputDir=/mnt/d/Batch_Gene_Searcher
mkdir $OutputDir
dos2unix $GeneList
echo "Querying the database..."
gemini query -q "select chrom, start, end, gene, codon_change, aa_change, rs_ids, max_aaf_all, aaf_exac_all, gerp_bp_score, impact, (gts).(*) from variants where impact_severity != 'LOW' AND max_aaf_all < $max_aaf" --header $GeminiToSearch > $OutputDir/Master_Variants_List.txt

file_stripper(){
#Strips out samples where the variants were not seen to make it more readable.
awk -v na="./." '
BEGIN{OFS=FS="\t"}
NR==FNR && NR>1 {
  for(i=1;i<=NF;i++){if($i!=na){s[i]=1}}
}
NR!=FNR {
  for(l in s){true} 
  for(i in s){if (i!=l){printf "%s"OFS,$i} else {printf "%s\n",$i}}
}
' $OutputDir/Filtered_genes.txt  $OutputDir/Filtered_genes.txt > $OutputDir/Stripped_Genes.txt 
}

#Cut 1st line from $OutputDir/Master_Variants_List.txt to get headers
awk 'NR == 1' $OutputDir/Master_Variants_List.txt >>$OutputDir/Filtered_genes.txt

while IFS="" read -r gene_name || [ -n "$gene_name" ]
do
echo "$gene_name"
#Cross reference gene list and export to FEVR_genes.txt
#grep "/bin/bash" /etc/passwd | cut -d'|' -s -f1
grep -Fwf $GeneList $OutputDir/Master_Variants_List.txt >> $OutputDir/Filtered_genes.txt 
done < $GeneList
echo "All files from this export can be found in $OutputDir"
file_stripper