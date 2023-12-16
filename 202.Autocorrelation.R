# Autocorrelation is a measure of similarity (correlation) between nearby observations

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








