#! /usr/bin/Rscript
#File that this code reads is from coding_coverage.sh

#Set Sample Name
samplename <- "F10-061"

#Set working directory
setwd(paste0("D:/Batch_Coverage/",samplename))

#To Add

#########
#NDP data
#########
#Gene name setup
gene_name <- "NDP"
#File name setup
file_name <- paste(samplename,gene_name, "coverage.pdf")
#File to read
gene_name<-paste(samplename,"_",gene_name, "_Exons.txt", sep="")
#Create data frame
gene_name_df <- read.csv2(gene_name, sep = '\t', header = F)
#PDF setup as 4 rows, 2 columns
pdf(file_name,width=10,height=16, title=gene_name)
par(mfrow=c(4,2))
par(mar = c(5,4,2,2))
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(43817718,43817891), col = "#3366CC", main= "Exon 1")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(43809045,43809272), col = "#3366CC", main= "Exon 2")
dev.off()

#########
#ATOH7 data
#########
#Gene name setup
gene_name <- "ATOH7"
#File name setup
file_name <- paste(samplename,gene_name, "coverage.pdf")
#File to read
gene_name<-paste(samplename,"_",gene_name, "_Exons.txt", sep="")
#Create data frame
gene_name_df <- read.csv2(gene_name, sep = '\t', header = F)
#PDF setup as 4 rows, 2 columns
pdf(file_name,width=10,height=16, title=gene_name)
par(mfrow=c(4,2))
par(mar = c(5,4,2,2))
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(69990976,69991434), col = "#3366CC", main="ATOH7 Exon 1")
dev.off()

#########
#ZNF408 data
#########
#Gene name setup
gene_name <- "ZNF408"
#File name setup
file_name <- paste(samplename,gene_name, "coverage.pdf")
#File to read
gene_name<-paste(samplename,"_",gene_name, "_Exons.txt", sep="")
#Create data frame
gene_name_df <- read.csv2(gene_name, sep = '\t', header = F)
#PDF setup as 4 rows, 2 columns
pdf(file_name,width=10,height=16, title=gene_name)
par(mfrow=c(4,2))
par(mar = c(5,4,2,2))
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(46722664,46722691), col = "#3366CC", main="ZNF408 Exon 1")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(46722949,46723226), col = "#3366CC", main="ZNF408 Exon 2")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,200), xlim=c(46724254,46724315), col = "#3366CC", main="ZNF408 Exon 3")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(46724534,46724793), col = "#3366CC", main="ZNF408 Exon 4")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(46725903,46727413), col = "#3366CC", main="ZNF408 Exon 5")
dev.off() 

#########
#FZD4 data
#########
#Gene name setup
gene_name <- "FZD4"
#File name setup
file_name <- paste(samplename,gene_name, "coverage.pdf")
#File to read
gene_name<-paste(samplename,"_",gene_name, "_Exons.txt", sep="")
#Create data frame
gene_name_df <- read.csv2(gene_name, sep = '\t', header = F)
#PDF setup as 4 rows, 2 columns
pdf(file_name,width=10,height=16, title=gene_name)
par(mfrow=c(4,2))
par(mar = c(5,4,2,2))
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(86665843,86666127), col = "#3366CC", main="FZD4 Exon 1")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(86662184,86663512), col = "#3366CC", main="FZD4 Exon 2")
dev.off()

#########
#LRP5 data
#########
#Gene name setup
gene_name <- "LRP5"
#File name setup
file_name <- paste(samplename,gene_name, "coverage.pdf")
#File to read
gene_name<-paste(samplename,"_",gene_name, "_Exons.txt", sep="")
#Create data frame
gene_name_df <- read.csv2(gene_name, sep = '\t', header = F)
#PDF setup as 4 rows, 2 columns
pdf(file_name,width=10,height=16, title=gene_name)
par(mfrow=c(4,2))
par(mar = c(5,4,2,2))
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,200), xlim=c(68080183,68080273), col = "#3366CC", main="LRP5 Exon 1")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68115315,68115711), col = "#3366CC", main="LRP5 Exon 2")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68125118,68125315), col = "#3366CC", main="LRP5 Exon 3")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68131215,68131411), col = "#3366CC", main="LRP5 Exon 4")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68133039,68133170), col = "#3366CC", main="LRP5 Exon 5")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68153784,68154180), col = "#3366CC", main="LRP5 Exon 6")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68157349,68157520), col = "#3366CC", main="LRP5 Exon 7")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68170951,68171167), col = "#3366CC", main="LRP5 Exon 8")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68173992,68174281), col = "#3366CC", main="LRP5 Exon 9")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68177382,68177608), col = "#3366CC", main="LRP5 Exon 10")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68178904,68179088), col = "#3366CC", main="LRP5 Exon 11")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68181157,68181480), col = "#3366CC", main="LRP5 Exon 12")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68183796,68183995), col = "#3366CC", main="LRP5 Exon 13")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68190957,68191165), col = "#3366CC", main="LRP5 Exon 14")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68192570,68192760), col = "#3366CC", main="LRP5 Exon 15")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68193446,68193655), col = "#3366CC", main="LRP5 Exon 16")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68197043,68197168), col = "#3366CC", main="LRP5 Exon 17")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68201070,68201306), col = "#3366CC", main="LRP5 Exon 18")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68204357,68204467), col = "#3366CC", main="LRP5 Exon 19")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68205914,68206150), col = "#3366CC", main="LRP5 Exon 20")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68207245,68207384), col = "#3366CC", main="LRP5 Exon 21")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68213904,68214001), col = "#3366CC", main="LRP5 Exon 22")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68216277,68216538), col = "#3366CC", main="LRP5 Exon 23")
dev.off()

#########
#TSPAN12 data
#########
#Gene name setup
gene_name <- "TSPAN12"
#File name setup
file_name <- paste(samplename,gene_name, "coverage.pdf")
#File to read
gene_name<-paste(samplename,"_",gene_name, "_Exons.txt", sep="")
#Create data frame
gene_name_df <- read.csv2(gene_name, sep = '\t', header = F)
#PDF setup as 4 rows, 2 columns
pdf(file_name,width=10,height=16, title=gene_name)
par(mfrow=c(4,2))
par(mar = c(5,4,2,2))
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(120496752,120496817), col = "#3366CC", main="TSPAN12 Exon 01")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(120480081,120480163), col = "#3366CC", main="TSPAN12 Exon 02")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(120478831,120478966), col = "#3366CC", main="TSPAN12 Exon 03")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(120455783,120455857), col = "#3366CC", main="TSPAN12 Exon 04")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(120450517,120450624), col = "#3366CC", main="TSPAN12 Exon 05")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(120446603,120446746), col = "#3366CC", main="TSPAN12 Exon 06")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(120428646,120428951), col = "#3366CC", main="TSPAN12 Exon 07")
dev.off()

#########
#KIF11 data
#########
#Gene name setup
gene_name <- "KIF11"
#File name setup
file_name <- paste(samplename,gene_name, "coverage.pdf")
#File to read
gene_name<-paste(samplename,"_",gene_name, "_Exons.txt", sep="")
#Create data frame
gene_name_df <- read.csv2(gene_name, sep = '\t', header = F)
#PDF setup as 4 rows, 2 columns
pdf(file_name,width=10,height=16, title=gene_name)
par(mfrow=c(4,2))
par(mar = c(5,4,2,2))
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94353133,94353209), col = "#3366CC", main="KIF11 Exon 1")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94366022,94366154), col = "#3366CC", main="KIF11 Exon 2")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94366376,94366473), col = "#3366CC", main="KIF11 Exon 3")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94366916,94366994), col = "#3366CC", main="KIF11 Exon 4")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94368777,94368962), col = "#3366CC", main="KIF11 Exon 5")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94369142,94369266), col = "#3366CC", main="KIF11 Exon 6")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94372797,94372887), col = "#3366CC", main="KIF11 Exon 7")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94373134,94373376), col = "#3366CC", main="KIF11 Exon 8")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94376494,94376589), col = "#3366CC", main="KIF11 Exon 9")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94381142,94381230), col = "#3366CC", main="KIF11 Exon 10")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94388565,94388652), col = "#3366CC", main="KIF11 Exon 11")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94389933,94390121), col = "#3366CC", main="KIF11 Exon 12")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94392243,94392450), col = "#3366CC", main="KIF11 Exon 13")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94393380,94393552), col = "#3366CC", main="KIF11 Exon 14")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94396941,94397066), col = "#3366CC", main="KIF11 Exon 15")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94397144,94397302), col = "#3366CC", main="KIF11 Exon 16")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94399551,94399657), col = "#3366CC", main="KIF11 Exon 17")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94405120,94405399), col = "#3366CC", main="KIF11 Exon 18")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94407969,94408191), col = "#3366CC", main="KIF11 Exon 19")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94409592,94409743), col = "#3366CC", main="KIF11 Exon 20")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94410158,94410274), col = "#3366CC", main="KIF11 Exon 21")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94413422,94413553), col = "#3366CC", main="KIF11 Exon 22")
dev.off()

#########
#CTNNB1 data
#########
#Gene name setup
gene_name <- "CTNNB1"
#File name setup
file_name <- paste(samplename,gene_name, "coverage.pdf")
#File to read
gene_name<-paste(samplename,"_",gene_name, "_Exons.txt", sep="")
#Create data frame
gene_name_df <- read.csv2(gene_name, sep = '\t', header = F)
#PDF setup as 4 rows, 2 columns
pdf(file_name,width=10,height=16, title=gene_name)
par(mfrow=c(4,2))
par(mar = c(5,4,2,2))
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,200), xlim=c(41265560,41265572), col = "#3366CC", main="CTNNB1 Exon 1")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(41266017,41266244), col = "#3366CC", main="CTNNB1 Exon 2")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(41266445,41266698), col = "#3366CC", main="CTNNB1 Exon 3")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,200), xlim=c(41266825,41267063), col = "#3366CC", main="CTNNB1 Exon 4")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,200), xlim=c(41267151,41267352), col = "#3366CC", main="CTNNB1 Exon 5")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,200), xlim=c(41268699,41268843), col = "#3366CC", main="CTNNB1 Exon 6")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,200), xlim=c(41274832,41274935), col = "#3366CC", main="CTNNB1 Exon 7")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,200), xlim=c(41275020,41275358), col = "#3366CC", main="CTNNB1 Exon 8")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,200), xlim=c(41275630,41275788), col = "#3366CC", main="CTNNB1 Exon 9")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,200), xlim=c(41277215,41277334), col = "#3366CC", main="CTNNB1 Exon 10")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,200), xlim=c(41277840,41277990), col = "#3366CC", main="CTNNB1 Exon 11")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,200), xlim=c(41278079,41278200), col = "#3366CC", main="CTNNB1 Exon 12")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,200), xlim=c(41279507,41279567), col = "#3366CC", main="CTNNB1 Exon 13")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,200), xlim=c(41280625,41280833), col = "#3366CC", main="CTNNB1 Exon 14")
dev.off()

#########
#ILK data
#########
#Gene name setup
gene_name <- "ILK"
#File name setup
file_name <- paste(samplename,gene_name, "coverage.pdf")
#File to read
gene_name<-paste(samplename,"_",gene_name, "_Exons.txt", sep="")
#Create data frame
gene_name_df <- read.csv2(gene_name, sep = '\t', header = F)
#PDF setup as 4 rows, 2 columns
pdf(file_name,width=10,height=16, title=gene_name)
par(mfrow=c(4,2))
par(mar = c(5,4,2,2))
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(6625502,6625590), col = "#3366CC", main="ILK Exon 1")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(6629276,6629441), col = "#3366CC", main="ILK Exon 2")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(6629624,6629719), col = "#3366CC", main="ILK Exon 3")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,200), xlim=c(6629924,6630020), col = "#3366CC", main="ILK Exon 4")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,200), xlim=c(6630115,6630198), col = "#3366CC", main="ILK Exon 5")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(6630302,6630387), col = "#3366CC", main="ILK Exon 6")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(6630530,6630639), col = "#3366CC", main="ILK Exon 7")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(6630743,6630870), col = "#3366CC", main="ILK Exon 8")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(6630955,6631076), col = "#3366CC", main="ILK Exon 9")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(6631167,6631266), col = "#3366CC", main="ILK Exon 10")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(6631379,6631509), col = "#3366CC", main="ILK Exon 11")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(6631693,6631842), col = "#3366CC", main="ILK Exon 12")
dev.off()

#########
#JAG1 data
#########
#Gene name setup
gene_name <- "JAG1"
#File name setup
file_name <- paste(samplename,gene_name, "coverage.pdf")
#File to read
gene_name<-paste(samplename,"_",gene_name, "_Exons.txt", sep="")
#Create data frame
gene_name_df <- read.csv2(gene_name, sep = '\t', header = F)
#PDF setup as 4 rows, 2 columns
pdf(file_name,width=10,height=16, title=gene_name)
par(mfrow=c(4,2))
par(mar = c(5,4,2,2))
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(10654098,10654178), col = "#3366CC", main="JAG1 Exon 1")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(10653349,10653654), col = "#3366CC", main="JAG1 Exon 2")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(10644611,10644662), col = "#3366CC", main="JAG1 Exon 3")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(10639116,10639370), col = "#3366CC", main="JAG1 Exon 4")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(10637046,10637106), col = "#3366CC", main="JAG1 Exon 5")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(10633116,10633246), col = "#3366CC", main="JAG1 Exon 6")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(10632779,10632898), col = "#3366CC", main="JAG1 Exon 7")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(10632229,10632342), col = "#3366CC", main="JAG1 Exon 8")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(10630895,10631008), col = "#3366CC", main="JAG1 Exon 9")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(10630170,10630283), col = "#3366CC", main="JAG1 Exon 10")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(10629709,10629755), col = "#3366CC", main="JAG1 Exon 11")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(10629197,10629370), col = "#3366CC", main="JAG1 Exon 12")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(10628608,10628758), col = "#3366CC", main="JAG1 Exon 13")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(10627587,10627751), col = "#3366CC", main="JAG1 Exon 14")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(10626619,10626732), col = "#3366CC", main="JAG1 Exon 15")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(10626004,10626117), col = "#3366CC", main="JAG1 Exon 16")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(10625791,10625904), col = "#3366CC", main="JAG1 Exon 17")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(10625511,10625627), col = "#3366CC", main="JAG1 Exon 18")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(10625005,10625032), col = "#3366CC", main="JAG1 Exon 19")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(10624426,10624511), col = "#3366CC", main="JAG1 Exon 20")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(10623136,10623249), col = "#3366CC", main="JAG1 Exon 21")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(10622431,10622540), col = "#3366CC", main="JAG1 Exon 22")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(10622108,10622341), col = "#3366CC", main="JAG1 Exon 23")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(10621761,10621892), col = "#3366CC", main="JAG1 Exon 24")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(10621431,10621581), col = "#3366CC", main="JAG1 Exon 25")
plot(x = gene_name_df$V2, type = "l", y = gene_name_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(10620146,10620603), col = "#3366CC", main="JAG1 Exon 26")
dev.off()