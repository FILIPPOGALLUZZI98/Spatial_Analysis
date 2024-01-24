## ANALISI SPAZIALE ALBERI

# All'interno del pacchetto 'spatstat' c'è il dataset 'bei' che contiene la posizione degli alberi in
# tropical rainforest of Barro Colorado Island; vogliamo studiarne il pattern spaziale

library(spatstat)
# Cerchiamo tra i vari dataset contenuti in 'spatstat' il dataset 'bei'
data()
# Ci sono due 'bei', e possiamo vedere le caratteristiche:
?bei

# Per osservare la disposizione degli alberi nello spazio
plot(bei, cex=.2, pch=19)  ## Abbiamo modificato dimensione e forma dei punti per chiarezza
# Facciamo lo stesso con 'bei.extra'
plot(bei.extra)
# Si vedono due grafici uno accanto all'altro: elev e grad
# Se vogliamo usare solo una parte del dataset
elev<-bei.extra$elev; grad<-bei.extra$grad
plot(grad)

# Possiamo sovrapporre ai due grafici di elev e grad la posizione degli alberi
plot(elev)
points(bei,cex=.2,pch=19)

# Possiamo trasformare il grafico a dispersione in un grafico di densità;c on questo non 
# lavoriamo più con punti, ma con pixel
density_map<-density(bei)
cl<-colorRampPalette(c("black","red","orange","yellow"))(100)
plot(density_map,col=cl)
points(bei,cex=.2,pch=19)  ## Sovrapporre alla mappa di densità la posizione degli alberi

# Se voglio confrontare 'density_map' ed 'elev'
par(mfrow=c(1,2))
plot(density_map, col=cl); plot(elev)
points(bei,cex=.2,pch=19)

###############################################################################################
###############################################################################################
## DISTRIBUZIONE SPAZIALE RANA TEMPORARIA

library(sdm)
library(terra)











