# Da qui in avanti il pacchetto 'terra' è implicito
library(terra)
# A map is a plot of geospatial data that also has labels and other graphical objects such 
# as a scale bar or legend. The spatial data itself should not be referred to as a map.

##  VECTOR
# Descrizione della geometria/forma dell'oggetto
# The main vector data types are points, lines and polygons. In all cases,
# the geometry of these data structures consists of sets of coordinate pairs (x, y).
# A polygon refers to a set of closed polylines

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


##  BASIC EXAMPLE
#  Location (longitude and latitude) of 10 weather stations (A to J) and their annual precipitation.
name <- LETTERS[1:10]  ## Per fare un vettore di lettere da A a J
longitude <- c(-116.7, -120.4, -116.7, -113.5, -115.5,
               -120.8, -119.5, -113.7, -113.7, -110.7)
latitude <- c(45.3, 42.6, 38.9, 42.1, 35.7, 38.9,
              36.2, 39, 41.6, 36.9)
stations <- cbind(longitude, latitude)  ## Unisco i due vettori e formo un dataframe
# To simulate rainfall data
set.seed(0)  ## ??
# Vettore di lunghezza 10 (latitude points) contenente numeri random (0-1000) arrotondati
precip <- round((runif(length(latitude))*10)^3)  
# Plot that shows the location of the weather stations, and the size of the dots is proportional
# to the amount of precipitation
psize <- 1 + precip/500  ## In questo modo ottengo un vettore con la grandezza dei punti
plot(stations, cex=psize, pch=20, col='red', main='Precipitation')  ## Imposto cex=psize
# Add names to plot
text(stations, name, pos=4)
# add a legend
leg <- c(100, 250, 500, 1000)
legend.psize <- 1+leg/500
legend("topright", legend=leg, pch=20, pt.cex=legend.psize, col='red', bg='gray')



