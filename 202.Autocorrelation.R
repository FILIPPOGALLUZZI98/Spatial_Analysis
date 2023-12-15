# Autocorrelation is a measure of similarity (correlation) between nearby observations

# Creiamo due vettori di lunghezza 10 di numeri casuali
set.seed(0)
a<-sample(100, 10)
set.seed(1)
b<-sample(100,10)
plot(a, b, xlab='b', ylab='a', pch=20, col="blue")
cor(a,b)  ## La correlazione è bassa, dato che sono vettori casuali

# Se ora ordiniamo gli elementi, la correlazione aumenta
a<-sort(a)
b<-sort(b)
plot(a, b, xlab='b', ylab='a', pch=20, col="blue")








