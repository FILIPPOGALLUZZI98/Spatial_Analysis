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

####################################################################################################
####################################################################################################
## OPERAZIONI SU UN VETTORE
## CONTINUARE ------> "https://rspatial.org/spatial/7-vectmanip.html"

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
plot(extent, add=TRUE, lwd=3, border="blue")plot(i)

# It is common to aggregate (“dissolve”) polygons that have the same value for an attribute of interest
pa<-aggregate(v, by='variabile')
za<-aggregate(z)
plot(za, col='light gray', border='light gray', lwd=5)
plot(pa, add=TRUE, col=rainbow(3), lwd=3, border='white')




