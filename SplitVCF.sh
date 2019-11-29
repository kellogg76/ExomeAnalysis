#!/bin/bash
echo "***************"
echo "Mats VCF File Splitter"
echo "***************"

#VCF file to be split
vcf_file=1_S1.vcf

#Name of new output file
file=1_S1_

#Enter Chromosome range that needs splitting 
for chr in {1..22};
do
 echo "Splitting $vcf_file Chromosome $chr"
 grep -w "^#\|^#CHROM\|^chr$chr" $vcf_file > $file"Chr"$chr.vcf
done

echo "Finished."