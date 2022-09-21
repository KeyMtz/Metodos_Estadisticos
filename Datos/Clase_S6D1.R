# Keyla Martinez

Enc1 <- read.csv("Datos/Encuesta.csv", header = T)

#Estuviste inscrito en otra facultad
of <-table(Enc1$oi_4)
prop.table(of)*100

#Que te parece la convivencia 