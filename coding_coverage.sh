#!/bin/bash
#Script takes file made by batch_coverage.sh and gives coverage for coding regions only
#run ./coding_coverage.sh sample_number eg ./coding_coverage.sh 2450

<<to_add
Add the ability to get co-ordinates from the hg19 whole exome fasta file for genes being searched instead of manually adding them
to_add

echo "***************"
echo "Mats Gene Coverage Calculator"
echo "***************"

Sample=$1

BamFile=/mnt/d/ExoneData/

#Output Directory
OutputDir=/mnt/d/BatchCoverage/$Sample

mkdir  $OutputDir

#Count the coverage only in rows within range
#Genes - hg19 coordinates only
#Subtract one from start and add one to end of coordinates for accuract answers

NDP(){
gene=NDP
echo $gene
#Cut bam
echo "Extracting portion of bam file"
samtools view -b $BamFile/$Sample.recalibrated.sorted.bam "X:43809044-43817892" > /mnt/d/BatchCoverage/$Sample/${Sample}_${gene}_Exons.bam
#Index new bam
echo "Indexing bam file"
samtools index /mnt/d/BatchCoverage/$Sample/${Sample}_${gene}_Exons.bam
#Count coverage
echo "Counting coverage"
samtools depth -Q 0 /mnt/d/BatchCoverage/$Sample/${Sample}_${gene}_Exons.bam > /mnt/d/BatchCoverage/$Sample/${Sample}_${gene}_Exons.txt

#Calculate Max, Min and Mean coverage
printf "Min	Max	Mean\n" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
printf "Exon 1	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=43817717 && $2<=43817892 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 2	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=43809044 && $2<=43809273 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
}

FZD4(){
gene=FZD4
echo $gene
#Cut bam
echo "Extracting portion of bam file"
samtools view -b /mnt/d/$Sample.recalibrated.sorted.bam "11:86662183-86666128" > /mnt/d/BatchCoverage/$Sample/${Sample}_${gene}_Exons.bam
#Index new bam
echo "Indexing bam file"
samtools index /mnt/d/BatchCoverage/$Sample/${Sample}_${gene}_Exons.bam
#Count coverage
echo "Counting coverage"
samtools depth -Q 0 /mnt/d/BatchCoverage/$Sample/${Sample}_${gene}_Exons.bam > /mnt/d/BatchCoverage/$Sample/${Sample}_${gene}_Exons.txt

#Calculate Max, Min and Mean coverage
printf "Min	Max	Mean\n" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
printf "Exon 1	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=86665842 && $2<=86666128 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 2	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=86662183 && $2<=86663513 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
}

LRP5(){
gene=LRP5
echo $gene
#Cut bam
echo "Extracting portion of bam file"
samtools view -b /mnt/d/$Sample.recalibrated.sorted.bam "11:68,080,108-68,216,743" > /mnt/d/BatchCoverage/$Sample/${Sample}_${gene}_Exons.bam
#Index new bam
echo "Indexing bam file"
samtools index /mnt/d/BatchCoverage/$Sample/${Sample}_${gene}_Exons.bam
#Count coverage
echo "Counting coverage"
samtools depth -Q 0 /mnt/d/BatchCoverage/$Sample/${Sample}_${gene}_Exons.bam > /mnt/d/BatchCoverage/$Sample/${Sample}_${gene}_Exons.txt

#Calculate Max, Min and Mean coverage
printf "Min	Max	Mean\n" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
printf "Exon 1	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=68080182 && $2<=68080274 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 2	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=68115314 && $2<=68115314 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 3	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=68125117 && $2<=68125316 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 4	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=68131214 && $2<=68131412 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 5	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=68133038 && $2<=68133171 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 6	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=68153783 && $2<=68154181 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 7	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=68157348 && $2<=68157521 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 8	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=68170950 && $2<=68171168 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 9	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=68173991 && $2<=68174282 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 10	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=68177381 && $2<=68177609 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 11	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=68178903 && $2<=68179089 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 12	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=68181156 && $2<=68181481 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 13	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=68183795 && $2<=68183996 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 14	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=68190956 && $2<=68191165 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 15	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=68192569 && $2<=68192760 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 16	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=68193445 && $2<=68193656 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 17	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=68197042 && $2<=68197169 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 18	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=68201069 && $2<=68201307 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 19	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=68204356 && $2<=68204468 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 20	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=68205913 && $2<=68206151 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 21	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=68207244 && $2<=68207385 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 22	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=68213903 && $2<=68214002 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 23	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=68216276 && $2<=68216539 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
}

TSPAN12(){
gene=TSPAN12
echo $gene
#Cut bam
echo "Extracting portion of bam file"
samtools view -b /mnt/d/$Sample.recalibrated.sorted.bam "7:120,427,374-120,498,177" > /mnt/d/BatchCoverage/$Sample/${Sample}_${gene}_Exons.bam
#Index new bam
echo "Indexing bam file"
samtools index /mnt/d/BatchCoverage/$Sample/${Sample}_${gene}_Exons.bam
#Count coverage
echo "Counting coverage"
samtools depth -Q 0 /mnt/d/BatchCoverage/$Sample/${Sample}_${gene}_Exons.bam > /mnt/d/BatchCoverage/$Sample/${Sample}_${gene}_Exons.txt

#Calculate Max, Min and Mean coverage
printf "Min	Max	Mean\n" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
printf "Exon 1	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=120496751 && $2<=120496818 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 2	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=120480080 && $2<=120480080 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 3	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=120478830 && $2<=120478967 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 4	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=120455782 && $2<=120455858 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 5	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=120450516 && $2<=120450625 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 6	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=120446602 && $2<=120446747 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 7	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=120428645 && $2<=120428952 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
}

ZNF408(){
gene=ZNF408
echo $gene
#Cut bam
echo "Extracting portion of bam file"
samtools view -b /mnt/d/$Sample.recalibrated.sorted.bam "11:46,722,644-46,727,466" > /mnt/d/BatchCoverage/$Sample/${Sample}_${gene}_Exons.bam
#Index new bam
echo "Indexing bam file"
samtools index /mnt/d/BatchCoverage/$Sample/${Sample}_${gene}_Exons.bam
#Count coverage
echo "Counting coverage"
samtools depth -Q 0 /mnt/d/BatchCoverage/$Sample/${Sample}_${gene}_Exons.bam > /mnt/d/BatchCoverage/$Sample/${Sample}_${gene}_Exons.txt

#Calculate Max, Min and Mean coverage
printf "Min	Max	Mean\n" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
printf "Exon 1	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=46722663 && $2<=46722692 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 2	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=46722948 && $2<=46723227 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 3	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=46724253 && $2<=46724316 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 4	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=46724533 && $2<=46724533 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 5	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=46725902 && $2<=46727414 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
}

KIF11(){
gene=KIF11
echo $gene
#Cut bam
echo "Extracting portion of bam file"
samtools view -b /mnt/d/$Sample.recalibrated.sorted.bam "10:94,352,825-94,415,152" > /mnt/d/BatchCoverage/$Sample/${Sample}_${gene}_Exons.bam
#Index new bam
echo "Indexing bam file"
samtools index /mnt/d/BatchCoverage/$Sample/${Sample}_${gene}_Exons.bam
#Count coverage
echo "Counting coverage"
samtools depth -Q 0 /mnt/d/BatchCoverage/$Sample/${Sample}_${gene}_Exons.bam > /mnt/d/BatchCoverage/$Sample/${Sample}_${gene}_Exons.txt

#Calculate Max, Min and Mean coverage
printf "Min	Max	Mean\n" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
printf "Exon 1	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=94353132 && $2<=94353210 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 2	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=94366021 && $2<=94366155 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 3	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=94366375 && $2<=94366474 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 4	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=94366915 && $2<=94366995 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 5	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=94368776 && $2<=94368963 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 6	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=94369141 && $2<=94369267 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 7	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=94372796 && $2<=94372888 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 8	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=94373133 && $2<=94373375 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 9	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=94376493 && $2<=94376590 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 10	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=94381141 && $2<=94381231 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 11	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=94388564 && $2<=94388653 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 12	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=94389932 && $2<=94390122 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 13	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=94392242 && $2<=94392451 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 14	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=94393379 && $2<=94393553 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 15	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=94396940 && $2<=94397067 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 16	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=94397143 && $2<=94397303 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 17	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=94399550 && $2<=94399658 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 18	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=94405119 && $2<=94405400 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 19	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=94407968 && $2<=94408192 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 20	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=94409591 && $2<=94409744 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 21	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=94410157 && $2<=94410275 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 22	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=94413421 && $2<=94413554 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
}

CTNNB1(){
gene=CTNNB1
echo $gene
#Cut bam
echo "Extracting portion of bam file"
samtools view -b /mnt/d/$Sample.recalibrated.sorted.bam "3:41,240,942-41,281,939" > /mnt/d/BatchCoverage/$Sample/${Sample}_${gene}_Exons.bam
#Index new bam
echo "Indexing bam file"
samtools index /mnt/d/BatchCoverage/$Sample/${Sample}_${gene}_Exons.bam
#Count coverage
echo "Counting coverage"
samtools depth -Q 0 /mnt/d/BatchCoverage/$Sample/${Sample}_${gene}_Exons.bam > /mnt/d/BatchCoverage/$Sample/${Sample}_${gene}_Exons.txt

#Calculate Max, Min and Mean coverage
printf "Min	Max	Mean\n" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
printf "Exon 1	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=41265559 && $2<=41265573 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 2	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=41266444 && $2<=41266699 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 3	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=41266824 && $2<=41267064 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 4	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=41267150 && $2<=41267352 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 5	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=41268698 && $2<=41268844 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 6	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=41274831 && $2<=41274936 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 7	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=41275019 && $2<=41275359 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 8	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=41275629 && $2<=41275789 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 9	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=41277214 && $2<=41277335 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 10	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=41277839 && $2<=41277991 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 11	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=41278078 && $2<=41278201 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 12	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=41279506 && $2<=41279568 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 13	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=41280624 && $2<=41280834 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
}

ATOH7(){
gene=ATOH7
echo $gene
#Cut bam
echo "Extracting portion of bam file"
samtools view -b /mnt/d/$Sample.recalibrated.sorted.bam "10:69,990,352-69,991,870" > /mnt/d/BatchCoverage/$Sample/${Sample}_${gene}_Exons.bam
#Index new bam
echo "Indexing bam file"
samtools index /mnt/d/BatchCoverage/$Sample/${Sample}_${gene}_Exons.bam
#Count coverage
echo "Counting coverage"
samtools depth -Q 0 /mnt/d/BatchCoverage/$Sample/${Sample}_${gene}_Exons.bam > /mnt/d/BatchCoverage/$Sample/${Sample}_${gene}_Exons.txt

#Calculate Max, Min and Mean coverage
printf "Min	Max	Mean\n" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
printf "Exon 1	" >> $OutputDir/${Sample}_${gene}_Exon_Coverage.txt
awk '$2>=69990975 && $2<=69991435 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' /mnt/d/BatchCoverage/${Sample}/${Sample}_${gene}_Exons.txt >>$OutputDir/${Sample}_${gene}_Exon_Coverage.txt
}


#Genes to run
NDP
#FZD4
#LRP5
#TSPAN12
#ZNF408
#KIF11
#CTNNB1
#ATOH7