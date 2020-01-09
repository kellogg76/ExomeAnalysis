#!/bin/bash
#Script takes file made by batch_coverage.sh and gives coverage for coding regions only
#run ./coding_coverage2.sh sample_number eg ./coding_coverage2.sh 2450

echo "***************"
echo "Mats Gene Coverage Calculator"
echo "***************"

Sample=$1
samples(){
2450
2515
2644
4897
5300
F10-018
F10-030
F10-035
}

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
samtools view -b /mnt/d/$Sample.recalibrated.sorted.bam "X:43809044-43817892" > /mnt/d/BatchCoverage/$Sample/${Sample}_${gene}_Exons.bam
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


#gene=NDP
#echo "Calculating for $gene"
#echo $(date -u) >> $OutputDir/NDP_Exon_Coverage.txt
#echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"  >> $OutputDir/NDP_Exon_Coverage.txt
##Calculate Max, Min and Mean coverage
##printf "Min, Max, Mean Coding Coverage\n" >> $OutputDir/NDP_Exon_Coverage.txt
#printf "Exon 1	" >> $OutputDir/NDP_Exon_Coverage.txt
#sort -k4n,4 /mnt/d/BatchCoverage/$Sample/NDP_total_exon_coverage.txt | awk '$2>=43817717 && $2<=43817892{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/NDP_Exon_Coverage.txt
#printf "Exon 2	" >> $OutputDir/NDP_Exon_Coverage.txt
#sort -k4n,4 /mnt/d/BatchCoverage/$Sample/NDP_total_exon_coverage.txt | awk '$2>=43809044 && $2<=43809273{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/NDP_Exon_Coverage.txt
#printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >>$OutputDir/NDP_Exon_Coverage.txt
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


#gene=FZD4
#echo "Calculating for $gene"
#echo $(date -u) >> $OutputDir/FZD4_Exon_Coverage.txt
#echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"  >> $OutputDir/FZD4_Exon_Coverage.txt
#Calculate Max, Min and Mean coverage
#printf "Min, Max, Mean Coding Coverage\n" >> $OutputDir/FZD4_Exon_Coverage.txt
#printf "Exon 1	" >> $OutputDir/FZD4_Exon_Coverage.txt
#sort -k4n,4 /mnt/d/BatchCoverage/$Sample/FZD4_total_exon_coverage.txt | awk '$2>=86665842 && $2<=86666128{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/FZD4_Exon_Coverage.txt
#printf "Exon 2	" >> $OutputDir/FZD4_Exon_Coverage.txt
#sort -k4n,4 /mnt/d/BatchCoverage/$Sample/FZD4_total_exon_coverage.txt | awk '$2>=86662183 && $2<=86663513{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/FZD4_Exon_Coverage.txt
#printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >>$OutputDir/FZD4_Exon_Coverage.txt
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

<<old_script
gene=LRP5
echo "Calculating for $gene"
echo $(date -u) >> $OutputDir/LRP5_Exon_Coverage.txt
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"  >> $OutputDir/LRP5_Exon_Coverage.txt
#Calculate Max, Min and Mean coverage
printf "Min, Max, Mean Coding Coverage\n" >> $OutputDir/LRP5_Exon_Coverage.txt
printf "Exon 1	" >> $OutputDir/LRP5_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/LRP5_total_exon_coverage.txt | awk '$2>=68080182 && $2<=68080274{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/LRP5_Exon_Coverage.txt
printf "Exon 2	" >> $OutputDir/LRP5_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/LRP5_total_exon_coverage.txt | awk '$2>=68115314&& $2<=68115712{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/LRP5_Exon_Coverage.txt
printf "Exon 3	" >> $OutputDir/LRP5_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/LRP5_total_exon_coverage.txt | awk '$2>=68125117 && $2<=68125316{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/LRP5_Exon_Coverage.txt
printf "Exon 4	" >> $OutputDir/LRP5_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/LRP5_total_exon_coverage.txt | awk '$2>=68131214 && $2<=68131412{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/LRP5_Exon_Coverage.txt
printf "Exon 5	" >> $OutputDir/LRP5_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/LRP5_total_exon_coverage.txt | awk '$2>=68133038 && $2<=68133171{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/LRP5_Exon_Coverage.txt
printf "Exon 6	" >> $OutputDir/LRP5_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/LRP5_total_exon_coverage.txt | awk '$2>=68153783 && $2<=68154181{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/LRP5_Exon_Coverage.txt
printf "Exon 7	" >> $OutputDir/LRP5_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/LRP5_total_exon_coverage.txt | awk '$2>=68157348 && $2<=68157521{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/LRP5_Exon_Coverage.txt
printf "Exon 8	" >> $OutputDir/LRP5_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/LRP5_total_exon_coverage.txt | awk '$2>=68170950 && $2<=68171168{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/LRP5_Exon_Coverage.txt
printf "Exon 9	" >> $OutputDir/LRP5_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/LRP5_total_exon_coverage.txt | awk '$2>=68173991 && $2<=68174282{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/LRP5_Exon_Coverage.txt
printf "Exon 10	" >> $OutputDir/LRP5_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/LRP5_total_exon_coverage.txt | awk '$2>=68177381 && $2<=68177609{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/LRP5_Exon_Coverage.txt
printf "Exon 11	" >> $OutputDir/LRP5_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/LRP5_total_exon_coverage.txt | awk '$2>=68178903 && $2<=68179089{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/LRP5_Exon_Coverage.txt
printf "Exon 12	" >> $OutputDir/LRP5_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/LRP5_total_exon_coverage.txt | awk '$2>=68181156 && $2<=68181481{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/LRP5_Exon_Coverage.txt
printf "Exon 13	" >> $OutputDir/LRP5_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/LRP5_total_exon_coverage.txt | awk '$2>=68183795 && $2<=68183996{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/LRP5_Exon_Coverage.txt
printf "Exon 14	" >> $OutputDir/LRP5_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/LRP5_total_exon_coverage.txt | awk '$2>=68190956 && $2<=68192761{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/LRP5_Exon_Coverage.txt
printf "Exon 15	" >> $OutputDir/LRP5_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/LRP5_total_exon_coverage.txt | awk '$2>=68192569 && $2<=68192760{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/LRP5_Exon_Coverage.txt
printf "Exon 16	" >> $OutputDir/LRP5_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/LRP5_total_exon_coverage.txt | awk '$2>=68193445 && $2<=68193656{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/LRP5_Exon_Coverage.txt
printf "Exon 17	" >> $OutputDir/LRP5_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/LRP5_total_exon_coverage.txt | awk '$2>=68197042 && $2<=68197169{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/LRP5_Exon_Coverage.txt
printf "Exon 18	" >> $OutputDir/LRP5_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/LRP5_total_exon_coverage.txt | awk '$2>=68201069 && $2<=68201307{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/LRP5_Exon_Coverage.txt
printf "Exon 19	" >> $OutputDir/LRP5_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/LRP5_total_exon_coverage.txt | awk '$2>=68204356 && $2<=68204468{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/LRP5_Exon_Coverage.txt
printf "Exon 20	" >> $OutputDir/LRP5_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/LRP5_total_exon_coverage.txt | awk '$2>=68205913 && $2<=68206151{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/LRP5_Exon_Coverage.txt
printf "Exon 21	" >> $OutputDir/LRP5_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/LRP5_total_exon_coverage.txt | awk '$2>=68207244 && $2<=68207385{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/LRP5_Exon_Coverage.txt
printf "Exon 22	" >> $OutputDir/LRP5_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/LRP5_total_exon_coverage.txt | awk '$2>=68213903 && $2<=68214002{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/LRP5_Exon_Coverage.txt
printf "Exon 23	" >> $OutputDir/LRP5_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/LRP5_total_exon_coverage.txt | awk '$2>=68216276 && $2<=68216539{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/LRP5_Exon_Coverage.txt
printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >>$OutputDir/LRP5_Exon_Coverage.txt
old_script
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

<<old_script
gene=TSPAN12
echo "Calculating for $gene"
echo $(date -u) >> $OutputDir/TSPAN12_Exon_Coverage.txt
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"  >> $OutputDir/TSPAN12_Exon_Coverage.txt
#Calculate Max, Min and Mean coverage
printf "Min, Max, Mean Coding Coverage\n" >> $OutputDir/TSPAN12_Exon_Coverage.txt
printf "Exon 1	" >> $OutputDir/TSPAN12_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/TSPAN12_total_exon_coverage.txt | awk '$2>=120496751 && $2<=120496818{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/TSPAN12_Exon_Coverage.txt
printf "Exon 2	" >> $OutputDir/TSPAN12_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/TSPAN12_total_exon_coverage.txt | awk '$2>=120480080 && $2<=120480164{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/TSPAN12_Exon_Coverage.txt
printf "Exon 3	" >> $OutputDir/TSPAN12_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/TSPAN12_total_exon_coverage.txt | awk '$2>=120478830 && $2<=120478967{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/TSPAN12_Exon_Coverage.txt
printf "Exon 4	" >> $OutputDir/TSPAN12_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/TSPAN12_total_exon_coverage.txt | awk '$2>=120455782 && $2<=120455858{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/TSPAN12_Exon_Coverage.txt
printf "Exon 5	" >> $OutputDir/TSPAN12_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/TSPAN12_total_exon_coverage.txt | awk '$2>=120450516 && $2<=120450625{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/TSPAN12_Exon_Coverage.txt
printf "Exon 6	" >> $OutputDir/TSPAN12_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/TSPAN12_total_exon_coverage.txt | awk '$2>=120446602 && $2<=120446747{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/TSPAN12_Exon_Coverage.txt
printf "Exon 7	" >> $OutputDir/TSPAN12_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/TSPAN12_total_exon_coverage.txt | awk '$2>=120428645 && $2<=120428952{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/TSPAN12_Exon_Coverage.txt
printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >>$OutputDir/TSPAN12_Exon_Coverage.txt
old_script
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

<<old_script
gene=ZNF408
echo "Calculating for $gene"
echo $(date -u) >> $OutputDir/ZNF408_Exon_Coverage.txt
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"  >> $OutputDir/ZNF408_Exon_Coverage.txt
#Calculate Max, Min and Mean coverage
printf "Min, Max, Mean Coding Coverage\n" >> $OutputDir/ZNF408_Exon_Coverage.txt
printf "Exon 1	" >> $OutputDir/ZNF408_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/ZNF408_total_exon_coverage.txt | awk '$2>=46722663 && $2<=46722692{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/ZNF408_Exon_Coverage.txt
printf "Exon 2	" >> $OutputDir/ZNF408_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/ZNF408_total_exon_coverage.txt | awk '$2>=46722948 && $2<=46723227{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/ZNF408_Exon_Coverage.txt
printf "Exon 3	" >> $OutputDir/ZNF408_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/ZNF408_total_exon_coverage.txt | awk '$2>=46724253 && $2<=46724316{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/ZNF408_Exon_Coverage.txt
printf "Exon 4	" >> $OutputDir/ZNF408_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/ZNF408_total_exon_coverage.txt | awk '$2>=46724533 && $2<=46724794{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/ZNF408_Exon_Coverage.txt
printf "Exon 5	" >> $OutputDir/ZNF408_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/ZNF408_total_exon_coverage.txt | awk '$2>=46725902 && $2<=46727414{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/ZNF408_Exon_Coverage.txt
printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >>$OutputDir/ZNF408_Exon_Coverage.txt
old_script
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

<<old_script
gene=KIF11
echo "Calculating for $gene"
echo $(date -u) >> $OutputDir/KIF11_Exon_Coverage.txt
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"  >> $OutputDir/KIF11_Exon_Coverage.txt
#Calculate Max, Min and Mean coverage
printf "Min, Max, Mean Coding Coverage\n" >> $OutputDir/KIF11_Exon_Coverage.txt
printf "Exon 1	" >> $OutputDir/KIF11_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/KIF11_total_exon_coverage.txt | awk '$2>=94353132 && $2<=94353210{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/KIF11_Exon_Coverage.txt
printf "Exon 2	" >> $OutputDir/KIF11_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/KIF11_total_exon_coverage.txt | awk '$2>=94366021 && $2<=94366155{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/KIF11_Exon_Coverage.txt
printf "Exon 3	" >> $OutputDir/KIF11_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/KIF11_total_exon_coverage.txt | awk '$2>=94366375 && $2<=94366474{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/KIF11_Exon_Coverage.txt
printf "Exon 4	" >> $OutputDir/KIF11_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/KIF11_total_exon_coverage.txt | awk '$2>=94366915 && $2<=94366995{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/KIF11_Exon_Coverage.txt
printf "Exon 5	" >> $OutputDir/KIF11_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/KIF11_total_exon_coverage.txt | awk '$2>=94368776 && $2<=94368963{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/KIF11_Exon_Coverage.txt
printf "Exon 6	" >> $OutputDir/KIF11_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/KIF11_total_exon_coverage.txt | awk '$2>=94369141 && $2<=94369267{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/KIF11_Exon_Coverage.txt
printf "Exon 7	" >> $OutputDir/KIF11_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/KIF11_total_exon_coverage.txt | awk '$2>=94372796 && $2<=94372888{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/KIF11_Exon_Coverage.txt
printf "Exon 8	" >> $OutputDir/KIF11_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/KIF11_total_exon_coverage.txt | awk '$2>=94373133 && $2<=94373375{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/KIF11_Exon_Coverage.txt
printf "Exon 9	" >> $OutputDir/KIF11_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/KIF11_total_exon_coverage.txt | awk '$2>=94376493 && $2<=94376590{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/KIF11_Exon_Coverage.txt
printf "Exon 10	" >> $OutputDir/KIF11_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/KIF11_total_exon_coverage.txt | awk '$2>=94381141 && $2<=94381231{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/KIF11_Exon_Coverage.txt
printf "Exon 11	" >> $OutputDir/KIF11_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/KIF11_total_exon_coverage.txt | awk '$2>=94388564 && $2<=94388653{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/KIF11_Exon_Coverage.txt
printf "Exon 12	" >> $OutputDir/KIF11_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/KIF11_total_exon_coverage.txt | awk '$2>=94389932 && $2<=94390122{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/KIF11_Exon_Coverage.txt
printf "Exon 13	" >> $OutputDir/KIF11_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/KIF11_total_exon_coverage.txt | awk '$2>=94392242 && $2<=94392451{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/KIF11_Exon_Coverage.txt
printf "Exon 14	" >> $OutputDir/KIF11_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/KIF11_total_exon_coverage.txt | awk '$2>=94393379 && $2<=94393553{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/KIF11_Exon_Coverage.txt
printf "Exon15	" >> $OutputDir/KIF11_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/KIF11_total_exon_coverage.txt | awk '$2>=94396940 && $2<=94397067{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/KIF11_Exon_Coverage.txt
printf "Exon 16	" >> $OutputDir/KIF11_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/KIF11_total_exon_coverage.txt | awk '$2>=94397143 && $2<=94397303{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/KIF11_Exon_Coverage.txt
printf "Exon 17	" >> $OutputDir/KIF11_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/KIF11_total_exon_coverage.txt | awk '$2>=94399550 && $2<=94399658{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/KIF11_Exon_Coverage.txt
printf "Exon18	" >> $OutputDir/KIF11_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/KIF11_total_exon_coverage.txt | awk '$2>=94405119 && $2<=94405400{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/KIF11_Exon_Coverage.txt
printf "Exon 19	" >> $OutputDir/KIF11_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/KIF11_total_exon_coverage.txt | awk '$2>=94407968 && $2<=94408192{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/KIF11_Exon_Coverage.txt
printf "Exon 20	" >> $OutputDir/KIF11_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/KIF11_total_exon_coverage.txt | awk '$2>=94409591 && $2<=94409744{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/KIF11_Exon_Coverage.txt
printf "Exon 21	" >> $OutputDir/KIF11_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/KIF11_total_exon_coverage.txt | awk '$2>=94410157 && $2<=94410275{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/KIF11_Exon_Coverage.txt
printf "Exon 22	" >> $OutputDir/KIF11_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/KIF11_total_exon_coverage.txt | awk '$2>=94413421 && $2<=94413554{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/KIF11_Exon_Coverage.txt
printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >>$OutputDir/KIF11_Exon_Coverage.txt
old_script
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

<<old_script
gene=CTNNB1
echo "Calculating for $gene"
echo $(date -u) >> $OutputDir/CTNNB1_Exon_Coverage.txt
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"  >> $OutputDir/CTNNB1_Exon_Coverage.txt
#Calculate Max, Min and Mean coverage
printf "Min, Max, Mean Coding Coverage\n" >> $OutputDir/CTNNB1_Exon_Coverage.txt
printf "Exon 1	" >> $OutputDir/CTNNB1_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/CTNNB1_total_exon_coverage.txt | awk '$2>=41265559 && $2<=41265573{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/CTNNB1_Exon_Coverage.txt
printf "Exon 2	" >> $OutputDir/CTNNB1_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/CTNNB1_total_exon_coverage.txt | awk '$2>=41266444 && $2<=41266699{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/CTNNB1_Exon_Coverage.txt
printf "Exon 3	" >> $OutputDir/CTNNB1_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/CTNNB1_total_exon_coverage.txt | awk '$2>=41266824 && $2<=41267064{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/CTNNB1_Exon_Coverage.txt
printf "Exon 4	" >> $OutputDir/CTNNB1_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/CTNNB1_total_exon_coverage.txt | awk '$2>=41267150 && $2<=41268844{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/CTNNB1_Exon_Coverage.txt
printf "Exon 5	" >> $OutputDir/CTNNB1_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/CTNNB1_total_exon_coverage.txt | awk '$2>=41268698 && $2<=41268844{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/CTNNB1_Exon_Coverage.txt
printf "Exon 6	" >> $OutputDir/CTNNB1_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/CTNNB1_total_exon_coverage.txt | awk '$2>=41274831 && $2<=41274936{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/CTNNB1_Exon_Coverage.txt
printf "Exon 7	" >> $OutputDir/CTNNB1_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/CTNNB1_total_exon_coverage.txt | awk '$2>=41275019 && $2<=41275359{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/CTNNB1_Exon_Coverage.txt
printf "Exon 8	" >> $OutputDir/CTNNB1_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/CTNNB1_total_exon_coverage.txt | awk '$2>=41275629 && $2<=41275789{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/CTNNB1_Exon_Coverage.txt
printf "Exon 9	" >> $OutputDir/CTNNB1_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/CTNNB1_total_exon_coverage.txt | awk '$2>=41277214 && $2<=41277335{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/CTNNB1_Exon_Coverage.txt
printf "Exon 10	" >> $OutputDir/CTNNB1_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/CTNNB1_total_exon_coverage.txt | awk '$2>=41277839 && $2<=41277991{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/CTNNB1_Exon_Coverage.txt
printf "Exon 11	" >> $OutputDir/CTNNB1_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/CTNNB1_total_exon_coverage.txt | awk '$2>=41278078 && $2<=41278201{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/CTNNB1_Exon_Coverage.txt
printf "Exon 12	" >> $OutputDir/CTNNB1_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/CTNNB1_total_exon_coverage.txt | awk '$2>=41279506 && $2<=41279568{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/CTNNB1_Exon_Coverage.txt
printf "Exon 13	" >> $OutputDir/CTNNB1_Exon_Coverage.txt
sort -k4n,4 /mnt/d/BatchCoverage/$Sample/CTNNB1_total_exon_coverage.txt | awk '$2>=41280624 && $2<=41280834{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/CTNNB1_Exon_Coverage.txt
printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >>$OutputDir/CTNNB1_Exon_Coverage.txt
old_script
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

#gene=ATOH7
#samtools view input.bam chr1:1234-2345 | wc -l
#echo "Calculating for $gene"
#echo $(date -u) >> $OutputDir/ATOH7_Exon_Coverage2.txt
#echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"  >> $OutputDir/ATOH7_Exon_Coverage2.txt
##Calculate Max, Min and Mean coverage
#printf "Min, Max, Mean Coding Coverage\n" >> $OutputDir/ATOH7_Exon_Coverage2.txt
#printf "Exon 1	" >> $OutputDir/ATOH7_Exon_Coverage2.txt
#sort -k4n,4 /mnt/d/BatchCoverage/$Sample/ATOH7_total_exon_coverage2.txt | awk '$2>=69990975 && $2<=69991435{tot+=$4;cnt++;max=$4;min=cnt==1?$4:min}END{print min, max,tot/cnt}' >>$OutputDir/ATOH7_Exon_Coverage2.txt
#printf   "%b\n" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >>$OutputDir/ATOH7_Exon_Coverage2.txt
}


#Genes to run
NDP
FZD4
LRP5
TSPAN12
ZNF408
KIF11
CTNNB1
ATOH7