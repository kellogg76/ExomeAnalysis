#!/bin/bash
#Script asks for gene name then searches a gemini.db for all hits in that gene

echo "***************"
echo "Mats FEVR Gene Searcher"
echo "***************"

#Output Directory
OutputDir=/mnt/d/GeneSearcher
mkdir $OutputDir

#Gemini Database File
GeminiDB=/mnt/d/hg19/FEVR.combined.gemini.db

export_SNPs(){
	echo "Extracting variants seen in" $gene_name
	grep -w $gene_name $OutputDir/all_variants.txt >> $OutputDir/${gene_name}_variants.txt
	echo 'chrom	start	end	gene	codon_change	aa_change	rs_ids	max_aaf_all	aaf_exac_all	gerp_bp_score	F10-033	F10-034	F10-035	F10-015	F10-017	F10-018	2542	648	F10-007	628	632	639	615	618	625	467	538	606	429	434	435	F10-028	F10-029	F10-030	F10-016	F10-026	F10-027	4585	4897	5300	2644	F10-021	F10-025	2450	2491	2534	1929	2153	2712	2543	3014	F10_001	F10-004	F10-005	F10-006	2515	3015	F10-003' | cat - $OutputDir/${gene_name}_variants.txt > temp && mv temp $OutputDir/${gene_name}_variants.txt
}

file_stripper(){
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

#Get gene name from user
echo "Which gene would you like to search for: "
read gene_name
echo "Gene name entered was"  $gene_name
read -p "Is this correct? (y/n) " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "yes"
	#Export known SNPs from this gene
	echo "Exporting all known variants seen in the data set..."
	#Check if the file alredy exists to save time
	if test -f "$OutputDir/all_variants.txt"; then
		echo "file exists"
		export_SNPs
		file_stripper
	else
		gemini query -q "select chrom, start, end, gene, codon_change, aa_change, rs_ids, max_aaf_all, aaf_exac_all, gerp_bp_score, (gts).(*) from variants where impact_severity != 'LOW' AND max_aaf_all < 0.01" --header $GeminiDB > $OutputDir/all_variants.txt
		export_SNPs
		file_stripper
		echo "All files from this search can be found in $OutputDir"
	fi
	echo "Complete."
fi

#ADD VARIABLES FOR MAX_AAF
#Change line 18 so it gets the header from elsewhere so it's always current