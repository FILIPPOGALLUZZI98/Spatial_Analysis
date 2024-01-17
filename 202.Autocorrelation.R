## DA CONTROLLARE: https://rspatial.org/analysis/3-spauto.html

# Autocorrelation is a measure of similarity (correlation) between nearby observations
# Pacchetto 'spdep'

# Creiamo due vettori di lunghezza 10 di numeri casuali
set.seed(0)
a<-sample(100, 10)
set.seed(1)
b<-sample(100,10)
plot(a, b, xlab='b', ylab='a', pch=20, col="blue")
cor(a,b)  ## La correlazione è bassa, dato che sono vettori casuali


# Se vogliamo fare la correlazione spaziale, è più difficile perché dobbiamo considerare
# più dimensioni
# Measures of spatial autocorrelation describe the degree two which observations (values)
# at spatial locations, are similar to each other. So we need two things: observations and locations.
# A commonly used statistic that describes spatial autocorrelation is Moran’s I
# Consideriamo il seguente esempio
p<-vect(system.file("ex/lux.shp", package="terra"))  ## Importiamo i dati da 'terra'
p<-p[p$NAME_1=="Diekirch", ]  ## Selezioniamo la variabile NAME_1 con i valori "Diekirch"
p$value<-c(10, 6, 4, 11, 6)  ## Creiamo una nuova variabile
as.data.frame(p)  ## Mostriamo 'p' come dataframe
# Supponiamo di essere interessati all'autocorrelazione spaziale della variabile "AREA"
# If there were spatial autocorrelation, regions of a similar size would be spatially clustered
# 'coordinates' function to get the centroids of the polygons to place the labels
par(mai=c(0,0,0,0))
plot(p, col=2:7)
xy <- centroids(p)
points(xy, cex=6, pch=20, col='white')
text(p, 'ID_2', cex=1.5)
# Here we’ll use adjacency as criterion
w <- adjacent(p, symmetrical=TRUE)  ## Identify cells that are adjacent to a set of raster cells. Or identify adjacent polygons
class(w)
# Plot the links between the polygons.
plot(p, col='gray', border='blue', lwd=2)
p1 <- xy[w[,1], ]
p2 <- xy[w[,2], ]
lines(p1, p2, col='red', lwd=2)


# Moran's Index of Spatial Autocorrelation (spdep package)
ww <-  adjacent(p, "queen", pairs=FALSE)
ww  ## Spatial Weights Matrix
ac <- autocor(p$value, ww, "moran")
ac  ## Autocorrelation Function

# We can make a “Moran scatter plot” to visualize spatial autocorrelation
n <- length(p)
ms <- cbind(id=rep(1:n, each=n), y=rep(y, each=n), value=as.vector(wm * y))
ms <- ms[ms[,3] > 0, ]
ams <- aggregate(ms[,2:3], list(ms[,1]), FUN=mean)
ams <- ams[,-1]
colnames(ams) <- c('y', 'spatially lagged y')
head(ams)
plot(ams, pch=20, col="red", cex=2)
reg <- lm(ams[,2] ~ ams[,1])
abline(reg, lwd=2)
abline(h=mean(ams[,2]), lt=2)
abline(v=ybar, lt=2)




