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
plot(x = FZD4_df$V2, type = "l", y = FZD4_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(86665842,86666128), col = "#3366CC", main="FZD4 Exon 1")
plot(x = FZD4_df$V2, type = "l", y = FZD4_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(86662183,86663513), col = "#3366CC", main="FZD4 Exon 2")
dev.off()

#########
#LRP5 data
#########
LRP5<-paste(sample,"_LRP5_Exons.txt", sep="")
LRP5_df <- read.csv2(LRP5, sep = '\t', header = F)
pdf("LRP5_coverage.pdf",width=10,height=16, title="LRP5")
par(mfrow=c(4,2))
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68080182,68080274), col = "#3366CC", main="LRP5 Exon 1")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68115314,68115713), col = "#3366CC", main="LRP5 Exon 2")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68125117,68125316), col = "#3366CC", main="LRP5 Exon 3")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68131214,68131412), col = "#3366CC", main="LRP5 Exon 4")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68133038,68133171), col = "#3366CC", main="LRP5 Exon 5")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68153783,68154181), col = "#3366CC", main="LRP5 Exon 6")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68157348,68157521), col = "#3366CC", main="LRP5 Exon 7")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68170950,68171168), col = "#3366CC", main="LRP5 Exon 8")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68173991,68174282), col = "#3366CC", main="LRP5 Exon 9")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68177381,68177609), col = "#3366CC", main="LRP5 Exon 10")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68178903,68179089), col = "#3366CC", main="LRP5 Exon 11")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68181156,68181481), col = "#3366CC", main="LRP5 Exon 12")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68183795,68183996), col = "#3366CC", main="LRP5 Exon 13")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68190956,68191165), col = "#3366CC", main="LRP5 Exon 14")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68192569,68192760), col = "#3366CC", main="LRP5 Exon 15")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68193445,68193656), col = "#3366CC", main="LRP5 Exon 16")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68197042,68197169), col = "#3366CC", main="LRP5 Exon 17")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68201069,68201307), col = "#3366CC", main="LRP5 Exon 18")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68204356,68204468), col = "#3366CC", main="LRP5 Exon 19")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68205913,68206151), col = "#3366CC", main="LRP5 Exon 20")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68207244,68207385), col = "#3366CC", main="LRP5 Exon 21")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68213903,68214002), col = "#3366CC", main="LRP5 Exon 22")
plot(x = LRP5_df$V2, type = "l", y = LRP5_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(68216276,68216539), col = "#3366CC", main="LRP5 Exon 23")
dev.off()

#########
#TSPAN12 data
#########
TSPAN12<-paste(sample,"_TSPAN12_Exons.txt", sep="")
TSPAN12_df <- read.csv2(TSPAN12, sep = '\t', header = F)
pdf("TSPAN12_coverage.pdf",width=10,height=16, title="TSPAN12")
par(mfrow=c(4,2))
plot(x = TSPAN12_df$V2, type = "l", y = TSPAN12_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(120496751,120496818), col = "#3366CC", main="TSPAN12 Exon 01")
plot(x = TSPAN12_df$V2, type = "l", y = TSPAN12_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(120480080,120480163), col = "#3366CC", main="TSPAN12 Exon 02")
plot(x = TSPAN12_df$V2, type = "l", y = TSPAN12_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(120478830,120478967), col = "#3366CC", main="TSPAN12 Exon 03")
plot(x = TSPAN12_df$V2, type = "l", y = TSPAN12_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(120455782,120455858), col = "#3366CC", main="TSPAN12 Exon 04")
plot(x = TSPAN12_df$V2, type = "l", y = TSPAN12_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(120450516,120450625), col = "#3366CC", main="TSPAN12 Exon 05")
plot(x = TSPAN12_df$V2, type = "l", y = TSPAN12_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(120446602,120446747), col = "#3366CC", main="TSPAN12 Exon 06")
plot(x = TSPAN12_df$V2, type = "l", y = TSPAN12_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(120428645,120428952), col = "#3366CC", main="TSPAN12 Exon 07")
dev.off()

#########
#KIF11 data
#########
KIF11<-paste(sample,"_KIF11_Exons.txt", sep="")
KIF11_df <- read.csv2(KIF11, sep = '\t', header = F)
pdf("KIF11_coverage.pdf",width=10,height=16, title="KIF11")
par(mfrow=c(4,2))
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94353132,94353210), col = "#3366CC", main="KIF11 Exon 1")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94366021,94366155), col = "#3366CC", main="KIF11 Exon 2")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94366375,94366474), col = "#3366CC", main="KIF11 Exon 3")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94366915,94366995), col = "#3366CC", main="KIF11 Exon 4")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94368776,94368963), col = "#3366CC", main="KIF11 Exon 5")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94369141,94369267), col = "#3366CC", main="KIF11 Exon 6")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94372796,94372888), col = "#3366CC", main="KIF11 Exon 7")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94373133,94373375), col = "#3366CC", main="KIF11 Exon 8")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94376493,94376590), col = "#3366CC", main="KIF11 Exon 9")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94381141,94381231), col = "#3366CC", main="KIF11 Exon 10")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94388564,94388653), col = "#3366CC", main="KIF11 Exon 11")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94389932,94390122), col = "#3366CC", main="KIF11 Exon 12")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94392242,94392451), col = "#3366CC", main="KIF11 Exon 13")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94393379,94393553), col = "#3366CC", main="KIF11 Exon 14")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94396940,94397067), col = "#3366CC", main="KIF11 Exon 15")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94397143,94397303), col = "#3366CC", main="KIF11 Exon 16")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94399550,94399658), col = "#3366CC", main="KIF11 Exon 17")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94405119,94405400), col = "#3366CC", main="KIF11 Exon 18")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94407968,94408192), col = "#3366CC", main="KIF11 Exon 19")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94409591,94409744), col = "#3366CC", main="KIF11 Exon 20")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94410157,94410275), col = "#3366CC", main="KIF11 Exon 21")
plot(x = KIF11_df$V2, type = "l", y = KIF11_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(94413421,94413554), col = "#3366CC", main="KIF11 Exon 22")
dev.off()

#########
#CTNNB1 data
#########
CTNNB1<-paste(sample,"_CTNNB1_Exons.txt", sep="")
CTNNB1_df <- read.csv2(CTNNB1, sep = '\t', header = F)
pdf("CTNNB1_coverage.pdf",width=10,height=16, title="CTNNB1")
par(mfrow=c(4,2))
plot(x = CTNNB1_df$V2, type = "l", y = CTNNB1_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(41265559,41265573), col = "#3366CC", main="CTNNB1 Exon 1")
plot(x = CTNNB1_df$V2, type = "l", y = CTNNB1_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(41266444,41266699), col = "#3366CC", main="CTNNB1 Exon 2")
plot(x = CTNNB1_df$V2, type = "l", y = CTNNB1_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(41266824,41267064), col = "#3366CC", main="CTNNB1 Exon 3")
plot(x = CTNNB1_df$V2, type = "l", y = CTNNB1_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(41267150,41267352), col = "#3366CC", main="CTNNB1 Exon 4")
plot(x = CTNNB1_df$V2, type = "l", y = CTNNB1_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(41268698,41268844), col = "#3366CC", main="CTNNB1 Exon 5")
plot(x = CTNNB1_df$V2, type = "l", y = CTNNB1_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(41274831,41274936), col = "#3366CC", main="CTNNB1 Exon 6")
plot(x = CTNNB1_df$V2, type = "l", y = CTNNB1_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(41275019,41275359), col = "#3366CC", main="CTNNB1 Exon 7")
plot(x = CTNNB1_df$V2, type = "l", y = CTNNB1_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(41275629,41275789), col = "#3366CC", main="CTNNB1 Exon 8")
plot(x = CTNNB1_df$V2, type = "l", y = CTNNB1_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(41277214,41277335), col = "#3366CC", main="CTNNB1 Exon 9")
plot(x = CTNNB1_df$V2, type = "l", y = CTNNB1_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(41277839,41277991), col = "#3366CC", main="CTNNB1 Exon 10")
plot(x = CTNNB1_df$V2, type = "l", y = CTNNB1_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(41278078,41278201), col = "#3366CC", main="CTNNB1 Exon 11")
plot(x = CTNNB1_df$V2, type = "l", y = CTNNB1_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(41279506,41279568), col = "#3366CC", main="CTNNB1 Exon 12")
plot(x = CTNNB1_df$V2, type = "l", y = CTNNB1_df$V3, las=2, xlab = "", ylab= "Depth", ylim=c(0,100), xlim=c(41280624,41280834), col = "#3366CC", main="CTNNB1 Exon 13")
dev.off()