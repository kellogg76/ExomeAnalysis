#!/bin/bash
#Script searches  master Gemini DB for variants in genes found in Gene List
#./Batch_Gene_Searcher.sh

echo "***************"
echo "Mats Mutation Searcher"
echo "***************"

#Gemini DB to search
GeminiToSearch=/mnt/d/hg19/FEVR1-23.combined.gemini.db

#Max alternate allele frequency
#1% = 0.01
max_aaf=0.01

#List of Genes
GeneList=/mnt/d/GENE_LIST.txt

#Output Directory
OutputDir=/mnt/d/Batch_Gene_Searcher

mkdir $OutputDir
dos2unix $GeneList

echo "Querying the database..."
gemini query -q "select chrom, start, end, gene, codon_change, aa_change, rs_ids, max_aaf_all, aaf_exac_all, gerp_bp_score, (gts).(*) from variants where impact_severity != 'LOW' AND max_aaf_all < $max_aaf" --header $GeminiToSearch > $OutputDir/Master_Variants_List.txt

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

old_method(){
while IFS="" read -r gene_name || [ -n "$gene_name" ]
do
echo "$gene_name"
grep -Fwf $GeneList $OutputDir/Master_Variants_List.txt >> $OutputDir/Filtered_genes.txt 
done < $GeneList
echo "All files from this export can be found in $OutputDir"
#file_stripper
}

new_method(){
#Sort Master_Variants_List.txt
sort -k 4 $OutputDir/Master_Variants_List.txt > $OutputDir/Sorted_Master_Variants_List.txt

#grep source.file reference.file
echo "$gene_name"
grep -Fwf $GeneList $OutputDir/Master_Variants_List.txt >> $OutputDir/Filtered_genes.txt 
echo "All files from this export can be found in $OutputDir"

#grep -f <( sed 's/.*/ &$/' /mnt/d/GENE_LIST.txt) $OutputDir/Sorted_Master_Variants_List.txt >> $OutputDir/new.txt
#grep -w $line /mnt/d/GENE_LIST.txt $OutputDir/Sorted_Master_Variants_List.txt  >> $OutputDir/new.txt
}

new_method
file_stripper
