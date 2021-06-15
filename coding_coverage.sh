#!/bin/bash
#Script gives coverage for coding regions only of FEVR genes listed within the script and provides output for R script to plot coverage
#run ./coding_coverage.sh sample_number eg ./coding_coverage.sh 2450

<<to_add
Add the ability to get co-ordinates from the hg19 whole exome fasta file for genes being searched instead of manually adding them
Check if the donkey work has already been done
to_add

echo "***************"
echo "Mats Gene Coverage Calculator"
echo "***************"

sample1=$1

#Paths to files
DataPath=/mnt/d/Exome_Coverage

#Batch_Coverage Files
BatchFiles=/mnt/d/Batch_Coverage

#Bam file name
BamToSearch=$DataPath/${sample1}.recalibrated.sorted.bam

#Output Directory
OutputDir=$BatchFiles/$sample1

mkdir  -p $OutputDir

#Count the coverage only in rows within range
#Genes - hg19 coordinates only
#Subtract one from start and add one to end of coordinates for accuract answers

NDP(){
gene=NDP
echo $gene
#Cut bam
echo "Extracting portion of bam file"
samtools view -b $BamToSearch "X:43809044-43817892" > $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam
#Index new bam
echo "Indexing bam file"
samtools index $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam
#Count coverage
echo "Counting coverage"
samtools depth -Q 0 $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam > $BatchFiles/$sample1/${sample1}_${gene}_Exons.txt

#Calculate Max, Min and Mean coverage
printf "Min	Max	Mean\n" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
printf "Exon 1	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=43817718 && $2<=43817891 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 2	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=43809045 && $2<=43809272 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
}

FZD4(){
gene=FZD4
echo $gene
#Cut bam
echo "Extracting portion of bam file"
samtools view -b $BamToSearch "11:86662183-86666128" > $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam
#Index new bam
echo "Indexing bam file"
samtools index $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam
#Count coverage
echo "Counting coverage"
samtools depth -Q 0 $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam > $BatchFiles/$sample1/${sample1}_${gene}_Exons.txt

#Calculate Max, Min and Mean coverage
printf "Min	Max	Mean\n" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
printf "Exon 1	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=86665842 && $2<=86666128 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 2	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=86662183 && $2<=86663513 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
}

LRP5(){
gene=LRP5
echo $gene
#Cut bam
echo "Extracting portion of bam file"
samtools view -b $BamToSearch "11:68,080,108-68,216,743" > $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam
#Index new bam
echo "Indexing bam file"
samtools index $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam
#Count coverage
echo "Counting coverage"
samtools depth -Q 0 $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam > $BatchFiles/$sample1/${sample1}_${gene}_Exons.txt

#Calculate Max, Min and Mean coverage
printf "Min	Max	Mean\n" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
printf "Exon 1	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=68080182 && $2<=68080274 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 2	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=68115314 && $2<=68115713 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 3	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=68125117 && $2<=68125316 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 4	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=68131214 && $2<=68131412 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 5	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=68133038 && $2<=68133171 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 6	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=68153783 && $2<=68154181 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 7	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=68157348 && $2<=68157521 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 8	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=68170950 && $2<=68171168 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 9	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=68173991 && $2<=68174282 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 10	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=68177381 && $2<=68177609 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 11	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=68178903 && $2<=68179089 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 12	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=68181156 && $2<=68181481 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 13	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=68183795 && $2<=68183996 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 14	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=68190956 && $2<=68191165 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 15	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=68192569 && $2<=68192760 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 16	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=68193445 && $2<=68193656 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 17	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=68197042 && $2<=68197169 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 18	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=68201069 && $2<=68201307 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 19	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=68204356 && $2<=68204468 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 20	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=68205913 && $2<=68206151 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 21	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=68207244 && $2<=68207385 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 22	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=68213903 && $2<=68214002 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 23	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=68216276 && $2<=68216539 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
}

TSPAN12(){
gene=TSPAN12
echo $gene
#Cut bam
echo "Extracting portion of bam file"
samtools view -b $BamToSearch "7:120,427,374-120,498,177" > $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam
#Index new bam
echo "Indexing bam file"
samtools index $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam
#Count coverage
echo "Counting coverage"
samtools depth -Q 0 $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam > $BatchFiles/$sample1/${sample1}_${gene}_Exons.txt

#Calculate Max, Min and Mean coverage
printf "Min	Max	Mean\n" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
printf "Exon 1	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=120496751 && $2<=120496818 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 2	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=120480080 && $2<=120480163 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 3	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=120478830 && $2<=120478967 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 4	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=120455782 && $2<=120455858 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 5	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=120450516 && $2<=120450625 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 6	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=120446602 && $2<=120446747 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 7	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=120428645 && $2<=120428952 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
}

ZNF408(){
gene=ZNF408
echo $gene
#Cut bam
echo "Extracting portion of bam file"
samtools view -b $BamToSearch "11:46,722,644-46,727,466" > $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam
#Index new bam
echo "Indexing bam file"
samtools index $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam
#Count coverage
echo "Counting coverage"
samtools depth -Q 0 $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam > $BatchFiles/$sample1/${sample1}_${gene}_Exons.txt

#Calculate Max, Min and Mean coverage
printf "Min	Max	Mean\n" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
printf "Exon 1	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=46722664 && $2<=46722691 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 2	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=46722949 && $2<=46723226 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 3	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=46724254 && $2<=46724315 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 4	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=46724534 && $2<=46724793 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 5	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=46725903 && $2<=46727413 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
}

KIF11(){
gene=KIF11
echo $gene
#Cut bam
echo "Extracting portion of bam file"
samtools view -b $BamToSearch "10:94,352,825-94,415,152" > $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam
#Index new bam
echo "Indexing bam file"
samtools index $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam
#Count coverage
echo "Counting coverage"
samtools depth -Q 0 $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam > $BatchFiles/$sample1/${sample1}_${gene}_Exons.txt

#Calculate Max, Min and Mean coverage
printf "Min	Max	Mean\n" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
printf "Exon 1	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=94353132 && $2<=94353210 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 2	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=94366021 && $2<=94366155 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 3	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=94366375 && $2<=94366474 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 4	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=94366915 && $2<=94366995 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 5	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=94368776 && $2<=94368963 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 6	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=94369141 && $2<=94369267 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 7	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=94372796 && $2<=94372888 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 8	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=94373133 && $2<=94373375 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 9	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=94376493 && $2<=94376590 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 10	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=94381141 && $2<=94381231 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 11	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=94388564 && $2<=94388653 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 12	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=94389932 && $2<=94390122 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 13	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=94392242 && $2<=94392451 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 14	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=94393379 && $2<=94393553 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 15	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=94396940 && $2<=94397067 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 16	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=94397143 && $2<=94397303 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 17	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=94399550 && $2<=94399658 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 18	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=94405119 && $2<=94405400 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 19	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=94407968 && $2<=94408192 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 20	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=94409591 && $2<=94409744 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 21	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=94410157 && $2<=94410275 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 22	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=94413421 && $2<=94413554 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
}

CTNNB1(){
gene=CTNNB1
echo $gene
#Cut bam
echo "Extracting portion of bam file"
samtools view -b $BamToSearch "3:41,240,942-41,281,939" > $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam
#Index new bam
echo "Indexing bam file"
samtools index $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam
#Count coverage
echo "Counting coverage"
samtools depth -Q 0 $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam > $BatchFiles/$sample1/${sample1}_${gene}_Exons.txt

#Calculate Max, Min and Mean coverage
printf "Min	Max	Mean\n" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
printf "Exon 1	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=41265559 && $2<=41265573 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 2	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=41266017 && $2<=41266244 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 3	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=41266444 && $2<=41266699 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 4	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=41266824 && $2<=41267064 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 5	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=41267150 && $2<=41267352 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 6	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=41268698 && $2<=41268844 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 7	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=41274831 && $2<=41274936 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 8	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=41275019 && $2<=41275359 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 9	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=41275629 && $2<=41275789 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 10	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=41277214 && $2<=41277335 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 11	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=41277839 && $2<=41277991 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 12	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=41278078 && $2<=41278201 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 13	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=41279506 && $2<=41279568 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 14	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=41280624 && $2<=41280834 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
}

ATOH7(){
gene=ATOH7
echo $gene
#Cut bam
echo "Extracting portion of bam file"
samtools view -b $BamToSearch "10:69,990,352-69,991,870" > $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam
#Index new bam
echo "Indexing bam file"
samtools index $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam
#Count coverage
echo "Counting coverage"
samtools depth -Q 0 $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam > $BatchFiles/$sample1/${sample1}_${gene}_Exons.txt

#Calculate Max, Min and Mean coverage
printf "Min	Max	Mean\n" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
printf "Exon 1	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=69990976 && $2<=69991434 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
}

ILK(){
gene=ILK
echo $gene
#Cut bam
echo "Extracting portion of bam file"
samtools view -b $BamToSearch "11:6,625,502-6,631,842" > $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam
#Index new bam
echo "Indexing bam file"
samtools index $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam
#Count coverage
echo "Counting coverage"
samtools depth -Q 0 $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam > $BatchFiles/$sample1/${sample1}_${gene}_Exons.txt

#Calculate Max, Min and Mean coverage
printf "Min	Max	Mean\n" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
printf "Exon 1	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=6625502 && $2<=6625590  {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt

#Count coverage
printf "Exon 2	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=6629276 && $2<=6629441  {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 3	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=6629624  && $2<=6629719  {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 4	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=6629924 && $2<=6630020  {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 5	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=6630115 && $2<=6630198  {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 6	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=6630302 && $2<=6630387  {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 7	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=6630530 && $2<=6630639  {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 8	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=6630743 && $2<=6630870  {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 9	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=6630955 && $2<=6631076  {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 10	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=6631167 && $2<=6631266  {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 11	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=6631379 && $2<=6631509  {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 12	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=6631693 && $2<=6631842  {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
}

JAG1(){
gene=JAG1
echo $gene
#Cut bam
echo "Extracting portion of bam file"
samtools view -b $BamToSearch "20:10,616,332-10,656,647" > $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam
#Index new bam
echo "Indexing bam file"
samtools index $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam
#Count coverage
echo "Counting coverage"
samtools depth -Q 0 $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam > $BatchFiles/$sample1/${sample1}_${gene}_Exons.txt

#Calculate Max, Min and Mean coverage
printf "Min	Max	Mean\n" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
printf "Exon 1	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=10654098 && $2<=10654178   {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt

#Count coverage
printf "Exon 2	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=10653349 && $2<=10653654   {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 3	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=10644611  && $2<=10644662   {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 4	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=10639116 && $2<=10639370   {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 5	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=10637046 && $2<=10637106   {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 6	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=10633116 && $2<=10633246   {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 7	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=10632779 && $2<=10632898   {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 8	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=10632229 && $2<=10632342   {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 9	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=10630895 && $2<=10631008   {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 10	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=10630170 && $2<=10630283   {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 11	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=10629709 && $2<=10629755   {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 12	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=10629197 && $2<=10629370   {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 13	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=10628608 && $2<=10628758    {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 14	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=10627587  && $2<=10627751    {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 15	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=10626619  && $2<=10626732    {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 16	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=10626004 && $2<=10626117    {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 17	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=10625791 && $2<=10625904    {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 18	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=10625511 && $2<=10625627    {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 19	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=10625005 && $2<=10625032    {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 20	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=10624426 && $2<=10624511    {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 21	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=10623136 && $2<=10623249    {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 22	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=10622431 && $2<=10622540    {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 23	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=10622108 && $2<=10622341    {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 24	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=10621761 && $2<=10621892    {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 25	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=10621431 && $2<=10621581    {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
#Count coverage
printf "Exon 26	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=10620146 && $2<=10620603     {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
}

#####Standard Genes#####

KLF17(){
gene=KLF17
echo $gene
#Cut bam
echo "Extracting portion of bam file"
samtools view -b $BamToSearch "1:44596184-44596428" > $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam
#Index new bam
echo "Indexing bam file"
samtools index $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam
#Count coverage
echo "Counting coverage"
samtools depth -Q 0 $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam > $BatchFiles/$sample1/${sample1}_${gene}_Exons.txt

#Calculate Max, Min and Mean coverage
printf "Min	Max	Mean\n" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
printf "Exon 3	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=44596184 && $2<=44596428 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
}

HOXD4(){
gene=HOXD4
echo $gene
#Cut bam
echo "Extracting portion of bam file"
samtools view -b $BamToSearch "2:177017336-177017670" > $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam
#Index new bam
echo "Indexing bam file"
samtools index $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam
#Count coverage
echo "Counting coverage"
samtools depth -Q 0 $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam > $BatchFiles/$sample1/${sample1}_${gene}_Exons.txt

#Calculate Max, Min and Mean coverage
printf "Min	Max	Mean\n" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
printf "Exon 2	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=177017336 && $2<=177017670 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
}

METTL14(){
gene=METTL14
echo $gene
#Cut bam
echo "Extracting portion of bam file"
samtools view -b $BamToSearch "4:119626766-119626976" > $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam
#Index new bam
echo "Indexing bam file"
samtools index $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam
#Count coverage
echo "Counting coverage"
samtools depth -Q 0 $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam > $BatchFiles/$sample1/${sample1}_${gene}_Exons.txt

#Calculate Max, Min and Mean coverage
printf "Min	Max	Mean\n" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
printf "Exon 10	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=119626766 && $2<=119626976 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
}

CNBD1(){
gene=CNBD1
echo $gene
#Cut bam
echo "Extracting portion of bam file"
samtools view -b $BamToSearch "8:87951824-87951982" > $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam
#Index new bam
echo "Indexing bam file"
samtools index $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam
#Count coverage
echo "Counting coverage"
samtools depth -Q 0 $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam > $BatchFiles/$sample1/${sample1}_${gene}_Exons.txt

#Calculate Max, Min and Mean coverage
printf "Min	Max	Mean\n" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
printf "Exon 4	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=87951824 && $2<=87951982 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
}

MBD2(){
gene=MBD2
echo $gene
#Cut bam
echo "Extracting portion of bam file"
samtools view -b $BamToSearch "18:51731368-51731527" > $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam
#Index new bam
echo "Indexing bam file"
samtools index $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam
#Count coverage
echo "Counting coverage"
samtools depth -Q 0 $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam > $BatchFiles/$sample1/${sample1}_${gene}_Exons.txt

#Calculate Max, Min and Mean coverage
printf "Min	Max	Mean\n" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
printf "Exon 2	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=51731368 && $2<=51731527 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
}

URB1(){
gene=URB1
echo $gene
#Cut bam
echo "Extracting portion of bam file"
samtools view -b $BamToSearch "21:33719265-33720120" > $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam
#Index new bam
echo "Indexing bam file"
samtools index $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam
#Count coverage
echo "Counting coverage"
samtools depth -Q 0 $BatchFiles/$sample1/${sample1}_${gene}_Exons.bam > $BatchFiles/$sample1/${sample1}_${gene}_Exons.txt

#Calculate Max, Min and Mean coverage
printf "Min	Max	Mean\n" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
printf "Exon 22	" >> $OutputDir/${sample1}_${gene}_Exon_Coverage.txt
awk '$2>=33719265 && $2<=33720120 {cnt++;sum += $3; min = ( (cnt == 1) || ($3 < min) ? $3 : min ); max = ( (cnt == 1) || ($3 > max) ? $3 : max )}END {print min+0, max+0, (cnt ? sum / cnt : 0)}' $BatchFiles/${sample1}/${sample1}_${gene}_Exons.txt >>$OutputDir/${sample1}_${gene}_Exon_Coverage.txt
}

#Genes to run
#NDP
#FZD4
#LRP5
#TSPAN12
#ZNF408
#KIF11
#CTNNB1
#ATOH7
#ILK
#JAG1
#Standard Genes
KLF17
HOXD4
METTL14
CNBD1
MBD2
URB1

echo "All files from this export can be found in $OutputDir"