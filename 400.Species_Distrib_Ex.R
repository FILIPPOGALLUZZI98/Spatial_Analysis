# This document is based on an analysis of the distribution of wild potato species 
# The data we will use is available in the rspatial package
if (!require("rspat")) remotes::install_github('rspatial/rspat')
suppressPackageStartupMessages({
  library(rspat)
  library(terra)
})


# PREPARARE I DATI
# Estraiamo i dati (hanno come estenzione '.csv')
f <- system.file("wildpot.csv", package="rspat")
basename(f)  ;  v <- read.csv(f)
# The coordinates in v are expressed in degrees, minutes, seconds, in separate columns. We need to compute
# longitude and latitude as single decimal numbers
for (i in c('LongD', 'LongM', 'LongS', 'LatD', 'LatM', 'LatS')) {
    v[, i] <- as.numeric(v[,i])}
# Con questo abbiamo espresso i dati contenuti nelle colonne indicate in valori numerici
v$lon <- -1 * (v$LongD + v$LongM / 60 + v$LongS / 3600)  ## I dati della longitudine sono la somma
v$lat <- v$LatD + v$LatM / 60 + v$LatS / 3600  ## Lo stesso per la latitudine
# Ora mettiamo nei dati dell'emifero sud il segno negativo
v$lat[v$LatH == 'S'] <- -1 * v$lat[v$LatH == 'S']




# Plottiamo il Centro-Sud America e creiamo uno SPatVector con i dati delle patate
cn <- spat_data("pt_countries") 
sp <- vect(v, crs="+proj=longlat +datum=WGS84")
plot(cn, xlim=c(-120, -40), ylim=c(-40,40), axes=TRUE)
points(sp,cex=.2,col="red")




# Calcoliamo il numero di specie per ogni paese
spc <- tapply(v$SPECIES, sp$COUNTRY, function(x)length(unique(x)))
spc <- data.frame(COUNTRY=names(spc), nspp = spc)
cns <- merge(cn, spc, by="COUNTRY", all.x=TRUE)
plot(cns, "nspp", col=rev(terrain.colors(25)), breaks=c(1,5,10,20,30,40,90))
# Mancano i dati di USA e Brasile (non li considero, altrimenti devo fare degli aggiustamenti)

# Tabuliamo ora il numero di occorrenze di ogni specie per ogni paese
tb <- table(v[ c('COUNTRY', 'SPECIES')])
tb[,2:3]  ## Mostro due colonne


# To use a raster with equal-area cells, the data need to be projected to an equal-area coordinate reference system (CRS)
# If the longitude/latitude date were used, cells of say 1 square degree would get smaller as you move away from the equator
# For small areas, particularly if they only span a few degrees of longitude, UTM can be a good CRS, but it this case we will
# use a CRS that can be used for a complete hemisphere: Lambert Equal Area Azimuthal.
# For this CRS, you must choose a map origin for your data. This should be somewhere in the center of the points, to minimize 
# the distance (and hence distortion) from any point to the origin. In this case, a reasonable location is (-80, 0).
laea <-"+proj=laea  +lat_0=0 +lon_0=-80"
clb <- project(cn, laea)
pts <- project(sp, laea)
plot(clb)
points(pts, col='red', cex=.5)




# SPECIES RICHNESS
# Per prima cosa abbiamo bisogno di un template raster vuoto
r <- rast(clb)  ;  res(r) <- 200000
# Ora calcolo la ricchezza di specie
rich <- rasterize(pts, r, "SPECIES", function(x, ...) length(unique(na.omit(x))))
plot(rich)  ;  lines(clb)
# Poi faccio un raster con il numero di osservazioni
obs <- rasterize(pts, r, field="SPECIES", fun=function(x, ...)length((na.omit(x))) )
plot(obs)  ;  lines(clb)
# Infine una comparazione cella per cella di numero di specie e di osservazioni
plot(obs, rich, cex=1, xlab="Observations", ylab="Richness")
# Si nota una chiara relazione positiva tra numero di osservazioni e numero di specie
# Per eliminare questa distorsione devo usare tecniche come la 'rarefazione' o 'richness estimators'

# Plottiamo il gradiente di latitudine in ricchezza
d <- v[, c('lat', 'SPECIES')]
d$lat <- round(d$lat)
g <- tapply(d$SPECIES, d$lat, function(x) length(unique(na.omit(x))) )
plot(names(g), g)
lines(names(g), raster::movingFun(g, 3))









            
              






