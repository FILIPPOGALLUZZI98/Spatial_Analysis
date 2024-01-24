## VARI ESEMPI DI IMMAGINI SCARICATE

###########################################################################################
###########################################################################################
##  Earth Observatory  -->  https://earthobservatory.nasa.gov/
library(terra)
setwd("D:R_Studio/Immagini_Prova_Monitoring")

img1<-rast("Naja_City_May_20_2003.jpg")
img2<-rast("Naja_City_Ago_07_2023.jpg")
img1
# Le immagini sono formate da 3 componenti, che corrispondono alle bande RGB

plotRGB(img1,r=1,g=2,b=3)
# Confronto immagini
par(mfrow=c(1,2))
plot(img1)
plot(img2)

# Differenza primo layer tra le due immagini (red component)
diff=img1[[1]] - img2[[1]]
cl<-colorRampPalette(c("brown","grey","orange"))(100)
plot(diff,col=cl)

###########################################################################################
###########################################################################################
##  Copernicus  -->  https://land.copernicus.vgt.vito.be/PDF/portal/Application.html
##  L'estensione dei dati è '.nc', quindi ho bisogno del pacchetto 'ncdf4'
library(terra)
library(ncdf4)
setwd("D:R_Studio/Immagini_Prova_Monitoring")

soil_moist<-rast("Soil_Moisture.nc")
plot(soil_moist)
# Ci sono due variabili, ssm (surface soil moisture) e ssm noise
cl<-colorRampPalette(c("red","orange","yellow"))(100)
plot(soil_moist[[1]], col=cl)

# Voglio vedere solo una parte dell'immagine
ext<-c(25.5,26,41,41)
soil_moist_crop<-crop(soil_moist[[1]],ext)
plot(soil_moist_crop,col=cl)

###########################################################################################
###########################################################################################
##  Sentinel  -->  https://dataspace.copernicus.eu/explore-data/data-collections/sentinel-data/sentinel-2
##  Il procedimento è lo stesso dei due precedenti, riporto solo qualche info su Sentinel

# Sentinel-2 provides high-resolution images in the visible and infrared wavelengths,
# to monitor vegetation, soil and water cover, inland waterways and coastal areas. 
# Spatial resolution: 10m, 20m, and 60m, depending on the wavelength

# Per vedere le diverse Bande con le relative risoluzioni spaziali
https://sentinels.copernicus.eu/web/sentinel/user-guides/sentinel-2-msi/resolutions/spatial

# S2A e S2B sono le due diverse costellazioni 'Sentinel' che operano rispettivamente
# dal 2015 e dal 2017
# Level 1C data are data of sufficient quality for most investigations, where all 
# image corrections were done except for the atmospheric correction. Data are available
# globally since June 2015 onwards.
# Level 2A data are high quality data where the effects of the atmosphere on the light 
# being reflected off of the surface of the Earth and reaching the sensor are excluded. 
# Data are available globally since March 2017.

# Le immagini hanno diverse Band Compositions, per esempio:
# False color, False color urban composite, NDMI, SWIR, NWIR, NDSI, ognuna delle quali ha un
# particolare vantaggio per varie caratteristiche della superficie (vegetazione, neve, ...)

###########################################################################################
###########################################################################################
##  Altre immagini possono essere scaricate da 
##  Landsat (30m) and MODIS (>500m) data (NASA)  -->  https://www.youtube.com/watch?v=JN-P04Dkx48


