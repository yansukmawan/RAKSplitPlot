####ANOVA: split-plot####
#mengimpor data
library(readxl)
split <- read_excel("D:/Analisis Statistika/RAKSplitPlot/split.xlsx")
View(split)
str(split)

#mengubah struktur data
split$Waktu<-as.factor(split$Waktu)
split$Dosis<-as.factor(split$Dosis)
split$Kelompok<-as.factor(split$Kelompok)
str(split)

#ANOVA dan Uji Lanjut dengan BNJ, BNT, DMRT
library(doebioresearch)
#splitplot(data, block, main.plot, sub.plot, mean.comparison.test)#model yang digunakan
splitplot(split[4],drip$Kelompok,drip$Waktu,drip$Dosis,1) #ANOVA-LSD untuk TT3
splitplot(split[4],drip$Kelompok,drip$Waktu,drip$Dosis,2) #ANOVA-DMRT untuk TT3
splitplot(split[4],drip$Kelompok,drip$Waktu,drip$Dosis,3) #ANOVA-HSD untuk TT3
splitplot(split[4:6],drip$Kelompok,drip$Waktu,drip$Dosis,2) #ANOVA-DMRT untuk TT3, DB3, dan JD3

####analisis korelasi####
library(PerformanceAnalytics)
my_dat<-split[, c(4,5,6)]
chart.Correlation(my_dat, histogram = TRUE, pch=19)

library(corrplot)
cor_matrix = cor(my_dat)
corrplot(cor_matrix, type = "upper", method = "circle", addCoef.col = "black", tl.col = "black", tl.srt = 45)
