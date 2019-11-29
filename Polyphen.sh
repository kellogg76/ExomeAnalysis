#!/bin/bash

echo "***************"
echo "PolyPhen2 Batch Export"
echo "***************"

#Variant File List
VarList=/mnt/d/FEVR101.hom_alt_med_high_rare.txt
OutputDir=/mnt/d/

Polyphen(){
#Format
#chr1:1267483 G/A

#Cut first row
sed  '1d' $VarList > $OutputDir/Var_Output.txt
#Extract columns 1, 3, 4,5
sed 1p $OutputDir/Var_Output.txt | awk '{print $1":"$3,$4"/"$5}' > $OutputDir/Var_Output2.txt

echo "Paste result from text file into http://genetics.bwh.harvard.edu/pph2/bgi.shtml"
}

Polyphen
