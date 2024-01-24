## Misure della variability basata su Remote Sensing
library(imageRy)
library(terra)
library(viridis)

img<-im.import("sentinel.png")
# Dalle info dell'immagine  --> Band1=NIR; Band2=RED; Band3=GREEN
plotRGB(img,r=1,g=2,b=3)  ## Red is pasture and blue is bare soil (rocks)
plotRGB(img,r=2,g=1,b=3)  ## NIR in top of RED: The bare soil (rocks) is violet and green is pasture
nir<-img[[1]]
plot(nir)  ## Green parts are vegetations and orange is bare soil


# Moving Window --> To calculate the STD of a raster image
# Calcola la STD di una cella considerando le celle adiacenti e spostando la 
# "finestra" pixel dopo pixel --> 'focal()'
sd3<-focal(nir, matrix(1/9,3,3), fun=sd)  ##  'matrix' descrive la dimensione della moving window
                                          ##  in 1/9, il 9 rapresenta il numero di celle (3x3 in questo caso)
cl<-colorRampPalette(viridis(7))(255)  ## 255 perché sono i diversi valori possibili dei pixel
plot(sd3, col=cl)


# Plot 3x3 and 7x7 moving windows
cl<-colorRampPalette(viridis(7))(255) 
sd3<-focal(nir, matrix(1/9,3,3), fun=sd) 
sd7<-focal(nir, matrix(1/49,7,7), fun=sd)
par(mfrow=c(1,2))
plot(sd3, col=cl); plot(sd7, col=cl)
# In 7x7 si nota una maggiore variabilità perché abbiamo considerato una moving window più grande
# Original image plus the 7x7 sd
plotRGB(img,r=2,g=1,b=3)  ## NIR in top of RED
plot(sd7, col=cl)

# Come scegliere la banda con cui calcolare la variabilità?
# Usiamo la Multivariate Analysis







