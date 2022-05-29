#Soal 1
x <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
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

#Soal 2
library(BSDA)

#a
#setuju

#b
tsum.test(mean.x=23500, sd(3900), n.x=100, var.equal = TRUE, alternative = "greater", mu = 20000)

#Berdasarkan output yang dihasilkan, diperoleh bahwa:
#H0 dengan ??=20000 dan H1 dengan ??>20000

#c
#Dengan menggunakan rumus, didapatkan z = 8.97 dan P(Z > 8.97) = 1 - P(Z < 8.97).
#Hipotesis nol berlaku. Kesimpulannya adalah mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun.



#Soal 3
library(BSDA)

#a
#H0: rata-rata saham bandung == rata-ratasaham bali
#H1: rata-rata saham bandung != rata-rata saham bali

#b
tsum.test(mean.x=3.64, s.x = 1.67, n.x = 19, mean.y =2.79 , s.y = 1.32, n.y = 27, alternative = "greater", var.equal = TRUE)

#e
#H0 ditolak

#f
#Kesimpulannya adalah rata-rata saham bandung != rata-rata saham .

#Soal 4
kucingITS <- read.table(url("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt"),h=T)
attach(kucingITS)
names(kucingITS)

#a
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

qqnorm(Group3$Length)
qqline(Group3$Length)

#b
bartlett.test(Length ~ Group, data = kucingITS)
#p-value = 0.08054
#Kesimpulannya: Bartlett's K-squared = 0.43292 dan df = 2

#c
model1 = lm(Length ~ Group, data = kucingITS)
anova(model1)

#d
#pvalue = 0.0013 < tingkat signifikansi(0.5). H0 ditolak.

#e
TukeyHSD(aov(model1))

#f
library("ggplot2")

ggplot(kucingITS, aes(x = Group, y = Length)) + geom_boxplot(fill = "grey80", colour = "black") + scale_x_discrete() + xlab("Treatment Group") + ylab("Length (cm)")

#Soal 5
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)
GLASSTEMPLIGHT <- read.csv("https://drive.google.com/u/0/uc?id=1aLUOdw_LVJq6VQrQEkuQhZ8FW43FemTJ&export=download")
head(GLASSTEMPLIGHT)
str(GLASSTEMPLIGHT)

#a
qplot(x = Temp, y = Light, geom = "point", data = GLASSTEMPLIGHT) + facet_grid(.~Glass, labeller = label_both)

#b
GLASSTEMPLIGHT$Glass <- as.factor(GLASSTEMPLIGHT$Glass)
GLASSTEMPLIGHT$Temp_Factor <- as.factor(GLASSTEMPLIGHT$Temp)
str(GLASSTEMPLIGHT)

anova <- aov(Light ~ Glass*Temp_Factor, data = GLASSTEMPLIGHT)
summary(anova)

#c
data_summary <- group_by(GLASSTEMPLIGHT, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)

#d
tukey <- TukeyHSD(anova)
print(tukey)

#e
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)

