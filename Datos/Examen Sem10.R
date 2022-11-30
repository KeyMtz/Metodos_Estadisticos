#Keyla Martinez 
#Examen

library(readr)
Nematodos <- read_csv("C:/RepositorioKey/Metodos_Estadisticos/Datos/Nematodos.csv")
View(Nematodos)
Nematodos$Suelo <- as.factor(Nematodos$Suelo)

#¿Observamos diferencias en los valores promedios y de variabilidad por grupos?:Si existe diferencia. 

boxplot(Nematodos$Nematodos ~ Nematodos$Suelo,
        xlab = "Tipo de Suelo",
        ylab = "Numero de Nematodos",
        col = "Green")

#Aplicar funcion tapply
tapply(Nematodos$Nematodos, Nematodos$Suelo, mean)
tapply(Nematodos$Nematodos, Nematodos$Suelo, var)

#¿Cuantas veces es la diferencia entre la varianza mas pequeña y la mas grande?
#Varianza mayor de 571.7
#Varianza menor de 90.8
#lo cual existe una varianza de seis veces mayor. 

#¿Cuales serian las hipotesis nula y alternativa?
#H0 = Las varianzas son homogeneas.
#H1 = Las varianzas no son homogeneas.


bartlett.test(Nematodos$Nematodos, Nematodos$Suelo)

shapiro.test(Nematodos$Nematodos)
hist(Nematodos$Nematodos)

library(dplyr)

S1 <- Nematodos %>%
  filter(Suelo == "S1")
S2 <- Nematodos %>%
  filter(Suelo == "S2")
S3 <- Nematodos %>%
  filter(Suelo == "S3")
S4 <- Nematodos %>%
  filter(Suelo =="S4")
S5 <- Nematodos %>%
  filter(Suelo == "S5")

shapiro.test(S1$Nematodos)
shapiro.test(S2$Nematodos)
shapiro.test(S3$Nematodos)
shapiro.test(S4$Nematodos)
shapiro.test(S5$Nematodos)

par.aov <- aov(Nematodos$Nematodos ~ Nematodos$Suelo)
summary(par.aov)

#Test ANOVA
#Grados de libertad: 4
#Grados de libertad residuales: 20
#Valor de P: 0.5444

#Como la prueba de ANOVA (AOV) me dice que hay diferencias significativas, entonces procedo con la prueba de Tuckey, 
#la cual identificara donde estan las diferencias

TukeyHSD(par.aov)
plot(TukeyHSD(par.aov))



