#!/bin/bash

#Command to run this script is ./phenotype.sh
#Take output to https://phenotype.yseq.net/index.php

<<to_add
to_add

Header_text(){
WHITE='\033[1;37m'
BLUE='\033[0;34m'
DGRAY='\033[1;30m'
printf "${WHITE}   
           ____   __   __       ___  ____  __ _   __   _  _  __  ___  ____ 
          (    \ / _\ (  )     / __)(  __)(  ( \ /  \ ( \/ )(  )/ __)/ ___)
           ) D (/    \/ (_/\  ( (_ \ ) _) /    /(  O )/ \/ \ )(( (__ \___ \   
          (____/\_/\_/\____/   \___/(____)\_)__) \__/ \_)(_/(__)\___)(____/
    	             ___  __  ____  ____  ____    __     __   ____		 	   
                    / __)/  \(  _ \(  __)/ ___)  (  )   / _\ (  _ \  
                   ( (__(  O ))   / ) _) \___ \  / (_/\/    \ ) _ (                       
                    \___)\__/(__\_)(____)(____/  \____/\_/\_/(____/                      
              ${BLUE}    Contact: Mat Nightingale     	Email: Genomics@Dal.ca
 ${DGRAY}      o O       o O       o O       o O       o O       o O       o O       o O 
     o | | O   o | | O   o | | O   o | | O   o | | O   o | | O   o | | O   o | | O
   O | | | | O | | | | O | | | | O | | | | O | | | | O | | | | O | | | | O | | | | O
     O | | o   O | | o   O | | o   O | | o   O | | o   O | | o   O | | o   O | | o
       O o       O o       O o       O o       O o       O o       O o       O o\n"
}


timestamp() {
# timestamp function
date +"%Y-%m-%d %H:%M:%S"
}

#File to search
#snp_file="/mnt/d/Exome Tools/BAM-Analysis-Kit-3.01/BAM-Analysis-Kit-3.01/Mat-out/genome_full_snps.txt"
snp_file="/mnt/d/Exome Tools/BAM-Analysis-Kit-3.01/BAM-Analysis-Kit-3.01/JN-out/genome_full_snps.txt"

#Temp Output file
phenotype_file=/mnt/d/phenotype_temp.txt

#Formatted output file
phenotype=/mnt/d/phenotype.txt

snp_list(){
#rsID's
snp_2=rs1042602
snp_3=rs1110400
snp_4=rs11547464
snp_5=rs12203592   #Intronic
snp_6=rs12821256   #Intronic but covered
snp_7=rs12896399   #Intronic but covered
snp_8=rs1393350    #Intronic
snp_9=rs16891982
snp_10=rs1800407
snp_11=rs1805005
snp_12=rs1805006
snp_13=rs1805007
snp_14=rs1805008
snp_15=rs1805009
snp_16=rs201326893
snp_17=rs2228479   #Intronic
snp_18=rs2378249   #Intronic
snp_19=rs2402130   #Intronic
snp_20=rs28777     #Intronic
snp_21=rs312262906
snp_22=rs4959270   #Intronic
snp_23=rs683
snp_24=rs885479
snp_25=rs3114908   #Intronic
snp_26=rs1800414
snp_27=rs10756819  #Intronic
snp_28=rs2238289   #Intronic
snp_29=rs17128291  #Intronic
snp_30=rs6497292   #Intronic
snp_31=rs1126809
snp_32=rs1470608   #Intronic
snp_33=rs1426654
snp_34=rs6119471   #Intronic
snp_35=rs1545397   #Intronic
snp_36=rs6059655   #Intronic
snp_37=rs12441727  #Intronic
snp_38=rs3212355
snp_39=rs8051733   #Intronic but covered
snp_40=rs11803731
snp_41=rs17646946  #Intronic
snp_42=rs7349332
snp_43=rs12913832  #Intronic but covered
snp_44=rs4778138   #Intronic
snp_45=rs4778241   #Intronic
snp_46=rs1129038
snp_47=rs1667394   #Intronic but covered
}

snp_search(){
#search for snp in file, pipe to awk and then extract column 1, "=", 1st character from column 4, "/", 2nd character from column 4 and export all that to output file
#grep $snp_2 /mnt/d/Exome\ Tools/BAM-Analysis-Kit-3.01/BAM-Analysis-Kit-3.01/JN-out/genome_full_snps.txt | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2)}' > /mnt/d/pheno.txt

grep -w $snp_2 "$snp_file" | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' > $phenotype_file
grep -w $snp_3 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_4 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_5 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_6 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_7 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_8 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_9 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_10 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_11 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_12 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_13 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_14 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_15 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_16 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_17 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_18 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_19 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_20 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_21 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_22 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_23 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_24 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_25 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_26 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_27 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_28 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_29 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_30 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_31 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_32 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_33 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_34 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_35 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_36 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_37 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_38 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_39 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_40 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_41 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_42 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_43 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_44 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_45 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_46 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2),","}' >> $phenotype_file
grep -w $snp_47 "$snp_file"  | awk '{print $1,"=",substr($4,1,1),"/",substr($4,2,2)}' >> $phenotype_file

#Remove spaces
cat $phenotype_file | tr -d " \t\n\r" > $phenotype

#Delete temp file
rm $phenotype_file
}

#Functions to run
Header_text
timestamp
snp_list
snp_search
