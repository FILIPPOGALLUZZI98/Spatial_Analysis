# NORMALIZED VEGETATION INDEX
# The DVI is computed as the difference between NIR and Red reflectance
# The NDVI is computed as DVI divided by the sum of the two bands
library(imageRy)
library(terra)

#################################################################################################################
#################################################################################################################
# Lavoriamo con i dati 'matogrosso' contenuti in 'imageRy'

# Importo l'immagine del 1992
m1992<-im.import("matogrosso_l5_1992219_lrg.jpg")
m1992  ## Possiamo vedere le 3 bande: 1-->NIR; 2-->Red; 3-->Green
plotRGB(m1992,1,2,3) ## NIR on top of red
plotRGB(m1992,2,1,3) ## NIR on top of green
plotRGB(m1992,2,3,1) ## NIR on top of blue

# Importo ora l'immagine del 2006
m2006<-im.import("matogrosso_ast_2006209_lrg.jpg")
# Mostro le due immagini (1996 e 2006 una accanto all'altra)
par(mfrow=c(1,2))
im.plotRGB(m1992, 1, 2, 3)
im.plotRGB(m2006, 1, 2, 3)

# Calcoliamo il DVI (Difference Vegetation Index)
cl <-colorRampPalette(c("darkblue", "yellow", "red", "black"))(100) 
par(mfrow=c(1,2))
plot(m1992[[1]]) ## questa è la prima banda --> NIR
plot(m1992[[2]]) ## questa è la seconda banda --> RED
dvi1992 = m1992[[1]] - m1992[[2]]
# faccio lo stesso per l'immagine del 2006
dvi2006 = m2006[[1]] - m2006[[2]]
par(mfrow=c(1,2))
plot(dvi1992, col=cl)
plot(dvi2006, col=cl)

# NDVI --> (NIR-RED)/(NIR+RED)
ndvi1992 = (m1992[[1]] - m1992[[2]]) / (m1992[[1]] + m1992[[2]])
ndvi2006 = (m2006[[1]] - m2006[[2]]) / (m2006[[1]] + m2006[[2]])
dev.off()
par(mfrow=c(1,2))
plot(ndvi1992, col=cl)
plot(ndvi2006, col=cl)

#################################################################################################################
#################################################################################################################
##  Lavoriamo ora sui file, sempre contenuti in 'imageRy', di Sentinel
b4<-im.import("sentinel.dolomites.b4.tif")  ## RED band
b5<-im.import("sentinel.dolomites.b8.tif")  ## NIR BAND

ndvi<-(b5 - b4) / (b5 + b4)
plot(ndvi, col=rev(terrain.colors(10)), main = "NDVI")

# HISTOGRAM
# We can explore the distribution of values contained within our raster using hist to produces a histogram.
# Histograms are often useful in identifying outliers and bad data values in our raster data. 
hist(ndvi, main = "NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(-0.5, 1),  breaks = 30, xaxt = "n") 
axis(side=1, at = seq(-0.6, 1, 0.2), labels = seq(-0.6, 1, 0.2))

# Cells with NDVI values greater than 0.4 are definitely vegetation. The following operation masks all
# cells that are perhaps not vegetation (NDVI < 0.4). 
veg <- clamp(ndvi, 0.4, values=FALSE) 
plot(veg, main='Vegetation')
# Let’s map the area that corresponds to the peak between 0.25 and 0.3 in the NDVI histogram. 
m <- c(-Inf, 0.25, NA,  0.25, 0.3, 1,  0.3, Inf, NA) 
rcl <- matrix(m, ncol = 3, byrow = TRUE) 
land <- classify(ndvi, rcl) 
plot(land)

# Se vogliamo sovrapporlo all'immagine
plotRGB(s, r=1, g=2, b=3, axes=TRUE, stretch="lin")
plot(land, add=TRUE, legend=FALSE)

# You can also create classes for different intensity of vegetation. 
m <- c(-1,0.25, 0.3, 0.4, 0.5, 1) 
vegc <- classify(ndvi, m) 
plot(vegc, col = rev(terrain.colors(4)), main = 'NDVI based thresholding')















