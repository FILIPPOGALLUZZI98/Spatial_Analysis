# Il pacchetto 'terra' è implicito in tutti i codici--> https://cran.r-project.org/web/packages/terra/index.html
library(terra)
# Methods for spatial data analysis with vector (points, lines, polygons) and raster (grid) data


####################################################################################################
####################################################################################################
## VECTORS

# Tipi di dati vettoriali sono: punti, linee, poligoni: la geometria consiste in insiemi di
# coppie di coordinate (x,y)

# Per conoscere le informazioni di base
class(v); 

# Per creare unp 'SpatVector' devo partire da una matrice o da due vettori che poi unisco
lon<-c(-116.7, -120.4, -116.7, -113.5, -115.5, -120.8, -119.5, -113.7, -113.7, -110.7)
lat<-c(45.3, 42.6, 38.9, 42.1, 35.7, 38.9, 36.2, 39, 41.6, 36.9)
lonlat <- cbind(lon, lat)
v<-vect(lonlat)

# Create a 'SpatVector' a partire da un file presente nella cartella di lavoro
v<-vect(nome_file) 
lines<-vect(nome_file, type="lines", crs=crdref)
polig<-vect(nome_file, type="polygons", crs=crdref)

# Per scrivere nuovi file usiamo 'writeVector'
# You need to add argument 'overwrite=TRUE' if you want to overwrite an existing file
writeVector(v, "nome_nuovo_file.shp")  ## 'v' è un 'SpatVector'

# To extract the attributes (data.frame) from a SpatVector
d<-as.data.frame(v)

## OPERAZIONI SU UN VETTORE
# Per sovrapporre all'immagine vettoriale un riquadro
z<-rast(v)  ## Creo un raster a partire da 'v' in modo che siano salvate le coordinate
dim(z)<-c(2,2)  ## Imposto 4 pixel, che ricorpiranno tutta la grandezza del riquadro
values(z)<-1:4  ## Assegno 4 valori possibili, quindi i pixel avranno colori diversi
names(z)<-'Zone'  ## Assegno il nome dei 4 riquadri (pixel) al posto dei valori numerici (1-4)
z<-as.polygons(z)  ## Trasformo il raster in un vector (4 rettangoli)
plot(v)  ## Grafico della mia immagine vettoriale (punti, linee, poligoni)
plot(z, add=TRUE, border='blue', lwd=5)  ## Aggiungo il riquadro con i bordi blu e di spessore '5'
# Se voglio colorare un riquadro di rosso
z2 <- z[2,]
plot(z2, add=TRUE, border='red', lwd=2, col='red')

# Erase a part of a SpatVector
erese_v<-erase(v,z2)
plot(erese_v)

#Intersect SpatVectors
i<-intersect(v, z2)

# Crop SpatVector
extent<-ext(6, 6.4, 49.7, 50)
pe<-crop(v, e)
plot(v)
plot(extent, add=TRUE, lwd=3, col="red")
plot(pe, col='light blue', add=TRUE)
plot(extent, add=TRUE, lwd=3, border="blue")
plot(i)

# It is common to aggregate (“dissolve”) polygons that have the same value for an attribute of interest
pa<-aggregate(v, by='variabile')
za<-aggregate(z)
plot(za, col='light gray', border='light gray', lwd=5)
plot(pa, add=TRUE, col=rainbow(3), lwd=3, border='white')


####################################################################################################
####################################################################################################
##  RASTER

# Un oggetto raster divide il mondo in una griglia di rettangoli (pixel) di uguale grandezza, ognuno dei quali
# ha uno o più valori delle variabili di interesse. Il valore può essere il valore medio o il valore al centro.
# A differenza dei vector data, la geometria non è esplicitamente salvata come coordinate, ma è implicitamente
# settata dalla conscenza dell'estensione spaziale ed il numero di righe/colonne in cui l'area è divisa

# Per conoscere le informazioni base
cell(r); res(r); col(r), row(r); ext(r)

# Create a raster data
# Le impostazioni di default creano una struttura raster globale senza un SRD lon/lat e gradi delle celle 1x1 
r<-rast()  ## Crea un raster con le impostazioni di default
r<-rast(ncol=n, nrow=m, xmin=XXX, xmax=XXX, ymin=YYY, ymax=YYY)
# Per cambiare i parametri (per esempio la risoluzione)
res(r)<-XXX
# Questo oggetto consiste soltanto nella geometria raster (righe e colonne), ma è vuoto
# Per inserire i valori usiamo 'values()'
values(r)<-valori
# Values are not lost when changing the extent as this change adjusts the resolution, but does not change the
# number of rows or columns
ext(r)<-XXX

# A partire da un file presente nella cartella di lavoro
r<-rast(nome_file) 

# You can write new files using the 'writeRaster' method
# You need to add argument 'overwrite=TRUE' if you want to overwrite an existing file
writeRaster(r, "nome_nuovo_file.tif)  ## 'r' è un 'SpatRaster'

## OPERAZIONI SUL RASTER 
# To add features on a SpatRaster 
plot(v, add=TRUE)
# The 'crop' function lets you take a geographic subset of a larger raster object. 
# The 'merge' function lets you merge 2 or more SpatRaster objects into a single new object


####################################################################################################
####################################################################################################
## CRS VECTOR

# We cannot measure the longitude and latitude, but we can estimate them. To do so, you need a
# model of the shape of the earth. Such a model is called a “datum”
# The most commonly used datum is called 'WGS84': World Geodesic System 1984
# The different types of planar coordinate reference systems are referred to as “projections”
# Examples are “Mercator”, “UTM”, “Robinson”, “Lambert”, “Sinusoidal” and “Albers”
# There is not one best projection. Some projections can be used for a map of the whole world;
# other projections are appropriate for small areas only
# Per ispezionare il sistema di riferimento di uno 'SpatVect'
crs(v)

# Per fornire un sistema di riferimento
crdref<-"+proj=longlat +datum=WGS84"  ## Selezioniamo il datum, in quest caso 'WGS84'
v<- vect(nome_file, crs=crdref)  ## Specifichiamo il sistema di riferimento nel vettore
crs(v)  ## Get or set the coordinate reference system of a SpatRaster or SpatVector.
# Per unire 'SpatVector' e dataframe (con stesso numero di righe)
new_v<- vect(nome_file, atts=dataframe, crs=crdref)

# Sometimes we have data without a CRS. In that case we can assign the CRS if we know what it should be
# Per cambiare CRS creo un nuovo dataset a partire dal primo
new_v<-v  ## Copio lo 'SpatVector'
crs(new_v)<-""  ## Rimuovo il CRS
crs(new_v)<-"+proj=longlat +datum=WGS84"  ## Inserisco il CRS che voglio
# One should not use this approach to change the CRS of a data set from what it is to what you want it to be
# Assigning a CRS is like labeling something. You need to provide the label that corresponds to the item


####################################################################################################
####################################################################################################
## CRS RASTER

# Vector data can be transformed from lon/lat coordinates to planar and back without loss of precision. This is
# not the case with raster data
# We can transform these data to a new data set with another CRS using the project method
# Per esempio, da 'longlat' a 'robinson projection'
newcrs <- "+proj=robin +datum=WGS84"
robinson<-terra::project(v, newcrs)
# After the transformation, the units of the geometry are no longer in degrees, but in meters away from (lon=0,lat=0)
# Because projection of rasters affects the cell values, in most cases you will want to avoid projecting raster data 
# and rather project vector data. Usiamo 'newcrs', ovvero la proiezione di Robinson
new_r<-terra::project(r, newcrs)





































