##  VECTOR
# Da qui in avanti il pacchetto 'terra' è implicito
library(terra)
# A map is a plot of geospatial data that also has labels and other graphical objects such 
# as a scale bar or legend. The spatial data itself should not be referred to as a map.
# 'terra' introduces a number of classes with names that start with 'Spat'


# The main vector data types are points, lines and polygons. The geometry of these data structures 
# consists of sets of coordinate pairs (x, y)
# To create a 'SpatVector' (punti)
points<-vect(data)  ## Dove 'data' è un vettore, una lista, una matrice
# Oppure a partire da un file presente nella cartella di lavoro
v<-vect(nome_file) 

# Per fornire un sistema di riferimento
crdref<-"+proj=longlat +datum=WGS84"  ## Selezioniamo il datum, in quest caso 'WGS84'
v<- vect(nome_file, crs=crdref)  ## Specifichiamo il sistema di riferimento nel vettore
crs(v)  ## Get or set the coordinate reference system of a SpatRaster or SpatVector.
# Per unire 'SpatVector' e dataframe (con stesso numero di righe)
new_v<- vect(nome_file, atts=dataframe, crs=crdref)

# Per fare delle linee o poligoni
lines<-vect(nome_file, type="lines", crs=crdref)
polig<-vect(nome_file, type="polygons", crs=crdref)

# You can write new files using the 'writeVector method'
# You need to add argument 'overwrite=TRUE' if you want to overwrite an existing file
writeVector(v, "nome_nuovo_file.shp")  ## 'v' è un 'SpatVector'













