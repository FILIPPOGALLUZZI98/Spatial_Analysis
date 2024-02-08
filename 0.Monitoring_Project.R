library(terra)
library(imageRy)
setwd("D:R_Studio/Immagini_Progetto_Monitoring")

# FARE CICLO FOR ??
S17_0<-rast("S17_0.tiff"); S17_2<-rast("S17_2.tiff"); S17_3<-rast("S17_3.tiff"); S17_4<-rast("S17_4.tiff")
S17_8<-rast("S17_8.tiff"); S17_11<-rast("S17_11.tiff"); S17_12<-rast("S17_12.tiff"); S20_0<-rast("S20_0.tiff")
S20_2<-rast("S20_2.tiff"); S20_3<-rast("S20_3.tiff"); S20_4<-rast("S20_4.tiff"); S20_8<-rast("S20_8.tiff")
S20_11<-rast("S20_11.tiff"); S20_12<-rast("S20_12.tiff"); S24_0<-rast("S24_0.tiff"); S24_2<-rast("S24_2.tiff")
S24_3<-rast("S24_3.tiff"); S24_4<-rast("S24_4.tiff"); S24_8<-rast("S24_8.tiff"); S24_11<-rast("S24_11.tiff")
S24_12<-rast("S24_12.tiff")






# PLOT OF REAL COLOR IMAGES
par(mfrow=c(2,2))
plotRGB(S17_0, stretch="lin", main="Gen 2017")
plotRGB(S20_0, stretch="lin", main="Gen 2020")
plotRGB(S24_0, stretch="lin", main="Feb 2024")
dev.off()





## NDVI
ndvi17<-(S17_8-S17_4)/(S17_8+S17_4)
ndvi20<-(S20_8-S20_4)/(S20_8+S20_4)
ndvi24<-(S24_8-S24_4)/(S24_8+S24_4)
par(mfrow=c(2,2))
plot(ndvi17, col=rev(terrain.colors(10)), main = "NDVI 2017", range=c(0.4,1))
plot(ndvi20, col=rev(terrain.colors(10)), main = "NDVI 2020", range=c(0.4,1))
plot(ndvi24, col=rev(terrain.colors(10)), main = "NDVI 2024", range=c(0.4,1))
dev.off()

# HISTOGRAMS
par(mfrow=c(3,1))
h17<-hist(ndvi17, main = "2017 NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 30, xaxt = "n") 
axis(side=1, at = seq(0, 1, 0.1), labels = seq(0, 1, 0.1))
h20<-hist(ndvi20, main = "2020 NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 30, xaxt = "n") 
axis(side=1, at = seq(0, 1, 0.1), labels = seq(0, 1, 0.1))
h24<-hist(ndvi24, main = "2024 NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 30, xaxt = "n") 
axis(side=1, at = seq(0, 1, 0.1), labels = seq(0, 1, 0.1))

# VEGETATION
veg17 <- clamp(ndvi17, 0.4, values=FALSE) 
veg20 <- clamp(ndvi20, 0.4, values=FALSE) 
veg24 <- clamp(ndvi24, 0.4, values=FALSE) 
par(mfrow=c(2,2))
plot(veg17, main='Vegetation 2017')
plot(veg20, main='Vegetation 2020')
plot(veg24, main='Vegetation 2024')

# VEGETATION OVERLAPS
plotRGB(S17_0, axes=TRUE, stretch="lin")
plot(veg17, add=TRUE, legend=FALSE)
plotRGB(S20_0, axes=TRUE, stretch="lin")
plot(veg20, add=TRUE, legend=FALSE)
plotRGB(S24_0, axes=TRUE, stretch="lin")
plot(veg24, add=TRUE, legend=FALSE)

# You can also create classes for different intensity of vegetation. 
m <- c(-1,0.25, 0.3, 0.4, 0.5, 1) 
par(mfrow=c(2,2))
vegc17 <- classify(ndvi17, m) 
plot(vegc17, col = rev(terrain.colors(5)), main = 'NDVI based thresholding 2017')
vegc20 <- classify(ndvi20, m) 
plot(vegc20, col = rev(terrain.colors(5)), main = 'NDVI based thresholding 2020')
vegc24 <- classify(ndvi24, m) 
plot(vegc24, col = rev(terrain.colors(5)), main = 'NDVI based thresholding 2024')








