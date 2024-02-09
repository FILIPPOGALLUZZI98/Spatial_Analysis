library(terra)
library(imageRy)
library(viridis)
setwd("D:R_Studio/Immagini_Progetto_Monitoring")
S17_2<-rast("S17_2.tiff"); S17_3<-rast("S17_3.tiff"); S17_4<-rast("S17_4.tiff"); S17_8<-rast("S17_8.tiff");
S17_11<-rast("S17_11.tiff"); S17_12<-rast("S17_12.tiff"); S20_2<-rast("S20_2.tiff"); S20_3<-rast("S20_3.tiff")
S20_4<-rast("S20_4.tiff"); S20_8<-rast("S20_8.tiff"); S20_11<-rast("S20_11.tiff"); S20_12<-rast("S20_12.tiff")
S23_2<-rast("S23_2.tiff"); S23_3<-rast("S23_3.tiff"); S23_4<-rast("S23_4.tiff"); S23_8<-rast("S23_8.tiff")
S23_11<-rast("S23_11.tiff"); S23_12<-rast("S23_12.tiff")




# PLOT OF REAL COLOR IMAGES
S17<-c(S17_4,S17_3,S17_2,S17_8)
S20<-c(S20_4,S20_3,S20_2,S20_8)
S23<-c(S23_4,S23_3,S23_2,S23_8)
par(mfrow=c(2,2))
plotRGB(S17, stretch="lin", main="May 2017")
plotRGB(S20, stretch="lin", main="May 2020")
plotRGB(S23, stretch="lin", main="May 2024")
dev.off()
pairs(S17); pairs(S20); pairs(S23)




## NDVI
ndvi17<-(S17_8-S17_4)/(S17_8+S17_4)
ndvi20<-(S20_8-S20_4)/(S20_8+S20_4)
ndvi23<-(S23_8-S23_4)/(S23_8+S23_4)
dev.off(); par(mfrow=c(2,2))
plot(ndvi17, col=rev(terrain.colors(10)), main = "NDVI 2017", range=c(0,1))
plot(ndvi20, col=rev(terrain.colors(10)), main = "NDVI 2020", range=c(0,1))
plot(ndvi23, col=rev(terrain.colors(10)), main = "NDVI 2023", range=c(0,1))

# HISTOGRAMS
dev.off(); par(mfrow=c(3,1))
h17<-hist(ndvi17, main = "2017 NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(0, 1, 0.1), labels = seq(0, 1, 0.1))
h20<-hist(ndvi20, main = "2020 NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(0, 1, 0.1), labels = seq(0, 1, 0.1))
h23<-hist(ndvi23, main = "2023 NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(0, 1, 0.1), labels = seq(0, 1, 0.1))

# VEGETATION
veg17 <- clamp(ndvi17, 0.4, values=FALSE) 
veg20 <- clamp(ndvi20, 0.4, values=FALSE) 
veg23 <- clamp(ndvi23, 0.4, values=FALSE) 
dev.off(); par(mfrow=c(2,2))
plot(veg17, main='Vegetation 2017')
plot(veg20, main='Vegetation 2020')
plot(veg23, main='Vegetation 2023')

# VEGETATION OVERLAPS
dev.off(); par(mfrow=c(2,2))
plotRGB(S17, axes=TRUE, stretch="lin")
plot(veg17, add=TRUE, legend=FALSE)
plotRGB(S20, axes=TRUE, stretch="lin")
plot(veg20, add=TRUE, legend=FALSE)
plotRGB(S23, axes=TRUE, stretch="lin")
plot(veg23, add=TRUE, legend=FALSE)

# You can also create classes for different intensity of vegetation. 
m <- c(-1,0.25, 0.3, 0.4, 0.5, 1) 
par(mfrow=c(2,2))
vegc17 <- classify(ndvi17, m) 
plot(vegc17, col = rev(terrain.colors(5)), main = 'NDVI based thresholding 2017')
vegc20 <- classify(ndvi20, m) 
plot(vegc20, col = rev(terrain.colors(5)), main = 'NDVI based thresholding 2020')
vegc23 <- classify(ndvi23, m) 
plot(vegc23, col = rev(terrain.colors(5)), main = 'NDVI based thresholding 2023')




## TIME SERIES ON NDVI
stack<-c(ndvi17,ndvi20,ndvi23)
cl<-rev(terrain.colors(10))
plot(stack,col=cl)
diff=stack[[1]]-stack[[3]]
cl2<-colorRampPalette(c("blue","white","red"))(100)
plot(diff,col=cl2)
## plotRGB(stack,r=1,g=2,b=3) 



## NDMI 
ndmi17<-(S17_8-S17_11)/(S17_8+S17_11)
ndmi20<-(S20_8-S20_11)/(S20_8+S20_11)
ndmi23<-(S23_8-S23_11)/(S23_8+S23_11)
dev.off(); par(mfrow=c(2,2))
plot(ndmi17, col=rev(topo.colors(5)), main = "NDMI 2017", range=c(0,1))
plot(ndmi20, col=rev(topo.colors(5)), main = "NDMI 2020", range=c(0,1))
plot(ndmi23, col=rev(topo.colors(5)), main = "NDMI 2023", range=c(0,1))
dev.off(); par(mfrow=c(3,1))
h17<-hist(ndmi17, main = "2017 NDMI values", xlab = "NDMI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(0, 1, 0.1), labels = seq(0, 1, 0.1))
h20<-hist(ndmi20, main = "2020 NDMI values", xlab = "NDMI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(0, 1, 0.1), labels = seq(0, 1, 0.1))
h23<-hist(ndmi23, main = "2023 NDMI values", xlab = "NDMI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(0, 1, 0.1), labels = seq(0, 1, 0.1))
# You can also create classes for different intensity of moisture
m <- c(-1,0.25, 0.3, 0.4, 0.5, 1) 
par(mfrow=c(2,2))
moist17 <- classify(ndmi17, m) 
plot(moist17, col = rev(topo.colors(5)), main = 'NDMI based thresholding 2017')
moist20 <- classify(ndmi20, m) 
plot(moist20, col = rev(topo.colors(5)), main = 'NDMI based thresholding 2020')
moist23 <- classify(ndmi23, m) 
plot(moist23, col = rev(topo.colors(5)), main = 'NDMI based thresholding 2023')




## VARIABILITY
S17_sd3<-focal(S17_8, matrix(1/9,3,3), fun=sd)
S20_sd3<-focal(S20_8, matrix(1/9,3,3), fun=sd)
S23_sd3<-focal(S23_8, matrix(1/9,3,3), fun=sd)
par(mfrow=c(2,2))
cl<-colorRampPalette(viridis(7))(100)
plot(S17_sd3, col=cl)
plot(S20_sd3, col=cl)
plot(S23_sd3, col=cl)




## PCA
S17pc<-im.pca2(S17) 
S17_pc1<-S17pc$PC1
S20pc<-im.pca2(S20) 
S20_pc1<-S20pc$PC1
S23pc<-im.pca2(S23) 
S23_pc1<-S23pc$PC1

par(mfrow=c(2,2))
plot(S17_pc1,col=cl, range=c(-0.3,0.6))
plot(S20_pc1,col=cl, range=c(-0.3,0.6))
plot(S23_pc1,col=cl, range=c(-0.3,0.6))

dev.off()
S17_pc1sd3<-focal(S17_pc1, matrix(1/9, 3, 3), fun=sd)
S20_pc1sd3<-focal(S20_pc1, matrix(1/9, 3, 3), fun=sd)
S23_pc1sd3<-focal(S23_pc1, matrix(1/9, 3, 3), fun=sd)
par(mfrow=c(2,2))
plot(S23_pc1sd3, col=cl, range=c(0,0.02))
plot(S17_pc1sd3, col=cl, range=c(0,0.02))
plot(S20_pc1sd3, col=cl, range=c(0,0.02))















