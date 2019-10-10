#!/bin/bash
#Gene searcher
#Python script asks for gene name then searches FEVR.combined.gemini.db for all hits in that gene

echo "***************"
echo "Mats FEVR Gene Searcher"
echo "***************"

export_SNPs(){
	echo "Extracting variants seen in" $gene_name
	grep -w $gene_name /mnt/d/all_variants.txt >> /mnt/d/${gene_name}_variants.txt
	echo 'chrom	start	end	gene	codon_change	aa_change	rs_ids	max_aaf_all	aaf_exac_all	gerp_bp_score	F10-033	F10-034	F10-035	F10-015	F10-017	F10-018	2542	648	F10-007	628	632	639	615	618	625	467	538	606	429	434	435	F10-028	F10-029	F10-030	F10-016	F10-026	F10-027	4585	4897	5300	2644	F10-021	F10-025	2450	2491	2534	1929	2153	2712	2543	3014	F10_001	F10-004	F10-005	F10-006	2515	3015	F10-003' | cat - /mnt/d/${gene_name}_variants.txt > temp && mv temp /mnt/d/${gene_name}_variants.txt
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
' /mnt/d/${gene_name}_variants.txt /mnt/d/${gene_name}_variants.txt > /mnt/d/${gene_name}_stripped.txt
}

#Get gene name from user
echo "Which gene would you like to search for: "
read gene_name
echo "Gene name entered was"  $gene_name
read -p "Is this correct?" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "yes"
	#Export known SNPs from this list?
	echo "Exporting all known variants seen in the FEVR data set..."
	#Check if the file alredy exists to save time
	if test -f "/mnt/d/all_variants.txt"; then
		echo "file exists"
		export_SNPs
		file_stripper
	else
		gemini query -q "select chrom, start, end, gene, codon_change, aa_change, rs_ids, max_aaf_all, aaf_exac_all, gerp_bp_score, (gts).(*) from variants where impact_severity != 'LOW' AND max_aaf_all < 0.01" --header /mnt/d/hg19/FEVR.combined.gemini.db > /mnt/d/all_variants.txt
		export_SNPs
		file_stripper
	fi
	echo "Complete."
fi

#REWITE TO USE THE FEVR.COMBINED GEMINI DB AND ADD VARIABLES FOR MAX_AAF