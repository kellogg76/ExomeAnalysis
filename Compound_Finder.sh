#!/bin/bash
#Script searches master Gemini DB for compound heterozygotes in genes found in Gene List
#./Compound_Finder.sh

echo "***************"
echo "Mats Compound Het Searcher"
echo "***************"

#VCF that's been indexed by Gemini to search
VCFToSearch=/mnt/d/FEVR1-33.combined.vcf.gz
#VCFToSearch=/mnt/d/Mat.haplotypecaller.g.vcf.gz

#Gemini DB to create
GeminiToCreate=/mnt/d/compound_finder.gemini.db

# load a VCF that has been annotated by snpEff
#gemini load -v $VCFToSearch -t snpEff $GeminiToCreate

# extract candidate compound hets
gemini comp_hets $GeminiToCreate

# restrict to compound hets that are clearly loss-of-function
#gemini comp_hets --only_lof $GeminiToCreate


######Doesn't work