library(terra)
library(imageRy)
library(viridis)
setwd("D:R_Studio/Immagini_Progetto_Monitoring")

## Commenta immagini,mesi, come ho fatto il ciclo for
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

# Commento immagini colori reali (come ho fatto)
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
par(mfrow=c(2,3))
plot(ndvi18, col=rev(terrain.colors(10)), main = "NDVI 2019", range=c(0,1))
plot(ndvi19, col=rev(terrain.colors(10)), main = "NDVI 2019", range=c(0,1))
plot(ndvi20, col=rev(terrain.colors(10)), main = "NDVI 2020", range=c(0,1))
plot(ndvi21, col=rev(terrain.colors(10)), main = "NDVI 2021", range=c(0,1))
plot(ndvi22, col=rev(terrain.colors(10)), main = "NDVI 2022", range=c(0,1))
plot(ndvi23, col=rev(terrain.colors(10)), main = "NDVI 2023", range=c(0,1))

par(mfrow=c(2,3))
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

# TREND OF NDVI
par(mfrow=c(2,3))
h_1<-hist(ndvi18, main = "2018 NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 2, xaxt = "n") 
axis(side=1, at = seq(0, 1, 1), labels = seq(0, 1, 1))
h_2<-hist(ndvi19, main = "2019 NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 2, xaxt = "n") 
axis(side=1, at = seq(0, 1, 1), labels = seq(0, 1, 1))
h_3<-hist(ndvi20, main = "2020 NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 2, xaxt = "n") 
axis(side=1, at = seq(0, 1, 1), labels = seq(0, 1, 1))
h_4<-hist(ndvi21, main = "2021 NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 2, xaxt = "n") 
axis(side=1, at = seq(0, 1, 1), labels = seq(0, 1, 1))
h_5<-hist(ndvi22, main = "2022 NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 2, xaxt = "n") 
axis(side=1, at = seq(0, 1, 1), labels = seq(0, 1, 1))
h_6<-hist(ndvi23, main = "2023 NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 2, xaxt = "n") 
axis(side=1, at = seq(0, 1, 1), labels = seq(0, 1, 1))

# VEGETATION
veg18 <- clamp(ndvi18, 0.4, values=FALSE) 
veg19 <- clamp(ndvi19, 0.4, values=FALSE) 
veg20 <- clamp(ndvi20, 0.4, values=FALSE) 
veg21 <- clamp(ndvi21, 0.4, values=FALSE) 
veg22 <- clamp(ndvi22, 0.4, values=FALSE) 
veg23 <- clamp(ndvi23, 0.4, values=FALSE) 
# VEGETATION OVERLAPS
# Tutto quello che non è vegetazione è bianco, cioè è fuori scala:
par(mfrow=c(2,3))
plotRGB(S18, axes=TRUE, stretch="lin")
plot(veg18, add=TRUE, legend=TRUE)
plotRGB(S19, axes=TRUE, stretch="lin")
plot(veg19, add=TRUE, legend=TRUE)
plotRGB(S20, axes=TRUE, stretch="lin")
plot(veg20, add=TRUE, legend=TRUE)
plotRGB(S21, axes=TRUE, stretch="lin")
plot(veg21, add=TRUE, legend=TRUE)
plotRGB(S22, axes=TRUE, stretch="lin")
plot(veg22, add=TRUE, legend=TRUE)
plotRGB(S23, axes=TRUE, stretch="lin")  
plot(veg23, add=TRUE, legend=TRUE)

m <- c(0, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9)
cl<-colorRampPalette(c("white","darkgoldenrod1","darkkhaki","darkolivegreen1","darkolivegreen3","darkgreen"))(6)
cl2<-colorRampPalette(c("white","darkgoldenrod1","darkkhaki","darkolivegreen1","darkolivegreen3"))(5)
par(mfrow=c(2,3))
vegc18 <- classify(veg18, m) 
plot(vegc18, col = cl, main = 'Vegetation 2018')
vegc19 <- classify(veg19, m) 
plot(vegc19, col = cl, main = 'Vegetation 2019')
vegc20 <- classify(veg20, m) 
plot(vegc20, col = cl, main = 'Vegetation 2020')
vegc21 <- classify(veg21, m) 
plot(vegc21, col = cl2, main = 'Vegetation 2021')
vegc22 <- classify(veg22, m) 
plot(vegc22, col = cl, main = 'Vegetation 2022')
vegc23 <- classify(veg23, m) 
plot(vegc23, col = cl, main = 'Vegetation 2023')












































