#Keyla Martinez 
# Semana9 - 5/10/2022
#ANOVA
#Analisis de Varianza

library(repmis)
paraje <- source_data("https://www.dropbox.com/s/fbrwxypacjgeayj/Datos_Rascon_Anova.csv?dl=1")

tapply(paraje$DAP, paraje$Paraje, mean)
tapply(paraje$DAP, paraje$Paraje, sd)
tapply(paraje$DAP, paraje$Paraje, median)
tapply(paraje$DAP, paraje$Paraje, var)
tapply(paraje$DAP, paraje$Paraje, length)

boxplot(paraje$DAP ~ paraje$Paraje, 
        xlab = "Paraje", 
        ylab = "DAP¨(cm)",
        col="purple")


# Semana 10 Dia 1 10/10/2022
#Homogeneidad de varianza barlett.test

bartlett.test(paraje$DAP, paraje$Paraje)

#Ho = las varianzas son homogeneas 
#H1 = las varianzas no son homogeneas 

#Normalidad de la variable DAP 
shapiro.test(paraje$DAP)
hist(paraje$DAP)

library(dplyr)

Chinatu <- paraje %>%
  filter(Paraje == "Chinatu")
Trinidad <- paraje %>%
  filter(Paraje == "Trinidad")
Laguna <- paraje %>%
  filter(Paraje == "Laguna")
Tule <- paraje %>%
  filter(Paraje == "Tule")

shapiro.test(chinatu$DAP)
shapiro.test(Trinidad$DAP)
shapiro.test(Laguna$DAP)
shapiro.test(Tule$DAP)

par.aov <- aov(paraje$DAP ~ paraje$Paraje)
summary(par.aov)

#Como la prueba de ANOVA (AOV) me dice que hay diferencias significativas, entonces procedo con la prueba de Tuckey, 
#la cual identificara donde estan las diferencias

TukeyHSD(par.aov)

plot(TukeyHSD(par.aov))


