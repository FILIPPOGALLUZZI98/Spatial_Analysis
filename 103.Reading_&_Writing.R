# Nel caso di vector data
a<-vect(nome_file)
# You can write new files using the 'writeVector method'
# You need to add argument 'overwrite=TRUE' if you want to overwrite an existing file
XXX<-"nome_nuovo_file.shp"
writeVector(a, XXX)  ## 'a' è un 'SpatVector'


# Nel caso di raster data
a<-rast(nome_file)
# You can write new files using the 'writeRaster' method
# You need to add argument 'overwrite=TRUE' if you want to overwrite an existing file
a<-writeRaster(a, "nome_file.tif)  ## 'a' è un 'SpatRaster'









