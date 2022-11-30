#Examen Final 
#Keyla Martinez 
#30/11/2022

library(readr)

#Ejercicio 1 

Suelos <- read.csv("C:/RepositorioKey/Metodos_Estadisticos/Datos/Suelos.csv")

boxplot(Suelos$Nematodos ~ Suelos$Suelo,
        xlab = "Tipo de Suelo",
        ylab = "Numero de Nematodos",
        col = "Purple")

#Aplicar funcion Tapply
tapply(Suelos$Nematodos, Suelos$Suelo, mean)
tapply(Suelos$Nematodos, Suelos$Suelo, var)

#¿Cuantas veces es la diferencia entre la varianza mas pequeña y la mas grande?
#Varianza mayor de 571.7
#Varianza menor de 90.8
#lo cual existe una varianza de seis veces mayor. 

#¿Cuales serian las hipotesis nula y alternativa?
#H0 = Las varianzas son homogeneas.
#H1 = Las varianzas no son homogeneas.


bartlett.test(Suelos$Nematodos, Suelos$Suelo)

shapiro.test(Suelos$Nematodos)
hist(Suelos$Nematodos)

par.aov <- aov(Suelos$Nematodos ~ Suelos$Suelo)
summary(par.aov)

TukeyHSD(par.aov)
plot(TukeyHSD(par.aov))

#Ejercicio 2 

Riegos <- read.csv("C:/RepositorioKey/Metodos_Estadisticos/Datos/Riegos.csv")

boxplot(Riegos$Crecimiento ~ Riegos$Riego,
        xlab = "Tipo de riego",
        ylab = "Crecimiento (cm)",
        col = "Green")

tapply(Riegos$Crecimiento, Riegos$Riego, mean)
tapply(Riegos$Crecimiento, Riegos$Riego, var)


#¿Cuantas veces es la diferencia entre la varianza mas pequeña y la mas grande?
#Varianza mayor de 33.60
#Varianza menor de 4
#lo cual existe una varianza de 8 veces mayor.


bartlett.test(Riegos$Crecimiento, Riegos$Riego)

shapiro.test(Riegos$Crecimiento)
hist(Riegos$Crecimiento)

par.aov <- aov(Riegos$Crecimiento ~ Riegos$Riego)
summary(par.aov)

TukeyHSD(par.aov)
plot(TukeyHSD(par.aov))




