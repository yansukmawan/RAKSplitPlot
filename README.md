# RAKSplitPlot
Analisis data RAK Split-plot

**Tentang Data Percobaan pada Tutorial Ini**

Contoh data yang disajikan adalah sebuah percobaan lapangan dengan rancangan split-plot yang disusun dalam rancangan acak kelompok (RAK). Terdapat dua faktor perlakuan, yaitu waktu penyiraman (disingkat Waktu) sebagai petak utama/petak induk dan dosis pupuk (disingkat Dosis) sebagai anak petak. Waktu penyiraman terdiri atas tiga taraf dan dosis pupuk juga terdiri atas tiga taraf. Masing-masing kombinasi perlakuan diulang sebanyak tiga kali. Jumlah tanaman per satuan percobaan yaitu tiga tanaman yang diamati seluruhnya kemudian hasil pengukuran dirata-rata. Pada contoh ini, variabel pengamatan ada tiga, yaitu tinggi tanaman (TT3), diameter batang (DB3), dan jumlah daun (JD3).  

Terdapat beberapa file yang dapat diunduh dan dipelajari, yaitu: file contoh data (split.xlsx) dan file syntax (dalam format txt dan R file).

Package/library yang diperlukan:

```sh
readxl
doebioresearch
PerformanceAnalytics
corrplot
```

```sh
####ANOVA: split-plot####
library(readxl)  #mengimpor data
split <- read_excel("D:/Analisis Statistika/RAKSplitPlot/split.xlsx")
View(split)  #menampilkan dataset
str(split)  #menampilkan struktur data
```
```sh
##mengubah struktur data##
split$Waktu<-as.factor(split$Waktu)
split$Dosis<-as.factor(split$Dosis)
split$Kelompok<-as.factor(split$Kelompok)
str(split)
```
![image](https://github.com/yansukmawan/RAKSplitPlot/assets/66309330/35bbd04c-5999-4007-a2a3-c31d8d63a2ed) 

```sh
##ANOVA dan Uji Lanjut dengan BNJ, BNT, DMRT##
library(doebioresearch)
#splitplot(data, block, main.plot, sub.plot, mean.comparison.test)#  #ini adalah model yang digunakan
splitplot(split[4],drip$Kelompok,drip$Waktu,drip$Dosis,1)  #ANOVA-LSD untuk TT3
splitplot(split[4],drip$Kelompok,drip$Waktu,drip$Dosis,2)  #ANOVA-DMRT untuk TT3
splitplot(split[4],drip$Kelompok,drip$Waktu,drip$Dosis,3)  #ANOVA-HSD untuk TT3
splitplot(split[4:6],drip$Kelompok,drip$Waktu,drip$Dosis,2)  #ANOVA-DMRT untuk TT3, DB3, dan JD3
```
![image](https://github.com/yansukmawan/RAKSplitPlot/assets/66309330/59c39d51-9da8-4835-9fc4-e36622ba8a2c)
![image](https://github.com/yansukmawan/RAKSplitPlot/assets/66309330/8d520730-cdc2-4dfc-88f8-4723777596c7)
![image](https://github.com/yansukmawan/RAKSplitPlot/assets/66309330/de022a4d-f151-4338-90e0-958c51cef056)
![image](https://github.com/yansukmawan/RAKSplitPlot/assets/66309330/3e0b3509-9a63-47b5-b510-8445dc9eda89)
![image](https://github.com/yansukmawan/RAKSplitPlot/assets/66309330/e581725f-4845-44cd-8fc2-21e7649ed740)
![image](https://github.com/yansukmawan/RAKSplitPlot/assets/66309330/49c141c3-7865-4570-b71d-fdaddfb65c36)

```sh
##analisis korelasi##
library(PerformanceAnalytics)
my_dat<-split[, c(4,5,6)]
chart.Correlation(my_dat, histogram = TRUE, pch=19)
```
![image](https://github.com/yansukmawan/RAKSplitPlot/assets/66309330/e1179222-8fc8-424d-903b-8bbe951870fb)

```sh
library(corrplot)
cor_matrix = cor(my_dat)
corrplot(cor_matrix, type = "upper", method = "circle", addCoef.col = "black", tl.col = "black", tl.srt = 45)
```
![image](https://github.com/yansukmawan/RAKSplitPlot/assets/66309330/6c15780b-e81a-49a7-8a38-b7adb96dcff1)
