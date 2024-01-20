# Usiamo i dati contenuti nella libreria 'imageRy'
library(terra)
library(imageRy)

# Posso quindi creare uno SpatRaster a partire da questi
# Se non sto usando imageRy allora devo usare la funzione 'rast'
# b <- rast('data/rs/LC08_044034_20170614_B4.tif')

# In questo caso (solo in questo caso):
im.list()  ## Per vedere la lista dei dati contenuti in imageRy
b2<-im.import("sentinel.dolomites.b2.tif")
b3<-im.import("sentinel.dolomites.b3.tif")
b4<-im.import("sentinel.dolomites.b4.tif")
b5<-im.import("sentinel.dolomites.b8.tif")

# Se vogliamo creare una multi-band image
s<-c(b2,b3,b4)

# Se vogliamo mostrare i grafici individuali dell'immagine multi-spettrale
par(mfrow = c(2,2))
plot(b2, main = "Blue", col = gray(0:100 / 100))
plot(b3, main = "Green", col = gray(0:100 / 100))
plot(b4, main = "Red", col = gray(0:100 / 100))
plot(b5, main = "NIR", col = gray(0:100 / 100))
# In questo modo si è messo il range dei colori tra 0 e 1, in modo che siano standardizzate
# Notice the difference in shading and range of legends between the different bands. This is 
# because different surface features reflect the incident solar radiation differently. Each layer
# represent how much incident solar radiation is reflected for a particular wavelength range.

# We do not gain that much information from these grey-scale plots; they are often combined into
# a “composite” to create more interesting plots
# With plotRGB we can combine them into a single composite image. Note that use of strecth = "lin" 
# (otherwise the image will be pitch-dark)
plotRGB(s,stretch="lin")

# A scatterplot matrix can be helpful in exploring relationships between raster layers. This can 
# be done with the pairs function.
pairs(s)
# Vediamo che il NIR offre informazioni aggiuntive
s2<-c(b2,b3,b4,b5)
pairs(s2)









