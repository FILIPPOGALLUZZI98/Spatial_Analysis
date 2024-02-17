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
par(mfrow=c(2,3))
plot(ndvi18, col=rev(terrain.colors(10)), main = "NDVI 2019", range=c(0,1))
plot(ndvi19, col=rev(terrain.colors(10)), main = "NDVI 2019", range=c(0,1))
plot(ndvi20, col=rev(terrain.colors(10)), main = "NDVI 2020", range=c(0,1))
plot(ndvi21, col=rev(terrain.colors(10)), main = "NDVI 2021", range=c(0,1))
plot(ndvi22, col=rev(terrain.colors(10)), main = "NDVI 2022", range=c(0,1))
plot(ndvi23, col=rev(terrain.colors(10)), main = "NDVI 2023", range=c(0,1))

## HISTOGRAMS
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

# VEGETATION
veg18 <- clamp(ndvi18, 0.4, values=FALSE) 
veg19 <- clamp(ndvi19, 0.4, values=FALSE) 
veg20 <- clamp(ndvi20, 0.4, values=FALSE) 
veg21 <- clamp(ndvi21, 0.4, values=FALSE) 
veg22 <- clamp(ndvi22, 0.4, values=FALSE) 
veg23 <- clamp(ndvi23, 0.4, values=FALSE) 
# VEGETATION OVERLAPS
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

# ??? VEGETATION CLASSIFICATION 
m <- c(-1,0.5, 0.7, 0.8, 0.9, 1) 
par(mfrow=c(2,3))
vegc18 <- classify(veg18, m) 
plot(vegc18, col = rev(terrain.colors(5)), main = 'Vegetation based thresholding 2018')
vegc19 <- classify(veg19, m) 
plot(vegc19, col = rev(terrain.colors(5)), main = 'Vegetation based thresholding 2019')
vegc20 <- classify(veg20, m) 
plot(vegc20, col = rev(terrain.colors(5)), main = 'Vegetationbased thresholding 2020')
vegc21 <- classify(veg21, m) 
plot(vegc21, col = rev(terrain.colors(5)), main = 'Vegetationbased thresholding 2021')
vegc22 <- classify(veg22, m) 
plot(vegc22, col = rev(terrain.colors(5)), main = 'Vegetationbased thresholding 2022')
vegc23 <- classify(veg23, m) 
plot(vegc23, col = rev(terrain.colors(5)), main = 'Vegetationbased thresholding 2023')









## TIME SERIES ON NDVI
stack<-c(ndvi18,ndvi19,ndvi20,ndvi21,ndvi22,ndvi23)
cl<-rev(terrain.colors(10))
plot(stack,col=cl)
diff1=stack[[1]]-stack[[2]]
diff2=stack[[1]]-stack[[3]]
diff3=stack[[1]]-stack[[4]]
diff4=stack[[1]]-stack[[5]]
diff5=stack[[1]]-stack[[6]]
cl2<-colorRampPalette(c("blue","white","red"))(100)
par(mfrow=c(2,3))
plot(diff1,col=cl2)
plot(diff2,col=cl2)
plot(diff3,col=cl2)
plot(diff4,col=cl2)
plot(diff5,col=cl2)

## plotRGB(stack,r=1,g=2,b=3) 



## NDMI
ndmi18<-(S18_8-S18_11)/(S18_8+S18_11)
ndmi19<-(S19_8-S19_11)/(S19_8+S19_11)
ndmi20<-(S20_8-S20_11)/(S20_8+S20_11)
ndmi21<-(S21_8-S21_11)/(S21_8+S21_11)
ndmi22<-(S22_8-S22_11)/(S22_8+S22_11)
ndmi23<-(S23_8-S23_11)/(S23_8+S23_11)
par(mfrow=c(2,3))
plot(ndmi18, col=rev(topo.colors(5)), main = "NDMI 2018", range=c(0,1))
plot(ndmi19, col=rev(topo.colors(5)), main = "NDMI 2019", range=c(0,1))
plot(ndmi20, col=rev(topo.colors(5)), main = "NDMI 2020", range=c(0,1))
plot(ndmi21, col=rev(topo.colors(5)), main = "NDMI 2021", range=c(0,1))
plot(ndmi22, col=rev(topo.colors(5)), main = "NDMI 2022", range=c(0,1))
plot(ndmi23, col=rev(topo.colors(5)), main = "NDMI 2023", range=c(0,1))

## HISTOGRAMS
par(mfrow=c(2,3))
h18<-hist(ndmi18, main = "2018 NDMI values", xlab = "NDMI", ylab= "Frequency", 
     col = "wheat", xlim = c(-1, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(-1, 1, 0.1), labels = seq(-1, 1, 0.1))
h19<-hist(ndmi19, main = "2019 NDMI values", xlab = "NDMI", ylab= "Frequency", 
     col = "wheat", xlim = c(-1, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(-1, 1, 0.1), labels = seq(-1, 1, 0.1))
h20<-hist(ndmi20, main = "2020 NDMI values", xlab = "NDMI", ylab= "Frequency", 
     col = "wheat", xlim = c(-1, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(-1, 1, 0.1), labels = seq(-1, 1, 0.1))
h21<-hist(ndmi21, main = "2021 NDMI values", xlab = "NDMI", ylab= "Frequency", 
     col = "wheat", xlim = c(-1, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(-1, 1, 0.1), labels = seq(-1, 1, 0.1))
h22<-hist(ndmi22, main = "2022 NDMI values", xlab = "NDMI", ylab= "Frequency", 
     col = "wheat", xlim = c(-1, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(-1, 1, 0.1), labels = seq(-1, 1, 0.1))
h23<-hist(ndmi23, main = "2023 NDMI values", xlab = "NDMI", ylab= "Frequency", 
     col = "wheat", xlim = c(-1, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(-1, 1, 0.1), labels = seq(-1, 1, 0.1))

## MOISTURE
moist18 <- clamp(ndmi18, 0.4, values=FALSE) 
moist19 <- clamp(ndmi19, 0.4, values=FALSE) 
moist20 <- clamp(ndmi20, 0.4, values=FALSE) 
moist21 <- clamp(ndmi21, 0.4, values=FALSE) 
moist22 <- clamp(ndmi22, 0.4, values=FALSE) 
moist23 <- clamp(ndmi23, 0.4, values=FALSE) 
par(mfrow=c(2,3))
# MOISTURE OVERLAPS
par(mfrow=c(2,3))
plotRGB(S18, axes=TRUE, stretch="lin")
plot(moist18, col=rev(topo.colors(5)), add=TRUE, legend=TRUE)
plotRGB(S19, axes=TRUE, stretch="lin")
plot(moist19, col=rev(topo.colors(5)), add=TRUE, legend=TRUE)
plotRGB(S20, axes=TRUE, stretch="lin")
plot(moist20, col=rev(topo.colors(5)), add=TRUE, legend=TRUE)
plotRGB(S21, axes=TRUE, stretch="lin")
plot(moist21, col=rev(topo.colors(5)), add=TRUE, legend=TRUE)
plotRGB(S22, axes=TRUE, stretch="lin")
plot(moist22, col=rev(topo.colors(5)), add=TRUE, legend=TRUE)
plotRGB(S23, axes=TRUE, stretch="lin")
plot(moist23, col=rev(topo.colors(5)), add=TRUE, legend=TRUE)







