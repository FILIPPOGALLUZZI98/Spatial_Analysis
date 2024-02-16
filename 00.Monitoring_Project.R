library(terra)
library(imageRy)
library(viridis)
setwd("D:R_Studio/Immagini_Progetto_Monitoring")


# ??? Le immagini sono prese da sentinel-2a e sono le immagini di aprile per ogni anno dal 2018 al 2023


# Faccio dei cicli for per assegnare le variabili alle immagini scaricate
nomi_var <- c()
for (i in 18:23) {
  for (j in c(2, 3, 4, 8, 11, 12)) {
    nomi_var <- c(nomi_var, paste("S", i, "_", j, sep=""))}}
nomi_file <- c()
for (i in 18:23) {
  for (j in c(2, 3, 4, 8, 11, 12)) {
    nomi_file <- c(nomi_file, paste("S", i, "_", j,".tiff", sep=""))}}
for (i in 1:length(nomi_var)) {
  assign(nomi_var[i], rast(nomi_file[i]))}


# PLOT REAL COLOR IMAGES
S18<-c(S18_4,S18_3,S18_2,S18_8)
S19<-c(S19_4,S19_3,S19_2,S19_8)
S20<-c(S20_4,S20_3,S20_2,S20_8)
S21<-c(S21_4,S21_3,S21_2,S21_8)
S22<-c(S22_4,S22_3,S22_2,S22_8)
S23<-c(S23_4,S23_3,S23_2,S23_8)
par(mfrow=c(2,3))
plotRGB(S18, stretch="lin", main="April 2018")
plotRGB(S19, stretch="lin", main="April 2019")
plotRGB(S20, stretch="lin", main="April 2020")
plotRGB(S21, stretch="lin", main="April 2021")
plotRGB(S22, stretch="lin", main="April 2022")
plotRGB(S23, stretch="lin", main="April 2023")




## NDVI
ndvi18<-(S18_8-S18_4)/(S18_8+S18_4)
ndvi19<-(S19_8-S19_4)/(S19_8+S19_4)
ndvi20<-(S20_8-S20_4)/(S20_8+S20_4)
ndvi21<-(S21_8-S21_4)/(S21_8+S21_4)
ndvi22<-(S22_8-S22_4)/(S22_8+S22_4)
ndvi23<-(S23_8-S23_4)/(S23_8+S23_4)
dev.off(); par(mfrow=c(2,3))
plot(ndvi18, col=rev(terrain.colors(10)), main = "NDVI 2019", range=c(0,1))
plot(ndvi19, col=rev(terrain.colors(10)), main = "NDVI 2019", range=c(0,1))
plot(ndvi20, col=rev(terrain.colors(10)), main = "NDVI 2020", range=c(0,1))
plot(ndvi21, col=rev(terrain.colors(10)), main = "NDVI 2021", range=c(0,1))
plot(ndvi22, col=rev(terrain.colors(10)), main = "NDVI 2022", range=c(0,1))
plot(ndvi23, col=rev(terrain.colors(10)), main = "NDVI 2023", range=c(0,1))

## HISTOGRAMS
dev.off(); par(mfrow=c(2,3))
h18<-hist(ndvi18, main = "2018 NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(0, 1, 0.1), labels = seq(0, 1, 0.1))
h19<-hist(ndvi19, main = "2019 NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(0, 1, 0.1), labels = seq(0, 1, 0.1))
h20<-hist(ndvi20, main = "2020 NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(0, 1, 0.1), labels = seq(0, 1, 0.1))
h21<-hist(ndvi21, main = "2021 NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(0, 1, 0.1), labels = seq(0, 1, 0.1))
h22<-hist(ndvi22, main = "2022 NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(0, 1, 0.1), labels = seq(0, 1, 0.1))
h23<-hist(ndvi23, main = "2023 NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(0, 1, 0.1), labels = seq(0, 1, 0.1))

# VEGETATION
veg18 <- clamp(ndvi18, 0.4, values=FALSE) 
veg19 <- clamp(ndvi19, 0.4, values=FALSE) 
veg20 <- clamp(ndvi20, 0.4, values=FALSE) 
veg21 <- clamp(ndvi21, 0.4, values=FALSE) 
veg22 <- clamp(ndvi22, 0.4, values=FALSE) 
veg23 <- clamp(ndvi23, 0.4, values=FALSE) 
dev.off(); par(mfrow=c(2,3))
plot(veg18, main='Vegetation 2018')
plot(veg19, main='Vegetation 2019')
plot(veg20, main='Vegetation 2020')
plot(veg21, main='Vegetation 2021')
plot(veg22, main='Vegetation 2022')
plot(veg23, main='Vegetation 2023')

# VEGETATION OVERLAPS
dev.off(); par(mfrow=c(2,3))
plotRGB(S18, axes=TRUE, stretch="lin")
plot(veg18, add=TRUE, legend=FALSE)
plotRGB(S19, axes=TRUE, stretch="lin")
plot(veg19, add=TRUE, legend=FALSE)
plotRGB(S20, axes=TRUE, stretch="lin")
plot(veg20, add=TRUE, legend=FALSE)
plotRGB(S21, axes=TRUE, stretch="lin")
plot(veg21, add=TRUE, legend=FALSE)
plotRGB(S22, axes=TRUE, stretch="lin")
plot(veg22, add=TRUE, legend=FALSE)
plotRGB(S23, axes=TRUE, stretch="lin")
plot(veg23, add=TRUE, legend=FALSE)




