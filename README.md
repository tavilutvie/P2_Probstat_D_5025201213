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
![image](https://user-images.githubusercontent.com/85897222/170876802-aa060d1c-4a51-4c9b-b3d8-6f256033d7ea.png)

### 1b
carilah nilai t (p-value) <br>
t(p-value) didapatkan dengan menghitung menggunakan rumus.
```r
t = 2 * pt(-abs(( (mean(selisih) - 0) / (standardeviasi / sqrt(9)))), df=8)
t
```
![image](https://user-images.githubusercontent.com/85897222/170877098-5ce6fda9-9458-4321-bb70-8fe414477ce0.png)

### 1c
tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴” <br>
melihat hasil komparasi menggunakan var.test() dan untuk melihat pengaruhnya digunakan t.test()
```r
var.test(x, y)
t.test(x, y, mu = 0, alternative = "two.sided", var.equal = TRUE, conf.level = 0.95)
```
![image](https://user-images.githubusercontent.com/85897222/170877133-2fe6e47b-eeac-4691-b164-c69c0bcd1bac.png)
P-value lebih kecil dibandingkan tingkat signifikansi (0,05) maka hipotesis nol tidak berlaku. <br>


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
H0: rata-rata saham bandung == saham bali <br>
H1: rata-rata saham bandung != saham bali <br>

## Soal 4
Seorang Peneliti sedang meneliti spesies dari kucing di ITS . Dalam penelitiannya ia mengumpulkan data tiga spesies kucing yaitu kucing oren, kucing hitam dan kucing putih dengan panjangnya masing-masing. <br>
Jika : <br>
diketahui dataset https://intip.in/datasetprobstat1 <br>
H0 : Tidak ada perbedaan panjang antara ketiga spesies atau rata-rata panjangnya sama <br>
Maka Kerjakan atau Carilah: <br>

### 4a
Buatlah masing masing jenis spesies menjadi 3 subjek "Grup" (grup 1,grup 2,grup 3). Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan lihat apakah ada outlier utama dalam homogenitas varians. <br>
Dilakukan perlukan independen variabel berupa factor. qqnorm() dan qqline() digunakan untuk gambar plot kuantil. <br>
```r
kucingITS$Group <- as.factor(kucingITS$Group)
kucingITS$Group = factor(kucingITS$Group,labels = c("Kucing oren", "Kucing hitam", "Kucing putih"))

class(kucingITS$Group)

Group1 <- subset(kucingITS, Group == "Kucing oren")
Group2 <- subset(kucingITS, Group == "Kucing hitam")
Group3 <- subset(kucingITS, Group == "Kucing putih")

qqnorm(Group1$Length)
qqline(Group1$Length)

qqnorm(Group2$Length)
qqline(Group2$Length)

qqnorm(Group2$Length)
qqline(Group2$Length)
```
Group1: <br>
![image](https://user-images.githubusercontent.com/85897222/170880649-671f5652-373d-4771-8d7b-9ebfc2fb5911.png) <br>
Group2: <br>
![image](https://user-images.githubusercontent.com/85897222/170879719-61f33bc3-2708-48f4-a88c-55270250382d.png) <br>
Group3: <br>
![image](https://user-images.githubusercontent.com/85897222/170880583-34d89465-3cc7-46cc-afd7-caaa20357a5f.png) <br>

### 4b
carilah atau periksalah Homogeneity of variances nya , Berapa nilai p yang didapatkan? , Apa hipotesis dan kesimpulan yang dapat diambil ? <br>
memeriksa homogenety varian dengan bartlett.test().
```r
bartlett.test(Length ~ Group, data = kucingITS)
```
p-value = 0.08054 <br>
Kesimpulannya: Bartlett's K-squared = 0.43292 dan df = 2 <br>
![image](https://user-images.githubusercontent.com/85897222/170879892-9e2e69fd-572e-4259-8762-118656cc9568.png)

### 4c
Untuk uji ANOVA (satu arah), buatlah model linier dengan Panjang versus Grup dan beri nama model tersebut model 1. <br>
Digunakan lm() dan anova() <br>
```r
model1 = lm(Length ~ Group, data = kucingITS)
anova(model1)
``` 
![image](https://user-images.githubusercontent.com/85897222/170879961-f1f8b549-5e40-41b2-8a65-290bac2dbacc.png)

### 4d
Dari Hasil Poin C, Berapakah nilai-p ? , Apa yang dapat Anda simpulkan dari H0? <br>
pvalue = 0.0013 < tingkat signifikansi(0.5). H0 ditolak. <br>

### 4e
Verifikasilah jawaban model 1 dengan Post-hoc test Tukey HSD, dari nilai p yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? Jelaskan. <br>
```r
TukeyHSD(aov(model1))
``` 
![image](https://user-images.githubusercontent.com/85897222/170880148-97f84759-301b-4283-89f6-fe2b6dd2c620.png)

### 4f
Visualisasikan data dengan ggplot2 <br>
digunakan library ggplot2 untuk memvisualisasikan data. <br>
```r
library("ggplot2")

ggplot(kucingITS, aes(x = Group, y = Length)) + geom_boxplot(fill = "grey80", colour = "black") + scale_x_discrete() + xlab("Treatment Group") + ylab("Length (cm)")
``` 
![image](https://user-images.githubusercontent.com/85897222/170880204-b1d2147d-0718-4218-8f99-1b8398dba2af.png)

## Soal 5
Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis kaca pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan dilakukan sebanyak 27 kali dan didapat data sebagai berikut: Data Hasil Eksperimen. Dengan data tersebut: <br>
![image](https://user-images.githubusercontent.com/85897222/170878525-69c706a8-728b-40a0-87a9-ea89a90271aa.png)

### 5a
Buatlah plot sederhana untuk visualisasi data <br>
Untuk visualisaasi, digunakan qplot <br>
```r
qplot(x = Temp, y = Light, geom = "point", data = GLASSTEMPLIGHT) + facet_grid(.~Glass, labeller = label_both)
```
![image](https://user-images.githubusercontent.com/85897222/170878557-55f6d886-7582-4089-b879-1a749e029e0e.png)

### 5b
Lakukan uji ANOVA dua arah <br>
Dibutuhkan independen variabel berupa factor. Kemudian dilakukan analisis varians menggunakan aov(). <br>
```r
GLASSTEMPLIGHT$Glass <- as.factor(GLASSTEMPLIGHT$Glass)
GLASSTEMPLIGHT$Temp_Factor <- as.factor(GLASSTEMPLIGHT$Temp)
str(GLASSTEMPLIGHT)

anova <- aov(Light ~ Glass*Temp_Factor, data = GLASSTEMPLIGHT)
summary(anova)
```
![image](https://user-images.githubusercontent.com/85897222/170878644-4164ddd5-b416-4d33-bf0a-27c33efd4d30.png)

### 5c
Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi) <br>
Kita akan mengatur cara dalam urutan menurun, yang akan diperlukan untuk menambahkan huruf superskrip dari tes Tukey.
```r
data_summary <- group_by(GLASSTEMPLIGHT, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)
```
![image](https://user-images.githubusercontent.com/85897222/170878862-b73d8497-748c-46b4-9585-d2efc593ca4b.png)

### 5d
Lakukan uji Tukey <br>
Perbandingan rata-rata dengan uji Tukey dapat dijalankan pada objek yang dihasilkan dari analisis varians. <br>
```r
tukey <- TukeyHSD(anova)
print(tukey)
```
![image](https://user-images.githubusercontent.com/85897222/170878968-3b3deaff-d584-4f1b-b9ef-180f470000ab.png)

### 5e
TGunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey <br>
Penggunaan huruf untuk menunjukkan perbedaan yang signifikan dalam perbandingan berpasangan, juga disebut tampilan huruf kompak, dan dapat menyederhanakan visualisasi dan pembahasan perbedaan yang signifikan antar sarana. Kita akan menggunakan fungsi multcompLetters4(). <br>
```r
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)
```
![image](https://user-images.githubusercontent.com/85897222/170878995-89d3a0ff-45c5-46ee-9bd2-512ef738c406.png)
