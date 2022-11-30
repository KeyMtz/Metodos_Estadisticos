#Keyla Martinez
#Examen
#26/10/2022

library(dplyr)

data(InsectSprays)
head(InsectSprays)

#Ejercicio 1 
# 1. ¿Cuántos tipos de insecticida tiene el exprimento? = 6 Tipos (A,B,C,D,E,F).
# 2. ¿Cuántas observaciones tiene cada tipo de insecticida? = 12 observaciones cada tipo. 
# 3. ¿Cuántos datos (n) tiene el experimento? = 72 en total. 

boxplot(InsectSprays$count ~ InsectSprays$spray,
        xlab ="Tipo de Insecticida",
        ylab = "Conteo",
        col = "Purple")


#Ejercicio 2
# 4. ¿Qué sugiere la gráfica sobre la relación entre el conteo de insectos y el insecticida usado? = Que dependiendo del tipo de insecticida es el efecto que causan y el conteo se refiere al numero de insectos muertos encontrados. 
# 5. ¿Crees que hay diferencias entre los sprays? Si es así,
# 6. ¿Dónde crees que están las diferencias? = Entre el spray F y C
# 7. ¿Cuáles insecticidas presentan outliers? = El insecticida C y D 
# 8. ¿Cuál insecticida parece ser el más efectivo? = El Insecticida F

# Aplique la función tapply para determinar lo siguiente

tapply(InsectSprays$count, InsectSprays$spray, mean)
# 9. ¿Cuál es las media de cada insecticida?  
# A         B         C         D         E         F 
#14.500000 15.333333  2.083333  4.916667  3.500000 16.666667

# 10. ¿Cuál es la varianza de cada insectida?
tapply(InsectSprays$count, InsectSprays$spray, var)
#A         B         C         D         E         F 
#22.272727 18.242424  3.901515  6.265152  3.000000 38.606061

# 11. ¿Cuál insecticida presenta mayor variación? = El insecticida F con una variacion de 38.60
# 12. ¿Cuál insecticida presenta menor variación? = El insecticida E con una variacion de 3.00

 #Realiza una prueba de ANOVA para comparar las medias de los insecticidas.
bartlett.test(InsectSprays$count, InsectSprays$spray)
shapiro.test(InsectSprays$count)

par.aov <- aov(InsectSprays$count ~ InsectSprays$spray)
summary(par.aov)

# 13. Establezca la hipótesis nula y alternativa
#Ho:No existe variacion en los tipos de insecticidas.
#H1:Existe variacion en los tipos de insecticidas.

# 14. ¿Cuántos grados de libertad tiene el tratamiento? = 5 
# 15. ¿Cuántos grados de libertad tiene el error o residual? = 66
# 16. ¿Cuántos son los grados de libertad totales? = 71 
# 17. ¿Cuál es la suma de cuadrados del tratamiento? = 2669
# 18. ¿Cuál es el Valor de F? = 34.7
# 19. ¿Cuál es el valor de la probabilidad de F? = <2e-16
# 20. Existen diferencias significativas entre los insecticidas,= SI, si es así
# 21. ¿Qué prueba estadística aplicamos para detectar las diferencias significativas? = La prueba de Tukey 

#Ejercicio 3

TukeyHSD(par.aov)
plot(TukeyHSD(par.aov))

# 22. ¿Cuántas comparaciones arroja la comparación del análisis de varianza? = 15 comparaciones
# 23. Subraya las comparaciones y su valor de p donde si existen diferencias significativas 
# 24. Encierra las comparaciones donde no existen diferencias significativas y su valor de p
# 25. ¿Cuál insecticida presenta la mejor efectividad? = El insecticida F