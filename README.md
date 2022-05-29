# P1_Probstat_D_5025201213

| NRP        | NAMA                       |
| ---------- | -------------------------- |
| 5025201213 | Eldenabih Tavirazin Lutvie |

## Soal 1
Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap kadar saturasi oksigen pada manusia. <br>

### 1a
Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel <br>
standar deviasi didapatkan dengan fungsi sd().
```r
selisih = y - x

standardeviasi = sd(selisih)
standardeviasi
```
![image](https://user-images.githubusercontent.com/85897222/170874814-9c3461f4-a53a-466c-a2af-e6ac37f5711b.png)

### 1b
carilah nilai t (p-value) <br>
t(p-value) didapatkan dengan menghitung menggunakan rumus.
```r
t = 2 * pt(-abs(( (mean(selisih) - 0) / (standardeviasi / sqrt(9)))), df=8)
t
```
![image](https://user-images.githubusercontent.com/85897222/170874855-09dd63d9-6871-44a2-b82c-f732ef31d4ca.png)

### 1c
tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴” <br>
melihat hasil komparasi menggunakan var.test() dan untuk melihat pengaruhnya digunakan t.test()
```r
var.test(x, y)
t.test(x, y, mu = 0, alternative = "two.sided", var.equal = TRUE, conf.level = 0.95)
```
P-value lebih kecil dibandingkan tingkat signifikansi (0,05) maka hipotesis nol tidak berlaku. <br>
![image](https://user-images.githubusercontent.com/85897222/170874239-f206b468-d64e-4157-ad2c-dbb0c414b095.png)

## Soal 2
Diketahui bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3900 kilometer. <br>

### 2a
Apakah Anda setuju dengan klaim tersebut? <br>
Setuju <br>

### 2b
Jelaskan maksud dari output yang dihasilkan! <br>
Melakukan uji-t sampelberdasarkan informasi ringkasan menggunakan tsum.test().
```r
tsum.test(mean.x=23500, sd(3900), n.x=100, var.equal = TRUE, alternative = "greater", mu = 20000)
```
Berdasarkan output yang dihasilkan, diperoleh bahwa: <br>
H0 dengan μ=20000 dan H1 dengan μ>20000 <br>
![image](https://user-images.githubusercontent.com/85897222/170874653-f679e1c3-e1c1-467a-88bd-f39651e53d69.png)

### 2c
Buatlah kesimpulan berdasarkan P-Value yang dihasilkan! <br>
Dengan menggunakan rumus, didapatkan z = 8.97 dan P(Z > 8.97) = 1 - P(Z < 8.97). <br>
Hipotesis nol berlaku. Kesimpulannya adalah mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun. <br>

## Soal 3
Diketahui perusahaan memiliki seorang data analyst ingin memecahkan permasalahan pengambilan keputusan dalam perusahaan tersebut. <br>
Asumsikan nilai variancenya sama, apakah ada perbedaan pada rata-ratanya (α= 0.05)? Buatlah : <br>

### 3a
H0 dan H1 <br>
Menghitung z dengan rumus. <br>
```r
#H0:
z1=(3.64-0)/(1.67/sqrt(19))
#H1:
z2=(2.79-0)/(1.32/sqrt(27))
```

## Soal 4
Seorang Peneliti sedang meneliti spesies dari kucing di ITS . Dalam penelitiannya ia mengumpulkan data tiga spesies kucing yaitu kucing oren, kucing hitam dan kucing putih dengan panjangnya masing-masing. <br>
Jika : <br>
diketahui dataset https://intip.in/datasetprobstat1 <br>
H0 : Tidak ada perbedaan panjang antara ketiga spesies atau rata-rata panjangnya sama <br>
Maka Kerjakan atau Carilah: <br>

### 4a
Buatlah masing masing jenis spesies menjadi 3 subjek "Grup" (grup 1,grup 2,grup 3). Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan lihat apakah ada outlier utama dalam homogenitas varians. <br>
Dilakukan read dan membuat grup untuk masing-masing jenis spesies dengan potongan kode berikut. <br>
```r
dataoneway <- read.table(url("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt"),h=T)
attach(dataoneway)
names(dataoneway)

dataoneway$Group <- as.factor(dataoneway$Group)
dataoneway$Group = factor(dataoneway$Group,labels = c("Kucing oren", "Kucing hitam", "Kucing putih"))

class(dataoneway$Group)

Group1 <- subset(dataoneway, Group == "Kucing oren")
Group2 <- subset(dataoneway, Group == "Kucing hitam")
Group3 <- subset(dataoneway, Group == "Kucing putih")
```
![image](https://user-images.githubusercontent.com/85897222/170875424-b7624127-97a5-4171-9cf6-c4bf199f0f9e.png)

### 4b
carilah atau periksalah Homogeneity of variances nya , Berapa nilai p yang didapatkan? , Apa hipotesis dan kesimpulan yang dapat diambil ? <br>
memeriksa homogenety varian dengan bartlett.test().
```r
bartlett.test(Length ~ Group, data = dataoneway)
```
Kesimpulannya: Bartlett's K-squared = 0.43292, df = 2, dan p-value = 0.08054 <br>
![image](https://user-images.githubusercontent.com/85897222/170875478-af61405d-80fe-427c-9a6d-2d25aa69acb0.png)

### 4c
Untuk uji ANOVA (satu arah), buatlah model linier dengan Panjang versus Grup dan beri nama model tersebut model 1. <br>
Digunakan qqnorm() dan qqline() <br>
```r
qqnorm(Group1$Length)
qqline(Group1$Length)

qqnorm(Group2$Length)
qqline(Group2$Length)

qqnorm(Group2$Length)
qqline(Group2$Length)
``` 
![image](https://user-images.githubusercontent.com/85897222/170875601-f580080c-b064-4fd5-b9a4-d9b57d217b63.png)

### 4d
Dari Hasil Poin C, Berapakah nilai-p ? , Apa yang dapat Anda simpulkan dari H0? <br>
```r
pvalue = 0.8054
``` 
H0 ditolak <br>

### 4e
Verifikasilah jawaban model 1 dengan Post-hoc test Tukey HSD, dari nilai p yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? Jelaskan. <br>
```r
model1 = lm(Length ~ Group, data = dataoneway)
anova(model1)
TukeyHSD(aov(model1))
``` 
![image](https://user-images.githubusercontent.com/85897222/170875654-06ed6487-5421-4bca-8a2a-f58e1591d72e.png)

### 4f
Visualisasikan data dengan ggplot2 <br>
digunakan ggplot untuk memvisualisasikan data <br>
```r
install.packages("ggplot2")
library("ggplot2")

ggplot(dataoneway, aes(x = Group, y = Length)) + geom_boxplot(fill = "grey80", colour = "black") + scale_x_discrete() + xlab("Treatment Group") + ylab("Length (cm)")
``` 
![image](https://user-images.githubusercontent.com/85897222/170875695-078185d6-4b27-4b86-82e2-68572c85ed53.png)
