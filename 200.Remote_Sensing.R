##  INTRODUZIONE

# Most remote sensing products consist of observations of reflectance data. That is, they are measures 
# of the intensity of the sun’s radiation that is reflected by the earth. Reflectance is normally measured 
# for different wavelengths of the electromagnetic spectrum. For example, it can be measured in the near-infrared,
# red, green, and blue wavelengths. If that is the case, satellite data can be referred to as “multi-spectral”
# The data are normally stored as raster data, and are generally referred to as “images”.

# A panchromatic image consists of only one band. It is usually displayed as a grey scale image, i.e. the displayed
# brightness of a particular pixel is proportional to the pixel digital number which is related to the intensity of
# solar radiation reflected by the targets in the pixel and detected by the detector. Thus, a panchromatic image may
# be similarly interpreted as a black-and-white aerial photograph of the area. The Radiometric Information is the main
# information type utilized in the interpretation.

# A multispectral image consists of several bands of data. For visual display, each band of the image may be displayed
# one band at a time as a grey scale image, or in combination of three bands at a time as a colour composite image. 
# Interpretation of a multispectral colour composite image will require the knowledge of the spectral reflectance signature
# of the targets in the scene. In this case, the spectral information content of the image is utilized in the interpretation.

# If a multispectral image consists of the three visual primary colour bands (red, green, blue), the three bands may be
# combined to produce a "true colour" image. For example, the bands 3 (red band), 2 (green band) and 1 (blue band) of a
# LANDSAT TM image or an IKONOS multispectral image can be assigned respectively to the R, G, and B colours for display. 
# In this way, the colours of the resulting colour composite image resemble closely what would be observed by the human eyes.
# The display colour assignment for any band of a multispectral image can be done in an entirely arbitrary manner. In this case,
# the colour of a target in the displayed image does not have any resemblance to its actual colour. The resulting product is 
# known as a false colour composite image. There are many possible schemes of producing false colour composite images. However,
# some scheme may be more suitable for detecting certain objects in the image.

# A very common false colour composite scheme for displaying a SPOT multispectral image is shown below:
# R=NIR; G=RED; B=GREEN
# This false colour composite scheme allows vegetation to be detected readily in the image. In this type of false colour 
# composite images, vegetation appears in different shades of red depending on the types and conditions of the vegetation,
# since it has a high reflectance in the NIR band
# Clear water appears dark-bluish (higher green band reflectance), while turbid water appears cyan (higher red reflectance 
# due to sediments) compared to clear water. Bare soils, roads and buildings may appear in various shades of blue, yellow or
# grey, depending on their composition.

# Another common false colour composite scheme for displaying an optical image with a short-wave infrared (SWIR) band is shown below:
# R=SWIR; G=NIR; B=RED
# In this display scheme, vegetation appears in shades of green. Bare soils and clearcut areas appear purplish or magenta. 
# The patch of bright red area on the left is the location of active fires. A smoke plume originating from the active fire site
# appears faint bluish in colour.

######################################################################################################################################
######################################################################################################################################
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






















