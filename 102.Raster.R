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
# dramatically increase processing time

# To create a raster data
r<-rast(ncol=10, nrow=10, xmin=-150, xmax=-80, ymin=20, ymax=60)
# In questo caso è vuoto; per assegnare valori
values(r)<-A  ## Posso prenderli da un dataset, da un file, etc.
# Oppure a partire da un file presente nella cartella di lavoro
r<-rast(nome_file) 

# You can write new files using the 'writeRaster' method
# You need to add argument 'overwrite=TRUE' if you want to overwrite an existing file
writeRaster(r, "nome_nuovo_file.tif)  ## 'r' è un 'SpatRaster'

#######################################################################################################
#######################################################################################################
##  BASIC EXAMPLE
#  Location (longitude and latitude) of 10 weather stations (A to J) and their annual precipitation.
name <- LETTERS[1:10]  ## Per fare un vettore di lettere da A a J
longitude <- c(-116.7, -120.4, -116.7, -113.5, -115.5,
               -120.8, -119.5, -113.7, -113.7, -110.7)
latitude <- c(45.3, 42.6, 38.9, 42.1, 35.7, 38.9,
              36.2, 39, 41.6, 36.9)
stations <- cbind(longitude, latitude)  ## Unisco i due vettori e formo un dataframe
# To simulate rainfall data
set.seed(0)  ## Per fare in modo che ad ogni run non vengano cambiati i numeri generati
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

