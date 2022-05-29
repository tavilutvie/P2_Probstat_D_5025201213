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
tsum.test(mean.x=23500, sd(3900), n.x=100, var.equal = TRUE, alternative = "greater", mu = 20000)

#Berdasarkan output yang dihasilkan, diperoleh bahwa:
#H0 dengan ??=20000 dan H1 dengan ??>20000

#c
#Dengan menggunakan rumus, didapatkan z = 8.97 dan P(Z > 8.97) = 1 - P(Z < 8.97).
#Hipotesis nol berlaku. Kesimpulannya adalah mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun.



#Soal3

#a
#H0:
z1=(3.64-0)/(1.67/sqrt(19))
#H1:
z2=(2.79-0)/(1.32/sqrt(27))

#b


#Soal4
#a
dataoneway <- read.table(url("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt"),h=T)
attach(dataoneway)
names(dataoneway)

dataoneway$Group <- as.factor(dataoneway$Group)
dataoneway$Group = factor(dataoneway$Group,labels = c("Kucing oren", "Kucing hitam", "Kucing putih"))

class(dataoneway$Group)

Group1 <- subset(dataoneway, Group == "Kucing oren")
Group2 <- subset(dataoneway, Group == "Kucing hitam")
Group3 <- subset(dataoneway, Group == "Kucing putih")

#b
bartlett.test(Length ~ Group, data = dataoneway)
#Kesimpulannya: Bartlett's K-squared = 0.43292, df = 2, dan p-value = 0.08054

#c
qqnorm(Group1$Length)
qqline(Group1$Length)

qqnorm(Group2$Length)
qqline(Group2$Length)

qqnorm(Group2$Length)
qqline(Group2$Length)

#d
pvalue = 0.8054
#H0 ditolak

#e
model1 = lm(Length ~ Group, data = dataoneway)
anova(model1)
TukeyHSD(aov(model1))

#f
install.packages("ggplot2")
library("ggplot2")

ggplot(dataoneway, aes(x = Group, y = Length)) + geom_boxplot(fill = "grey80", colour = "black") + scale_x_discrete() + xlab("Treatment Group") + ylab("Length (cm)")

#Soal5

