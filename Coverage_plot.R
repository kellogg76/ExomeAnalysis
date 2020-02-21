#Set working directory
setwd("D:/BatchCoverage/F10_001")

#File that this code reads is from coding_coverage.sh

sample<-"F10_001"

#########
#NDP data
#########
#File to read
NDP<-paste(sample,"_NDP_Exons.txt", sep="")
#Create data frame
NDP_df <- read.csv2(NDP, sep = '\t', header = F)
#PDF setup as 4 rows, 2 columns
pdf("NDP_coverage.pdf",width=10,height=16, title="NDP")
par(mfrow=c(4,2))
par(mar = c(5,4,2,2))
plot(x = NDP_df$V2, type = "l", y = NDP_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(43817718,43817891), col = "#3366CC", main="NDP Exon 1")
plot(x = NDP_df$V2, type = "l", y = NDP_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(43809045,43809272), col = "#3366CC", main="NDP Exon 2")
dev.off()

#########
#ATOH7 data
#########
ATOH7<-paste(sample,"_ATOH7_Exons.txt", sep="")
ATOH7_df <- read.csv2(ATOH7, sep = '\t', header = F)
pdf("ATOH7_coverage.pdf",width=10,height=16, title="NDP")
par(mfrow=c(4,2))
plot(x = ATOH7_df$V2, type = "l", y = ATOH7_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(69990976,69991434), col = "#3366CC", main="ATOH7 Exon 1")
dev.off()

#########
#ZNF408 data
#########
ZNF408<-paste(sample,"_ZNF408_Exons.txt", sep="")
ZNF408_df <- read.csv2(ZNF408, sep = '\t', header = F)
pdf("ZNF408_coverage.pdf",width=10,height=16, title="ZNF408")
par(mfrow=c(4,2))
plot(x = ZNF408_df$V2, type = "l", y = ZNF408_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(46722664,46722691), col = "#3366CC", main="ZNF408 Exon 1")
plot(x = ZNF408_df$V2, type = "l", y = ZNF408_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(46722949,46723226), col = "#3366CC", main="ZNF408 Exon 2")
plot(x = ZNF408_df$V2, type = "l", y = ZNF408_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(46724254,46724315), col = "#3366CC", main="ZNF408 Exon 3")
plot(x = ZNF408_df$V2, type = "l", y = ZNF408_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(46724534,46724793), col = "#3366CC", main="ZNF408 Exon 4")
plot(x = ZNF408_df$V2, type = "l", y = ZNF408_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(46725903,46727413), col = "#3366CC", main="ZNF408 Exon 5")
dev.off() 

#########
#FZD4 data
#########
FZD4<-paste(sample,"_FZD4_Exons.txt", sep="")
FZD4_df <- read.csv2(FZD4, sep = '\t', header = F)
pdf("FZD4_coverage.pdf",width=10,height=16, title="FZD4")
par(mfrow=c(4,2))
plot(x = FZD4_df$V2, type = "l", y = FZD4_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(86665843,86666127), col = "#3366CC", main="FZD4 Exon 1")
plot(x = FZD4_df$V2, type = "l", y = FZD4_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(86662184,86663512), col = "#3366CC", main="FZD4 Exon 2")
dev.off()

#########
#LRP5 data
#########
LRP5<-paste(sample,"_LRP5_Exons.txt", sep="")
LRP5_df <- read.csv2(LRP5, sep = '\t', header = F)
pdf("LRP5_coverage.pdf",width=10,height=16, title="LRP5")
par(mfrow=c(4,2))
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68080183,68080273), col = "#3366CC", main="LRP5 Exon 1")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68115315,68115711), col = "#3366CC", main="LRP5 Exon 2")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68125118,68125315), col = "#3366CC", main="LRP5 Exon 3")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68131215,68131411), col = "#3366CC", main="LRP5 Exon 4")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68133039,68133170), col = "#3366CC", main="LRP5 Exon 5")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68153784,68154180), col = "#3366CC", main="LRP5 Exon 6")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68157349,68157520), col = "#3366CC", main="LRP5 Exon 7")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68170951,68171167), col = "#3366CC", main="LRP5 Exon 8")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68173992,68174281), col = "#3366CC", main="LRP5 Exon 9")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68177382,68177608), col = "#3366CC", main="LRP5 Exon 10")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68178904,68179088), col = "#3366CC", main="LRP5 Exon 11")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68181157,68181480), col = "#3366CC", main="LRP5 Exon 12")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68183796,68183995), col = "#3366CC", main="LRP5 Exon 13")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68190957,68191165), col = "#3366CC", main="LRP5 Exon 14")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68192570,68192760), col = "#3366CC", main="LRP5 Exon 15")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68193446,68193655), col = "#3366CC", main="LRP5 Exon 16")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68197043,68197168), col = "#3366CC", main="LRP5 Exon 17")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68201070,68201306), col = "#3366CC", main="LRP5 Exon 18")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68204357,68204467), col = "#3366CC", main="LRP5 Exon 19")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68205914,68206150), col = "#3366CC", main="LRP5 Exon 20")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68207245,68207384), col = "#3366CC", main="LRP5 Exon 21")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68213904,68214001), col = "#3366CC", main="LRP5 Exon 22")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68216277,68216538), col = "#3366CC", main="LRP5 Exon 23")
dev.off()

#########
#TSPAN12 data
#########
TSPAN12<-paste(sample,"_TSPAN12_Exons.txt", sep="")
TSPAN12_df <- read.csv2(TSPAN12, sep = '\t', header = F)
pdf("TSPAN12_coverage.pdf",width=10,height=16, title="TSPAN12")
par(mfrow=c(4,2))
plot(x = TSPAN12_df$V2, type = "l", y = TSPAN12_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(120496752,120496817), col = "#3366CC", main="TSPAN12 Exon 01")
plot(x = TSPAN12_df$V2, type = "l", y = TSPAN12_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(120480081,120480163), col = "#3366CC", main="TSPAN12 Exon 02")
plot(x = TSPAN12_df$V2, type = "l", y = TSPAN12_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(120478831,120478966), col = "#3366CC", main="TSPAN12 Exon 03")
plot(x = TSPAN12_df$V2, type = "l", y = TSPAN12_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(120455783,120455857), col = "#3366CC", main="TSPAN12 Exon 04")
plot(x = TSPAN12_df$V2, type = "l", y = TSPAN12_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(120450517,120450624), col = "#3366CC", main="TSPAN12 Exon 05")
plot(x = TSPAN12_df$V2, type = "l", y = TSPAN12_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(120446603,120446746), col = "#3366CC", main="TSPAN12 Exon 06")
plot(x = TSPAN12_df$V2, type = "l", y = TSPAN12_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(120428646,120428951), col = "#3366CC", main="TSPAN12 Exon 07")
dev.off()

#########
#KIF11 data
#########
KIF11<-paste(sample,"_KIF11_Exons.txt", sep="")
KIF11_df <- read.csv2(KIF11, sep = '\t', header = F)
pdf("KIF11_coverage.pdf",width=10,height=16, title="KIF11")
par(mfrow=c(4,2))
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94353133,94353209), col = "#3366CC", main="KIF11 Exon 1")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94366022,94366154), col = "#3366CC", main="KIF11 Exon 2")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94366376,94366473), col = "#3366CC", main="KIF11 Exon 3")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94366916,94366994), col = "#3366CC", main="KIF11 Exon 4")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94368777,94368962), col = "#3366CC", main="KIF11 Exon 5")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94369142,94369266), col = "#3366CC", main="KIF11 Exon 6")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94372797,94372887), col = "#3366CC", main="KIF11 Exon 7")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94373134,94373376), col = "#3366CC", main="KIF11 Exon 8")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94376494,94376589), col = "#3366CC", main="KIF11 Exon 9")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94381142,94381230), col = "#3366CC", main="KIF11 Exon 10")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94388565,94388652), col = "#3366CC", main="KIF11 Exon 11")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94389933,94390121), col = "#3366CC", main="KIF11 Exon 12")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94392243,94392450), col = "#3366CC", main="KIF11 Exon 13")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94393380,94393552), col = "#3366CC", main="KIF11 Exon 14")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94396941,94397066), col = "#3366CC", main="KIF11 Exon 15")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94397144,94397302), col = "#3366CC", main="KIF11 Exon 16")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94399551,94399657), col = "#3366CC", main="KIF11 Exon 17")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94405120,94405399), col = "#3366CC", main="KIF11 Exon 18")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94407969,94408191), col = "#3366CC", main="KIF11 Exon 19")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94409592,94409743), col = "#3366CC", main="KIF11 Exon 20")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94410158,94410274), col = "#3366CC", main="KIF11 Exon 21")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94413422,94413553), col = "#3366CC", main="KIF11 Exon 22")
dev.off()

#########
#CTNNB1 data
#########
CTNNB1<-paste(sample,"_CTNNB1_Exons.txt", sep="")
CTNNB1_df <- read.csv2(CTNNB1, sep = '\t', header = F)
pdf("CTNNB1_coverage.pdf",width=10,height=16, title="CTNNB1")
par(mfrow=c(4,2))
plot(x = CTNNB1_df$V2, type = "l", y = CTNNB1_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(41265560,41265572), col = "#3366CC", main="CTNNB1 Exon 1")
plot(x = CTNNB1_df$V2, type = "l", y = CTNNB1_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(41266017,41266244), col = "#3366CC", main="CTNNB1 Exon 2")
plot(x = CTNNB1_df$V2, type = "l", y = CTNNB1_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(41266445,41266698), col = "#3366CC", main="CTNNB1 Exon 3")
plot(x = CTNNB1_df$V2, type = "l", y = CTNNB1_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(41266825,41267063), col = "#3366CC", main="CTNNB1 Exon 4")
plot(x = CTNNB1_df$V2, type = "l", y = CTNNB1_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(41267151,41267352), col = "#3366CC", main="CTNNB1 Exon 5")
plot(x = CTNNB1_df$V2, type = "l", y = CTNNB1_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(41268699,41268843), col = "#3366CC", main="CTNNB1 Exon 6")
plot(x = CTNNB1_df$V2, type = "l", y = CTNNB1_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(41274832,41274935), col = "#3366CC", main="CTNNB1 Exon 7")
plot(x = CTNNB1_df$V2, type = "l", y = CTNNB1_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(41275020,41275358), col = "#3366CC", main="CTNNB1 Exon 8")
plot(x = CTNNB1_df$V2, type = "l", y = CTNNB1_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(41275630,41275788), col = "#3366CC", main="CTNNB1 Exon 9")
plot(x = CTNNB1_df$V2, type = "l", y = CTNNB1_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(41277215,41277334), col = "#3366CC", main="CTNNB1 Exon 10")
plot(x = CTNNB1_df$V2, type = "l", y = CTNNB1_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(41277840,41277990), col = "#3366CC", main="CTNNB1 Exon 11")
plot(x = CTNNB1_df$V2, type = "l", y = CTNNB1_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(41278079,41278200), col = "#3366CC", main="CTNNB1 Exon 12")
plot(x = CTNNB1_df$V2, type = "l", y = CTNNB1_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(41279507,41279567), col = "#3366CC", main="CTNNB1 Exon 13")
plot(x = CTNNB1_df$V2, type = "l", y = CTNNB1_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(41280625,41280833), col = "#3366CC", main="CTNNB1 Exon 14")
dev.off()