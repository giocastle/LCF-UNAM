#--------------------------------------------------------------------------
# Creacion:          18-11-2020
# Autor:             Julio C.
# Contacto:          jcms2665@gmail.com
# Objetivo:          An�lisis de Componentes Principales
# Datos:             calificacion.csv
# Ubicaci�n:             
#--------------------------------------------------------------------------

#               CONTENIDO

#     0. Entorno de trabajo
#     1. Cargar base
#         1.1 Opci�n 1
#         1.2 Opci�n 2
#     2. Normalizaci�n
#     3. Ajuste del modelo
#         3.1 Gr�fico de sedimentaci�n 
#         3.2 Componentes principales
#     4. Correlaci�n: CP vs Datos originales

#--------------------------------------------------------------------------


#0.  Entorno de trabajo

rm(list=ls())     
graphics.off()    

library(foreign)
library(factoextra)
library(readr)
library(knitr)
library(corrplot)

#1. Cargar base

#1.1 Opci�n 1
alumnos<-read_csv("https://raw.githubusercontent.com/jcms2665/LCF-UNAM/main/20112020-PCA/horario.csv")

#1.2 Opci�n 2
alumnos<-read.csv("D:/OneDrive - El Colegio de M�xico A.C/5. Proyectos/2020/18. LCF/2 Noviembre/Github/20112020-PCA/horario.csv", sep=",",header = TRUE)

View(alumnos)
apply(alumnos, 2, min)%>%round(2)
apply(alumnos, 2, max)%>%round(2)

cor(alumnos)%>%round(2)


#2. Normalizaci�n
norm01 <- function(x){(x-min(x))/(max(x)-min(x))}
alumnos_norm<-data.frame(apply(alumnos,2,norm01))
apply(alumnos_norm, 2, min)%>%round(2)
apply(alumnos_norm, 2, mean)%>%round(2)
apply(alumnos_norm, 2, max)%>%round(2)


#3. Ajuste del modelo
acp<-prcomp(alumnos_norm)
acp

#3.1 Gr�fico de sedimentaci�n (Varianza)
screeplot(acp,type="lines")


#3.2 Componentes principales (los 2 primeros)
cp<-data.frame(acp$x)
cp<-cp[,1:2]


#4. Correlaci�n: Constructos vs Datos originales
cor(alumnos_norm, cp,use = "everything",method = c("pearson"))







