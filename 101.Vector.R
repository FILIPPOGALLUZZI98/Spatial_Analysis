# Tipi di dati vettoriali sono: punti, linee, poligoni: la geometria consiste in insiemi di
# coppie di coordinate (x,y)

# Per conoscere le informazioni di base
class(v); 

# Create a 'SpatVector'
points<-vect(data)
lines<-vect(data, type="lines", crs=crdref)
polig<-vect(data, type="polygons", crs=crdref)

# A partire da un file presente nella cartella di lavoro
v<-vect(nome_file) 
# Per scrivere nuovi file usiamo 'writeVector'
# You need to add argument 'overwrite=TRUE' if you want to overwrite an existing file
writeVector(v, "nome_nuovo_file.shp")  ## 'v' è un 'SpatVector'

## CONTINUARE ------> "https://rspatial.org/spatial/7-vectmanip.html"













