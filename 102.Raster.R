# Un oggetto raster divide il mondo in una griglia di rettangoli (pixel) di uguale grandezza, ognuno dei quali
# ha uno o più valori delle variabili di interesse. Il valore può essere il valore medio o il valore al centro.
# A differenza dei vector data, la geometria non è esplicitamente salvata come coordinate, ma è implicitamente
# settata dalla conscenza dell'estensione spaziale ed il numero di righe/colonne in cui l'area è divisa

# Per conoscere le informazioni base
cell(r); res(r); col(r), row(r); ext(r)

# Create a raster data
# Le impostazioni di default creano una struttura raster globale senza un SRD lon/lat e gradi delle celle 1x1 
r<-rast()  ## Crea un raster con le impostazioni di default
r<-rast(ncol=n, nrow=m, xmin=XXX, xmax=XXX, ymin=YYY, ymax=YYY)
# Per cambiare i parametri (per esempio la risoluzione)
res(r)<-XXX
# Questo oggetto consiste soltanto nella geometria raster (righe e colonne), ma è vuoto
# Per inserire i valori usiamo 'values()'
values(r)<-valori
# Values are not lost when changing the extent as this change adjusts the resolution, but does not change the
# number of rows or columns
ext(r)<-XXX

# A partire da un file presente nella cartella di lavoro
r<-rast(nome_file) 

# You can write new files using the 'writeRaster' method
# You need to add argument 'overwrite=TRUE' if you want to overwrite an existing file
writeRaster(r, "nome_nuovo_file.tif)  ## 'r' è un 'SpatRaster'

######################################################################################################################
######################################################################################################################
## OPERAZIONI SUL RASTER 
# The 'crop' function lets you take a geographic subset of a larger raster object. 
# The 'merge' function lets you merge 2 or more SpatRaster objects into a single new object























