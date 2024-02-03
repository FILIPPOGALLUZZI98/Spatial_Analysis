# Point pattern analysis (PPA) is the study of point patterns, the spatial arrangements of points in space 
# Nel seguente esempio si usa un dataset dei reati in una città
if (!require("rspat")) remotes::install_github("rspatial/rspat")
library(rspat)

city <- spat_data("city")
crime <- spat_data("crime")
plot(city, col="light blue")
points(crime, col="red", cex=.5, pch="+")

# Creiamo una tabella i cui ordiniamo l'incidenza dei reati per tipo
tb <- sort(table(crime$CATEGORY))[-1]
tb

# Con la funzione 'crds' possiamo estrarre le coordinate dei punti
xyd <- crds(crime)
xy <- unique(xyd)  ## In questo modo eliminiamo le coordinate duplicate
dim(xyd)-dim(xy)  ## Numero di coordinate duplicate

# Calcoliamo ora il mean center e la distanza standard per i reati
# Usiamo la funzione 'apply' che applica una funzione (in questo caso 'mean') ad un vettore, array o matrice
# In questo caso, dato che xy è una matrice, il 2 indica che viene applicata alle colonne
mc <- apply(xy,2,mean)
# La distanza standard si calcola come la deviazione standard
sd <- sqrt(sum((xy[,1] - mc[1])^2 + (xy[,2] - mc[2])^2) / nrow(xy))
# Mostriamo i risultati
plot(city, col="light blue")
points(crime, cex=.5)
points(cbind(mc[1], mc[2]), pch="*", col="red", cex=5)




# RASTER
CityArea <- expanse(city)  ## Calcola la superficie dello SpatVector
dens <- nrow(xy) / CityArea

# Creo un raster con dimensioni della città e risoluzione arbitraria = 1000
r <- rast(city, res=1000)
r <- rasterize(city, r)  ## Trovare le celle che fanno parte della città nel raster

# Se voglio fare il confronto della città reale con il raster:
par(mfrow=c(1,2))
plot(r); plot(city)  ## Si nota che il raster è un'approssimazione

# Voglio mostrare i punti dei reati nel raster
plot(r)
quads <- as.polygons(r)
plot(quads, add=TRUE)
points(crime, col='red', cex=.5)

# Il numero di eventi in ogni quadrante può essere contato usando la 'rasterize' function
nc <- rasterize(crime, r, fun=function(i){length(i)}, background=0)
plot(nc)
plot(city, add=TRUE)
# 'nc' contiene il numero di reati
# Siccome vogliamo considerare soltanto i conteggi interni all'area della città, dobbiamo eliminare gli altri
ncrimes <- mask(nc, r)
plot(ncrimes)
plot(city, add=TRUE)


# Calcoliamo ora le frequenze
f <- freq(ncrimes)
head(f)
plot(f, pch=20)




## DISTANZA
# Siccome stiamo usando coordinate planari, possiamo usare la funzione 'dist' per calcolare le distanze
d <- dist(xy)
dm <- as.matrix(d)  ;  diag(dm) <- NA  ## Imposto i valori sulla diagonale banalmente come 'NA'
dm[1:5, 1:5]  ## Voglio vedere le prime 5 righe e colonne

# Per avere per ogni punto la minima distanza da un altro evento uso la funzione 'apply'
dmin <- apply(dm, 1, min, na.rm=TRUE)
mdmin <- mean(dmin)  ## Mean nearest neighbour distance
wdmin <- apply(dm, 1, which.min)  ## Per conoscere quel punto è il più vicino ad uno assegnato
















