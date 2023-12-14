## VECTOR
# To extract the attributes (data.frame) from a SpatVector 'v'
data<-as.data.frame(v)  ## 'd' è il dataframe

# You can extract or add a variable as you would do with a dataframe
v$nome_var
v$new_var<-nuova_variabile

# You can assign an attributes table (data.frame) to a SpatVector with values '<-'
# To add attributes to a 'SpatVector' that already has attributes use 'merge' (or 'cbind' 
# if you know the order of the records is the same)

# Voglio sovrapporre un riquadro a partire dal vettore 'v'
r<-rast(v)  ## Creo un raster vuoto a partire da 'v'
dim(r)<-c(n,m)  ## Stabilisco le dimensioni (pixel) del raster
values(r)<-valori_r  ## Inserisco i valori del raster (a partire da alto-sx verso dx)

### ??? CONTINUARE ??? ### "https://rspatial.org/spatial/7-vectmanip.html"

##############################################################################################
##############################################################################################
## RASTER



















