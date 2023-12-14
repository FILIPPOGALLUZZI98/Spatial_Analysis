# Tipi di dati vettoriali sono: punti, linee, poligoni: la geometria consiste in insiemi di
# coppie di coordinate (x,y)

# Per conoscere le informazioni di base
class(v); 

# Create a 'SpatVector' a partire da un file presente nella cartella di lavoro
v<-vect(nome_file) 
lines<-vect(nome_file, type="lines", crs=crdref)
polig<-vect(nome_file, type="polygons", crs=crdref)

# Per scrivere nuovi file usiamo 'writeVector'
# You need to add argument 'overwrite=TRUE' if you want to overwrite an existing file
writeVector(v, "nome_nuovo_file.shp")  ## 'v' è un 'SpatVector'

## CONTINUARE ------> "https://rspatial.org/spatial/7-vectmanip.html"













