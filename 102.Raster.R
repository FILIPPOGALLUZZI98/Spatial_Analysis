##  RASTER
# A raster divides the world into a grid of equally sized rectangles (cells or pixels) that all have one or
# more values for the variables of interest. A raster cell value should normally represent the average value
# for the area it covers. However, in some cases the values are actually estimates for the center of the cell
# In contrast to vector data, in raster data the geometry is not explicitly stored as coordinates. It is
# implicitly set by knowing the spatial extent and the number or rows and columns in which the area is divided
# From the extent and number of rows and columns, the size of the raster cells can be computed. While raster cells
# can be thought of as a set of regular polygons, it would be very inefficient to represent the data that way as 
# coordinates for each cell would have to be stored explicitly. Doing so would also dramatically increase processing time

# To create a raster data






r<-rast(ncol=10, nrow=10, xmin=-150, xmax=-80, ymin=20, ymax=60)
# In questo caso è vuoto; per assegnare valori
values(r)<-A  ## Posso prenderli da un dataset, da un file, etc.
# Oppure a partire da un file presente nella cartella di lavoro
r<-rast(nome_file) 

# You can write new files using the 'writeRaster' method
# You need to add argument 'overwrite=TRUE' if you want to overwrite an existing file
writeRaster(r, "nome_nuovo_file.tif)  ## 'r' è un 'SpatRaster'


