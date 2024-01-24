# Usiamo i dati contenuti nella libreria 'imageRy'
library(terra)
library(imageRy)

# Posso quindi creare uno SpatRaster a partire da questi
# Se non sto usando imageRy allora devo usare la funzione 'rast', per esempio:
b <- rast('data/rs/LC08_044034_20170614_B4.tif')

# In questo caso (solo per imageRy):
im.list()  ## Per vedere la lista dei dati contenuti in imageRy
b2<-im.import("sentinel.dolomites.b2.tif")
b3<-im.import("sentinel.dolomites.b3.tif")
b4<-im.import("sentinel.dolomites.b4.tif")
b5<-im.import("sentinel.dolomites.b8.tif")

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

# Se vogliamo creare una multi-band image
stack<-c(b2, b3, b4, b8)  ## Creo un array con le varie componenti 
plot(stack)
plot(stacksent[[4]])  ## Per plottare una componente (NIR in questo caso)


# We do not gain that much information from these grey-scale plots; they are often combined into
# a “composite” to create more interesting plots.
# With plotRGB we can combine them into a single composite image. Note that use of strecth = "lin" 
# (otherwise the image will be pitch-dark)
# Per plottare i primi tre layers in componenti RGB
plotRGB(stack, r = 1, g = 2, b = 3)
plotRGB(stack,stretch="lin")  ## Senza specificare le varie bande

# Come visto nel file precendente, per avere info aggiuntive posso spostare le varie bande, per esempio:
plotRGB(stacksent,r=3,g=2,b=4)  ## Metto il NIR nella componente blu: ciò che riflette NIR diventa blu
plotRGB(stacksent,r=4,g=2,b=1)  ## Metto il NIR nella componente rossa: ciò che riflette NIR diventa rosso

# Per capire quale delle componenti porta più informazioni:
pairs(stack)  ## Serve per misurare la correlazione tra più variabili
# Nella traccia ci sono le varie bande
# Nei grafici fuori dalla traccia ci sono i coefficienti di pearson e le correlazioni tra le diverse bande
# Le prime tre bande(quelle visibili) sono molto correlate
# Una bassa correlazione significa che il NIR porta ulteriori informazioni,
# mentre le altre portano la stessa quantità di informazioni









