#!/bin/bash
#Script searches FEVR master Gemini DB for variants in genes found in Gene List

echo "***************"
echo "Mats FEVR Mutation Searcher"
echo "***************"

#Gemini DB to search
GeminiToSearch=/mnt/d/hg19/FEVR.combined.gemini.db

#Output Directory
OutputDir=/mnt/d/FEVR_Searcher
mkdir $OutputDir

#List of Genes
GeneList=/mnt/d/JR_gene_list.txt
dos2unix $GeneList
 
gemini query -q "select chrom, start, end, gene, codon_change, aa_change, rs_ids, max_aaf_all, aaf_exac_all, gerp_bp_score, impact, (gts).(*) from variants where impact_severity != 'LOW' AND max_aaf_all < 0.01" --header $GeminiToSearch > $OutputDir/FEVR.Combined.Variants.txt

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
' $OutputDir/FEVR_genes.txt  $OutputDir/FEVR_genes.txt > $OutputDir/FEVR_genes_cut.txt 
}

#Cut 1st line from $OutputDir/FEVR.Combined.Variants.txt to get headers
awk 'NR == 1' $OutputDir/FEVR.Combined.Variants.txt >>$OutputDir/FEVR_genes.txt

while IFS="" read -r gene_name || [ -n "$gene_name" ]
do
echo "$gene_name"
#Cross reference gene list and export to FEVR_genes.txt
#grep "/bin/bash" /etc/passwd | cut -d'|' -s -f1
grep -Fwf $GeneList $OutputDir/FEVR.Combined.Variants.txt >> $OutputDir/FEVR_genes.txt 

done < $GeneList

file_stripper