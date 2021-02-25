#!/bin/bash
#Script  searches a gemini.db for all hits in that gene
#./gene_serarcher.sh CTC1

<<to_add
to_add

echo "***************"
echo "Mats Gene Searcher"
echo "***************"

gene_name=$1

#Output Directory
OutputDir=/mnt/d/Gene_Searcher
mkdir $OutputDir

#Gemini Database File
GeminiDB=/mnt/d/hg19/FEVR1-17.gemini.db

#Max alternate allele frequency
#1% = 0.01
max_aaf=0.01

export_SNPs(){
#Add header first
 echo "Getting headers..."
    (head -1 $OutputDir/all_variants.txt) >> $OutputDir/${gene_name}_variants.txt
	echo "Extracting variants seen in" $gene_name
	grep -w $gene_name $OutputDir/all_variants.txt >> $OutputDir/${gene_name}_variants.txt
}

file_stripper(){
#Strips out samples where the variants were not seen to make it more readable.
echo "Stripping file of unneeded data..."
awk -v na="./." '
BEGIN{OFS=FS="\t"}
NR==FNR && NR>1 {
  for(i=1;i<=NF;i++){if($i!=na){s[i]=1}}
}
NR!=FNR {
  for(l in s){true} 
  for(i in s){if (i!=l){printf "%s"OFS,$i} else {printf "%s\n",$i}}
}
' $OutputDir/${gene_name}_variants.txt $OutputDir/${gene_name}_variants.txt > $OutputDir/${gene_name}_stripped.txt
}
echo "Searching $GeminiDB for variants"
echo    # (optional) move to a new line
#Export known SNPs from this gene
echo "Exporting all known variants seen in the data set..."
gemini query -q "select chrom, start, end, gene, codon_change, aa_change, rs_ids, max_aaf_all, aaf_exac_all, gerp_bp_score, (gts).(*) from variants where impact_severity != 'LOW' AND max_aaf_all < $max_aaf" --header $GeminiDB > $OutputDir/all_variants.txt
export_SNPs
file_stripper
echo "All files from this export can be found in $OutputDir"
echo "Complete."