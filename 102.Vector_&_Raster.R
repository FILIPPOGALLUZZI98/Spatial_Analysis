## VECTOR
# 'terra' introduces a number of classes with names that start with 'Spat'. For vector data, 
# the relevant class is 'SpatVector'. These classes represent geometries as well as attributes
# (variables) describing the geometries

# To create a 'SpatVector' (punti)
points<-vect(data)  ## Dove 'data' è un vettore, una lista, una matrice o un file
# Per fornire un sistema di riferimento
crdref<-"+proj=longlat +datum=WGS84"  ## Selezioniamo il datum, in quest caso 'WGS84'
points<- vect(data, crs=crdref)  ## Specifichiamo il sistema di riferimento nel vettore
crs(points)  ## Get or set the coordinate reference system of a SpatRaster or SpatVector.
# Per unire 'SpatVector' e dataframe (con stesso numero di righe)
new_points<- vect(data, atts=dataframe, crs=crdref)

# Per fare delle linee o poligoni
lines<-vect(data, type="lines", crs=crdref)
polig<-vect(data, type="polygons", crs=crdref)

#################################################################################################
#################################################################################################
## RASTER
# A 'SpatRaster' represents multi-variable raster data
r<-rast(ncol=10, nrow=10, xmin=-150, xmax=-80, ymin=20, ymax=60)
# In questo caso è vuoto; per assegnare valori
values(r)<-A  ## Posso prenderli da un dataset, da un file, etc.













