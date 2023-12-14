# We cannot measure the longitude and latitude, but we can estimate them. To do so, you need a
# model of the shape of the earth. Such a model is called a “datum”
# The most commonly used datum is called 'WGS84': World Geodesic System 1984
# The different types of planar coordinate reference systems are referred to as “projections”
# Examples are “Mercator”, “UTM”, “Robinson”, “Lambert”, “Sinusoidal” and “Albers”
# There is not one best projection. Some projections can be used for a map of the whole world;
# other projections are appropriate for small areas only
# Per ispezionare il sistema di riferimento di uno 'SpatVect'
crs(v)

# Sometimes we have data without a CRS. In that case we can assign the CRS if we know what it should be
# Per cambiare CRS creo un nuovo dataset a partire dal primo
new_v<-v  ## Copio lo 'SpatVector'
crs(new_v)<-""  ## Rimuovo il CRS
crs(new_v)<-"+proj=longlat +datum=WGS84"  ## Inserisco il CRS che voglio
# One should not use this approach to change the CRS of a data set from what it is to what you want it to be
# Assigning a CRS is like labeling something. You need to provide the label that corresponds to the item

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














