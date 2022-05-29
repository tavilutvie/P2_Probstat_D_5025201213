#Soal1
x <- c(78, 75, 67, 77, 70, 72, 28, 74, 77)
y <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)

#a
selisih = y - x

standardeviasi = sd(selisih)
standardeviasi

#b
t = 2 * pt(-abs(( (mean(selisih) - 0) / (standardeviasi / sqrt(9)))), df=8)
t

#c
var.test(x, y)
t.test(x, y, mu = 0, alternative = "two.sided", var.equal = TRUE, conf.level = 0.95)

#P-value lebih kecil dibandingkan tingkat signifikansi (0,05) maka hipotesis nol tidak berlaku.

#Soal2
install.packages("BSDA")
library(BSDA)

#a
#setuju

#b
mobil.test(mean.x=23500, sd(3900), n.x=100)

#Berdasarkan output yang dihasilkan, diperoleh nilai thitung = 12.013,
dengan derajat bebas 70 dan nilai p-value < 2.2e-16. Dari hasil tersebut
peneliti dapat menolak hipotesis awal dan disimpulkan bahwa terdapat cukup
bukti di mana rata-rata dari variabel weight secara signifikan adalah tidak
sama dengan 150. Selain itu, dari output di atas, kita juga peroleh selang
kepercayaan rata-rata dari sampel yang berkisar di antara 242.8301 dan
279.7896 atau dapat dinyatakan bahwa dengan selang kepercayaan 95% kita
yakin rata-rata weight akan berkisar antara 242.8301 sampai 279.7896.
Rata-rata weight dari data sampel yang dihitung adalah 261.3099.

#c
#Hipotesis nol berlaku. Kesimpulannya adalah mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun.