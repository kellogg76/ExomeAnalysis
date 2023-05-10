#!/bin/bash

#Command to move fastq files to the top directory ./move_fastq.sh
#eg ./move_fastq.sh

echo "***************"
echo "Mats Fastq mover"
echo "***************"

#Data Location
DataPath=/mnt/d/48/

# timestamp function
timestamp() {
date +"%Y-%m-%d %H:%M:%S"
}

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

# move files from sub folders
move_fastq() {
timestamp
find $DataPath -type f -print0 | xargs -0 mv -t $DataPath
}

timestamp
Header_text
move_fastq