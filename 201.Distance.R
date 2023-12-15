# Distances are often described in a “distance matrix”. In a distance matrix we have a number for 
# the distance between all objects of interest
# 'dist' function to make a distance matrix with a data set of any dimension
# Per esempio, supponiamo di avere una serie di punti nello spazio 'pts'
dits(pts)  ## Restituisce una matrice triangolare inferiore, dove gli elementi sono le distanze
  ## tra le coppie di punti

# If the coordinates were in degrees, then the distances would be wrong
# In that case we can use the 'pointDistance' function from the 'raster' package
gdis <- distance(pts, lonlat=TRUE)


# Adjacency is an important concept in some spatial analysis
# We define points as “ajacent” if they are within a distance of n from each other. Given that
#  we have the distance matrix D this is easy to do
a<- D<n  ## Otteniamo una matrice con elementi TRUE/FALSE
diag(a)<- NA  ## Necessario altrimenti la diagonale viene 1
# TRUE/FALSE values are commonly stored as 1/0 and we can make this change multiplying with 1
Adj<- a*1


