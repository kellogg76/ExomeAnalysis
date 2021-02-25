#! /usr/bin/Rscript
#Plots coverage of Exome using exported files from Exome_coverage.sh

#Set Sample Name
samplename <- "F10-061"

#Set working directory
setwd(paste0("D:/Exome_coverage/",samplename))

#PDF setup as 1 rows, 1 columns
par(mfrow=c(1,1))
par(mar = c(0,0,0,0))


#To Add

#Chromosome 1 Testing
file_name <- paste(samplename,"Chr_01_Exome_coverage.pdf")
Coverage_Data = read.table("Chr_1.txt", sep="")
pdf(file_name, width=16,height=10, title="Exome Coverage")
plot(x = Coverage_Data$V3, type = "h", las=0, xlab = "Location on Chromosome", ylab= "Depth of Coverage", ylim=c(0,100), col = "#3366CC", main="Chr 1")
dev.off()

#Chromosome 2
file_name <- paste(samplename,"Chr_02_Exome_coverage.pdf")
Coverage_Data = read.table("Chr_2.txt", sep="")
pdf(file_name,width=16,height=10, title="Exome Coverage")
plot(x = Coverage_Data$V3, type = "h", las=0, xlab = "Location on Chromosome", ylab= "Depth of Coverage", ylim=c(0,100), col = "#3366CC", main="Chr 2")
dev.off()

#Chromosome 3
file_name <- paste(samplename,"Chr_03_Exome_coverage.pdf")
Coverage_Data = read.table("Chr_3.txt", sep="")
pdf(file_name,width=16,height=10, title="Exome Coverage")
plot(x = Coverage_Data$V3, type = "h", las=0, xlab = "Location on Chromosome", ylab= "Depth of Coverage", ylim=c(0,100), col = "#3366CC", main="Chr 3")
dev.off()

#Chromosome 4
file_name <- paste(samplename,"Chr_04_Exome_coverage.pdf")
Coverage_Data = read.table("Chr_4.txt", sep="")
pdf(file_name,width=16,height=10, title="Exome Coverage")
plot(x = Coverage_Data$V3, type = "h", las=0, xlab = "Location on Chromosome", ylab= "Depth of Coverage", ylim=c(0,100), col = "#3366CC", main="Chr 4")
dev.off()

#Chromosome 5
file_name <- paste(samplename,"Chr_05_Exome_coverage.pdf")
Coverage_Data = read.table("Chr_5.txt", sep="")
pdf(file_name,width=16,height=10, title="Exome Coverage")
plot(x = Coverage_Data$V3, type = "h", las=0, xlab = "Location on Chromosome", ylab= "Depth of Coverage", ylim=c(0,100), col = "#3366CC", main="Chr 5")
dev.off()

#Chromosome 6
file_name <- paste(samplename,"Chr_06_Exome_coverage.pdf")
Coverage_Data = read.table("Chr_6.txt", sep="")
pdf(file_name,width=16,height=10, title="Exome Coverage")
plot(x = Coverage_Data$V3, type = "h", las=0, xlab = "Location on Chromosome", ylab= "Depth of Coverage", ylim=c(0,100), col = "#3366CC", main="Chr 6")
dev.off()

#Chromosome 7
file_name <- paste(samplename,"Chr_07_Exome_coverage.pdf")
Coverage_Data = read.table("Chr_7.txt", sep="")
pdf(file_name,width=16,height=10, title="Exome Coverage")
plot(x = Coverage_Data$V3, type = "h", las=0, xlab = "Location on Chromosome", ylab= "Depth of Coverage", ylim=c(0,100), col = "#3366CC", main="Chr 7")
dev.off()

#Chromosome 8
file_name <- paste(samplename,"Chr_08_Exome_coverage.pdf")
Coverage_Data = read.table("Chr_8.txt", sep="")
pdf(file_name,width=16,height=10, title="Exome Coverage")
plot(x = Coverage_Data$V3, type = "h", las=0, xlab = "Location on Chromosome", ylab= "Depth of Coverage", ylim=c(0,100), col = "#3366CC", main="Chr 8")
dev.off()

#Chromosome 9
file_name <- paste(samplename,"Chr_09_Exome_coverage.pdf")
Coverage_Data = read.table("Chr_9.txt", sep="")
pdf(file_name,width=16,height=10, title="Exome Coverage")
plot(x = Coverage_Data$V3, type = "h", las=0, xlab = "Location on Chromosome", ylab= "Depth of Coverage", ylim=c(0,100), col = "#3366CC", main="Chr 9")
dev.off()

#Chromosome 10
file_name <- paste(samplename,"Chr_10_Exome_coverage.pdf")
Coverage_Data = read.table("Chr_10.txt", sep="")
pdf(file_name,width=16,height=10, title="Exome Coverage")
plot(x = Coverage_Data$V3, type = "h", las=0, xlab = "Location on Chromosome", ylab= "Depth of Coverage", ylim=c(0,100), col = "#3366CC", main="Chr 10")
dev.off()

#Chromosome 11
file_name <- paste(samplename,"Chr_11_Exome_coverage.pdf")
Coverage_Data = read.table("Chr_11.txt", sep="")
pdf(file_name,width=16,height=10, title="Exome Coverage")
plot(x = Coverage_Data$V3, type = "h", las=0, xlab = "Location on Chromosome", ylab= "Depth of Coverage", ylim=c(0,100), col = "#3366CC", main="Chr 12")
dev.off()

#Chromosome 12
file_name <- paste(samplename,"Chr_12_Exome_coverage.pdf")
Coverage_Data = read.table("Chr_12.txt", sep="")
pdf(file_name,width=16,height=10, title="Exome Coverage")
plot(x = Coverage_Data$V3, type = "h", las=0, xlab = "Location on Chromosome", ylab= "Depth of Coverage", ylim=c(0,100), col = "#3366CC", main="Chr 12")
dev.off()

#Chromosome 13
file_name <- paste(samplename,"Chr_13_Exome_coverage.pdf")
Coverage_Data = read.table("Chr_13.txt", sep="")
pdf(file_name,width=16,height=10, title="Exome Coverage")
plot(x = Coverage_Data$V3, type = "h", las=0, xlab = "Location on Chromosome", ylab= "Depth of Coverage", ylim=c(0,100), col = "#3366CC", main="Chr 13")
dev.off()

#Chromosome 14
file_name <- paste(samplename,"Chr_14_Exome_coverage.pdf")
Coverage_Data = read.table("Chr_14.txt", sep="")
pdf(file_name,width=16,height=10, title="Exome Coverage")
plot(x = Coverage_Data$V3, type = "h", las=0, xlab = "Location on Chromosome", ylab= "Depth of Coverage", ylim=c(0,100), col = "#3366CC", main="Chr 14")
dev.off()

#Chromosome 15
file_name <- paste(samplename,"Chr_15_Exome_coverage.pdf")
Coverage_Data = read.table("Chr_15.txt", sep="")
pdf(file_name,width=16,height=10, title="Exome Coverage")
plot(x = Coverage_Data$V3, type = "h", las=0, xlab = "Location on Chromosome", ylab= "Depth of Coverage", ylim=c(0,100), col = "#3366CC", main="Chr 15")
dev.off()

#Chromosome 16
file_name <- paste(samplename,"Chr_16_Exome_coverage.pdf")
Coverage_Data = read.table("Chr_16.txt", sep="")
pdf(file_name,width=16,height=10, title="Exome Coverage")
plot(x = Coverage_Data$V3, type = "h", las=0, xlab = "Location on Chromosome", ylab= "Depth of Coverage", ylim=c(0,100), col = "#3366CC", main="Chr 16")
dev.off()

#Chromosome 17
file_name <- paste(samplename,"Chr_17_Exome_coverage.pdf")
Coverage_Data = read.table("Chr_17.txt", sep="")
pdf(file_name,width=16,height=10, title="Exome Coverage")
plot(x = Coverage_Data$V3, type = "h", las=0, xlab = "Location on Chromosome", ylab= "Depth of Coverage", ylim=c(0,100), col = "#3366CC", main="Chr 17")
dev.off()

#Chromosome 18
file_name <- paste(samplename,"Chr_18_Exome_coverage.pdf")
Coverage_Data = read.table("Chr_18.txt", sep="")
pdf(file_name,width=16,height=10, title="Exome Coverage")
plot(x = Coverage_Data$V3, type = "h", las=0, xlab = "Location on Chromosome", ylab= "Depth of Coverage", ylim=c(0,100), col = "#3366CC", main="Chr 18")
dev.off()

#Chromosome 19
file_name <- paste(samplename,"Chr_19_Exome_coverage.pdf")
Coverage_Data = read.table("Chr_19.txt", sep="")
pdf(file_name,width=16,height=10, title="Exome Coverage")
plot(x = Coverage_Data$V3, type = "h", las=0, xlab = "Location on Chromosome", ylab= "Depth of Coverage", ylim=c(0,100), col = "#3366CC", main="Chr 19")
dev.off()

#Chromosome 20
file_name <- paste(samplename,"Chr_20_Exome_coverage.pdf")
Coverage_Data = read.table("Chr_20.txt", sep="")
pdf(file_name,width=16,height=10, title="Exome Coverage")
plot(x = Coverage_Data$V3, type = "h", las=0, xlab = "Location on Chromosome", ylab= "Depth of Coverage", ylim=c(0,100), col = "#3366CC", main="Chr 20")
dev.off()

#Chromosome 21
file_name <- paste(samplename,"Chr_21_Exome_coverage.pdf")
Coverage_Data = read.table("Chr_21.txt", sep="")
pdf(file_name,width=16,height=10, title="Exome Coverage")
plot(x = Coverage_Data$V3, type = "h", las=0, xlab = "Location on Chromosome", ylab= "Depth of Coverage", ylim=c(0,100), col = "#3366CC", main="Chr 21")
dev.off()

#Chromosome 22
file_name <- paste(samplename,"Chr_22_Exome_coverage.pdf")
Coverage_Data = read.table("Chr_22.txt", sep="")
pdf(file_name,width=16,height=10, title="Exome Coverage")
plot(x = Coverage_Data$V3, type = "h", las=0, xlab = "Location on Chromosome", ylab= "Depth of Coverage", ylim=c(0,100), col = "#3366CC", main="Chr 22")
dev.off()

#Chromosome X
file_name <- paste(samplename,"Chr_X_Exome_coverage.pdf")
Coverage_Data = read.table("Chr_X.txt", sep="")
pdf(file_name,width=16,height=10, title="Exome Coverage")
plot(x = Coverage_Data$V3, type = "h", las=0, xlab = "Location on Chromosome", ylab= "Depth of Coverage", ylim=c(0,100), col = "#3366CC", main="Chr X")
dev.off()

#Chromosome Y
file_name <- paste(samplename,"Chr_Y_Exome_coverage.pdf")
Coverage_Data = read.table("Chr_Y.txt", sep="")
pdf(file_name,width=16,height=10, title="Exome Coverage")
plot(x = Coverage_Data$V3, type = "h", las=0, xlab = "Location on Chromosome", ylab= "Depth of Coverage", ylim=c(0,100), col = "#3366CC", main="Chr Y")
dev.off()