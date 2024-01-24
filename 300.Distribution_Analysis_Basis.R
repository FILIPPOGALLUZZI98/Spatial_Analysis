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

# Ricordare di mettere "mostra nascosti" --> C:\Users\filip\AppData\Local\R\win-library\4.3\sdm
# I file .shp sono file vettoriali, ovvero sono serie di coordinate; Esiste una funzione in 'terra'
# che fa passare dal nome del file ai punti
file<-system.file("external/species.shp",package="sdm")
rana<-vect(file); rana
# Il dataset 'rana' contiene la variabile 'Occurrence' che può assumere 1 (presenze) e 0 (assenze)

plot(rana)  ## Ottengo un grafico dei punti di osservazione, non delle presenze!
# Per selezionare solo le presenze
pres<-rana[rana$Occurrence==1]; abse<-rana[rana$Occurrence==0]
plot(pres,col="red"); points(abse,col="yellow")


# Il pacchetto contiene anche altri dati, tra cui i predittori come: temperatura, altitudine, precipitazioni
# e vegetation cover. Dato che sono file .asc, sono raster data e dobbiamo usare una funzione diversa da 'vect'
elev <- system.file("external/elevation.asc", package="sdm"); elevmap<-rast(elev)
temp<-system.file("external/temperature.asc",package="sdm"); tempmap<-rast(temp)
prec<-system.file("external/precipitation.asc",package="sdm"); precmap<-rast(prec)
vege<-system.file("external/vegetation.asc",package="sdm"); vegemap<-rast(vege)

# A questo punto posso fare i grafici separati oppure:
preds <- c(elevmap, precmap, tempmap, vegemap)
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl) 

# Se voglio sovrapporre le presenze
par(mfrow=c(2,2))
plot(elevmap); points(pres,cex=1,col="black")
plot(tempmap); points(pres,cex=1,col="black")
plot(precmap); points(pres,cex=1,col="black")
plot(vegemap); points(pres,cex=1,col="black")




