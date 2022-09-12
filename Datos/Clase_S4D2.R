#Keyla Martinez 

Enc1 <- read.csv("Datos/Encuesta.csv", header = T)

Enc1$Entrev <- as.factor(Enc1$Entrev)
Enc1$oi_2a <- as.factor(Enc1$oi_2a)
Enc1$oi_4a <- as.factor(Enc1$oi_4a)
Enc1$Carrera <- as.factor(Enc1$Carrera)

