# Da qui in avanti il pacchetto 'terra' è implicito
library(terra)
# A map is a plot of geospatial data that also has labels and other graphical objects such 
# as a scale bar or legend. The spatial data itself should not be referred to as a map.

#################################################################################################
#################################################################################################
##  VECTOR
# The main vector data types are points, lines and polygons. In all cases,
# the geometry of these data structures consists of sets of coordinate pairs (x, y).
# A polygon refers to a set of closed polylines

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
##  RASTER
# A raster divides the world into a grid of equally sized rectangles (cells or pixels)
# that all have one or more values for the variables of interest. A raster cell value
# should normally represent the average value for the area it covers. However, in some
# cases the values are actually estimates for the center of the cell
# In contrast to vector data, in raster data the geometry is not explicitly stored as
# coordinates. It is implicitly set by knowing the spatial extent and the number or rows
# and columns in which the area is divided. From the extent and number of rows and columns,
# the size of the raster cells can be computed. While raster cells can be thought of as a
# set of regular polygons, it would be very inefficient to represent the data that way as 
# coordinates for each cell would have to be stored explicitly. Doing so would also
# dramatically increase processing time.

# A 'SpatRaster' represents multi-variable raster data
r<-rast(ncol=10, nrow=10, xmin=-150, xmax=-80, ymin=20, ymax=60)
# In questo caso è vuoto; per assegnare valori
values(r)<-A  ## Posso prenderli da un dataset, da un file, etc.













