#Keyla Martinez
#21/09/2022

library(dplyr)

Seg.opcion <-Enc1 %>%
  filter(oi_2 == "NO")
Prim.op <- Enc1 %>%
  filter(oi_2 == "SI")
fix(Enc1)

#remober objetos rm()
rm(oi2.no)
rm(F)

barplot(round(gen/length(Enc1$Genero)*100,1),
        ylim = c(0,100),
        col= "purple" ,
        xlab= "Genero" ,
        ylab= "Porcentaje")
