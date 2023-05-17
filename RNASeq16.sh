#!/bin/bash
##Run this in conda as follows
#conda activate py3.6
#./RNASeq16.sh


<<to_add
Change cat location to /Catenated/ and then QC from there so no need to manually delete files before QC
MultiQC wants to search the whole of /mnt/d/ so it takes ages, moving the location to a subfolder might fix this
to_add


#Run Number
RunCode=48c

#Data Path
DataPath=/mnt/d/$RunCode

#Enter sample names below
sample1=1A-JM-048
sample2=3-JM-048
sample3=4-JM-048
sample4=5-JM-048
sample5=6-JM-048
sample6=7-JM-048
sample7=8-JM-048
sample8=9-JM-048
sample9=10-JM-048
sample10=12-JM-048
sample11=13-JM-048
sample12=14-JM-048
sample13=16-JM-048
sample14=17-JM-048
sample15=18-JM-048
sample16=19-JM-048

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

move_fastq() {
echo "***************"
echo "Moving fastq files to top level directory..."
echo "***************"
#Move files to main directory
find /mnt/d/$RunCode -type f -print0 | xargs -0 mv -t /mnt/d/$RunCode
}

catenate_fastq(){
echo "***************"
echo "Catenating fastq files..."
echo "***************"
mkdir $DataPath/catenated
#Catenate the files
cat $DataPath/$sample1\_S1_L001_R1_001.fastq.gz $DataPath/$sample1\_S1_L002_R1_001.fastq.gz $DataPath/$sample1\_S1_L003_R1_001.fastq.gz $DataPath/$sample1\_S1_L004_R1_001.fastq.gz > $DataPath/catenated/$sample1-R1.fastq.gz && cat $DataPath/$sample1\_S1_L001_R2_001.fastq.gz $DataPath/$sample1\_S1_L002_R2_001.fastq.gz $DataPath/$sample1\_S1_L003_R2_001.fastq.gz $DataPath/$sample1\_S1_L004_R2_001.fastq.gz > $DataPath/catenated/$sample1-R2.fastq.gz
cat $DataPath/$sample2\_S2_L001_R1_001.fastq.gz $DataPath/$sample2\_S2_L002_R1_001.fastq.gz $DataPath/$sample2\_S2_L003_R1_001.fastq.gz $DataPath/$sample2\_S2_L004_R1_001.fastq.gz > $DataPath/catenated/$sample2-R1.fastq.gz && cat $DataPath/$sample2\_S2_L001_R2_001.fastq.gz $DataPath/$sample2\_S2_L002_R2_001.fastq.gz $DataPath/$sample2\_S2_L003_R2_001.fastq.gz $DataPath/$sample2\_S2_L004_R2_001.fastq.gz > $DataPath/catenated/$sample2-R2.fastq.gz

cat $DataPath/$sample3\_S3_L001_R1_001.fastq.gz $DataPath/$sample3\_S3_L002_R1_001.fastq.gz $DataPath/$sample3\_S3_L003_R1_001.fastq.gz $DataPath/$sample3\_S3_L004_R1_001.fastq.gz > $DataPath/catenated/$sample3-R1.fastq.gz && cat $DataPath/$sample3\_S3_L001_R2_001.fastq.gz $DataPath/$sample3\_S3_L002_R2_001.fastq.gz $DataPath/$sample3\_S3_L003_R2_001.fastq.gz $DataPath/$sample3\_S3_L004_R2_001.fastq.gz > $DataPath/catenated/$sample3-R2.fastq.gz
cat $DataPath/$sample4\_S4_L001_R1_001.fastq.gz $DataPath/$sample4\_S4_L002_R1_001.fastq.gz $DataPath/$sample4\_S4_L003_R1_001.fastq.gz $DataPath/$sample4\_S4_L004_R1_001.fastq.gz > $DataPath/catenated/$sample4-R1.fastq.gz && cat $DataPath/$sample4\_S4_L001_R2_001.fastq.gz $DataPath/$sample4\_S4_L002_R2_001.fastq.gz $DataPath/$sample4\_S4_L003_R2_001.fastq.gz $DataPath/$sample4\_S4_L004_R2_001.fastq.gz > $DataPath/catenated/$sample4-R2.fastq.gz

cat $DataPath/$sample5\_S5_L001_R1_001.fastq.gz $DataPath/$sample5\_S5_L002_R1_001.fastq.gz $DataPath/$sample5\_S5_L003_R1_001.fastq.gz $DataPath/$sample5\_S5_L004_R1_001.fastq.gz > $DataPath/catenated/$sample5-R1.fastq.gz && cat $DataPath/$sample5\_S5_L001_R2_001.fastq.gz $DataPath/$sample5\_S5_L002_R2_001.fastq.gz $DataPath/$sample5\_S5_L003_R2_001.fastq.gz $DataPath/$sample5\_S5_L004_R2_001.fastq.gz > $DataPath/catenated/$sample5-R2.fastq.gz
cat $DataPath/$sample6\_S6_L001_R1_001.fastq.gz $DataPath/$sample6\_S6_L002_R1_001.fastq.gz $DataPath/$sample6\_S6_L003_R1_001.fastq.gz $DataPath/$sample6\_S6_L004_R1_001.fastq.gz > $DataPath/catenated/$sample6-R1.fastq.gz && cat $DataPath/$sample6\_S6_L001_R2_001.fastq.gz $DataPath/$sample6\_S6_L002_R2_001.fastq.gz $DataPath/$sample6\_S6_L003_R2_001.fastq.gz $DataPath/$sample6\_S6_L004_R2_001.fastq.gz > $DataPath/catenated/$sample6-R2.fastq.gz

cat $DataPath/$sample7\_S7_L001_R1_001.fastq.gz $DataPath/$sample7\_S7_L002_R1_001.fastq.gz $DataPath/$sample7\_S7_L003_R1_001.fastq.gz $DataPath/$sample7\_S7_L004_R1_001.fastq.gz > $DataPath/catenated/$sample7-R1.fastq.gz && cat $DataPath/$sample7\_S7_L001_R2_001.fastq.gz $DataPath/$sample7\_S7_L002_R2_001.fastq.gz $DataPath/$sample7\_S7_L003_R2_001.fastq.gz $DataPath/$sample7\_S7_L004_R2_001.fastq.gz > $DataPath/catenated/$sample7-R2.fastq.gz
cat $DataPath/$sample8\_S8_L001_R1_001.fastq.gz $DataPath/$sample8\_S8_L002_R1_001.fastq.gz $DataPath/$sample8\_S8_L003_R1_001.fastq.gz $DataPath/$sample8\_S8_L004_R1_001.fastq.gz > $DataPath/catenated/$sample8-R1.fastq.gz && cat $DataPath/$sample8\_S8_L001_R2_001.fastq.gz $DataPath/$sample8\_S8_L002_R2_001.fastq.gz $DataPath/$sample8\_S8_L003_R2_001.fastq.gz $DataPath/$sample8\_S8_L004_R2_001.fastq.gz > $DataPath/catenated/$sample8-R2.fastq.gz

cat $DataPath/$sample9\_S9_L001_R1_001.fastq.gz $DataPath/$sample9\_S9_L002_R1_001.fastq.gz $DataPath/$sample9\_S9_L003_R1_001.fastq.gz $DataPath/$sample9\_S9_L004_R1_001.fastq.gz > $DataPath/catenated/$sample9-R1.fastq.gz && cat $DataPath/$sample9\_S9_L001_R2_001.fastq.gz $DataPath/$sample9\_S9_L002_R2_001.fastq.gz $DataPath/$sample9\_S9_L003_R2_001.fastq.gz $DataPath/$sample9\_S9_L004_R2_001.fastq.gz > $DataPath/catenated/$sample9-R2.fastq.gz
#cat $DataPath/$sample10\_S10_L001_R1_001.fastq.gz $DataPath/$sample10\_S10_L002_R1_001.fastq.gz $DataPath/$sample10\_S10_L003_R1_001.fastq.gz $DataPath/$sample10_S10_L004_R1_001.fastq.gz > $DataPath/catenated/$sample10-R1.fastq.gz && cat $DataPath/$sample10\_S10_L001_R2_001.fastq.gz $DataPath/$sample10\_S10_L002_R2_001.fastq.gz $DataPath/$sample10\_S10_L003_R2_001.fastq.gz $DataPath/$sample10\_S10_L004_R2_001.fastq.gz > $DataPath/catenated/$sample10-R2.fastq.gz

#cat $DataPath/$sample11_\S11_L001_R1_001.fastq.gz $DataPath/$sample11\_S11_L002_R1_001.fastq.gz $DataPath/$sample11\_S11_L003_R1_001.fastq.gz $DataPath/$sample11\_S11_L004_R1_001.fastq.gz > $DataPath/catenated/$sample11-R1.fastq.gz && cat $DataPath/$sample11\_S11_L001_R2_001.fastq.gz $DataPath/$sample11\_S11_L002_R2_001.fastq.gz $DataPath/$sample11\_S11_L003_R2_001.fastq.gz $DataPath/$sample11\_S11_L004_R2_001.fastq.gz > $DataPath/catenated/$sample11-R2.fastq.gz
#cat $DataPath/$sample12_\S12_L001_R1_001.fastq.gz $DataPath/$sample12\_S12_L002_R1_001.fastq.gz $DataPath/$sample12\_S12_L003_R1_001.fastq.gz $DataPath/$sample12\_S12_L004_R1_001.fastq.gz > $DataPath/catenated/$sample12-R1.fastq.gz && cat $DataPath/$sample12\_S12_L001_R2_001.fastq.gz $DataPath/$sample12\_S12_L002_R2_001.fastq.gz $DataPath/$sample12\_S12_L003_R2_001.fastq.gz $DataPath/$sample12\_S12_L004_R2_001.fastq.gz > $DataPath/catenated/$sample12-R2.fastq.gz

#cat $DataPath/$sample13\_S13_L001_R1_001.fastq.gz $DataPath/$sample13\_S13_L002_R1_001.fastq.gz $DataPath/$sample13\_S13_L003_R1_001.fastq.gz $DataPath/$sample13\_S13_L004_R1_001.fastq.gz > $DataPath/catenated/$sample13-R1.fastq.gz && cat $DataPath/$sample13\_S13_L001_R2_001.fastq.gz $DataPath/$sample13\_S13_L002_R2_001.fastq.gz $DataPath/$sample13\_S13_L003_R2_001.fastq.gz $DataPath/$sample13\_S13_L004_R2_001.fastq.gz > $DataPath/catenated/$sample13-R2.fastq.gz
#cat $DataPath/$sample14\_S14_L001_R1_001.fastq.gz $DataPath/$sample14\_S14_L002_R1_001.fastq.gz $DataPath/$sample14\_S14_L003_R1_001.fastq.gz $DataPath/$sample14\_S14_L004_R1_001.fastq.gz > $DataPath/catenated/$sample14-R1.fastq.gz && cat $DataPath/$sample14\_S14_L001_R2_001.fastq.gz $DataPath/$sample14\_S14_L002_R2_001.fastq.gz $DataPath/$sample14\_S14_L003_R2_001.fastq.gz $DataPath/$sample14\_S14_L004_R2_001.fastq.gz > $DataPath/catenated/$sample14-R2.fastq.gz

#cat $DataPath/$sample15\_S15_L001_R1_001.fastq.gz $DataPath/$sample15\_S15_L002_R1_001.fastq.gz $DataPath/$sample15\_S15_L003_R1_001.fastq.gz $DataPath/$sample15\_S15_L004_R1_001.fastq.gz > $DataPath/catenated/$sample15-R1.fastq.gz && cat $DataPath/$sample15\_S15_L001_R2_001.fastq.gz $DataPath/$sample15\_S15_L002_R2_001.fastq.gz $DataPath/$sample15\_S15_L003_R2_001.fastq.gz $DataPath/$sample15\_S15_L004_R2_001.fastq.gz > $DataPath/catenated/$sample15-R2.fastq.gz
#cat $DataPath/$sample16\_S16_L001_R1_001.fastq.gz $DataPath/$sample16\_S16_L002_R1_001.fastq.gz $DataPath/$sample16\_S16_L003_R1_001.fastq.gz $DataPath/$sample16\_S16_L004_R1_001.fastq.gz > $DataPath/catenated/$sample16-R1.fastq.gz && cat $DataPath/$sample16\_S16_L001_R2_001.fastq.gz $DataPath/$sample16\_S16_L002_R2_001.fastq.gz $DataPath/$sample16\_S16_L003_R2_001.fastq.gz $DataPath/$sample16\_S16_L004_R2_001.fastq.gz > $DataPath/catenated/$sample16-R2.fastq.gz

#Catenate the Undetermined reads
cat $DataPath/Undetermined_S0_L001_R1_001.fastq.gz $DataPath/Undetermined_S0_L002_R1_001.fastq.gz $DataPath/Undetermined_S0_L003_R1_001.fastq.gz $DataPath/Undetermined_S0_L004_R1_001.fastq.gz > $DataPath/catenated/Undetermined_S0-R1.fastq.gz && cat $DataPath/Undetermined_S0_L001_R2_001.fastq.gz $DataPath/Undetermined_S0_L002_R2_001.fastq.gz $DataPath/Undetermined_S0_L003_R2_001.fastq.gz $DataPath/Undetermined_S0_L004_R2_001.fastq.gz > $DataPath/catenated/Undetermined_S0-R2.fastq.gz
}

RNASeq_QC(){
echo "***************"
echo "Performing RNASeq QC"
echo "***************"
#Copy fastq to new dir to run faster
#echo "Copying data to a new folder..."
#mkdir $DataPath/catenated/QC
#mkdir $DataPath/catenated/
cd $DataPath/
#cp -p ../*.fastq.gz .
#echo "Copying complete."

#FastQC - needs to use latest version of java, so change if needed, and then change back to java 8
#sudo update-alternatives --config java  #To change manually
#Auto change java version
echo "Active java version:"
java -version
export PATH=/usr/lib/jvm/java-11-openjdk-amd64/bin/:$PATH
echo "Changed java to"
java -version

#Run FastQC
echo "Running FastQC..."
fastqc $DataPath/*.fastq.gz
echo "FastQC complete."

#Auto change java version back
echo "Changing java back..."
export PATH=/usr/lib/jvm/jdk1.8.0_291/bin/:$PATH
echo "Active java version:"
java -version

#Move QC Files to new dir
mkdir fastqc
mv *_fastqc* fastqc

#MultiQC
echo "Running multiqc..."
multiqc $DataPath/ .
echo "multiqc complete."


}

map_reads() {
#Map Reads
bwa mem -t 7 -M -v 2 /mnt/d/hg19/human_g1k_v37.fasta /mnt/d/RNASeq-01/25-R1.fastq.gz /mnt/d/RNASeq-01/25-R2.fastq.gz | samtools view -u - | samtools sort -@ 7 -O bam -o /mnt/d/RNASeq-01/25.bwa.sorted.bam -T /mnt/d/RNASeq-01/25.bwa.sort.temp
bwa mem -t 7 -M -v 2 /mnt/d/hg19/human_g1k_v37.fasta /mnt/d/RNASeq-01/59-R1.fastq.gz /mnt/d/RNASeq-01/59-R2.fastq.gz | samtools view -u - | samtools sort -@ 7 -O bam -o /mnt/d/RNASeq-01/59.bwa.sorted.bam -T /mnt/d/RNASeq-01/59.bwa.sort.temp
}

##########################
###Select which functions to run###
##########################
Header_text
#move_fastq
#catenate_fastq
RNASeq_QC
#####map_reads   ###Experimental at the moment, needs a lot of work