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

plot(rana)  ## Ottengo un grafico di tutti i punti di osservazione, non delle presenze!!
# Per selezionare solo le presenze
pres<-rana[rana$Occurrence==1]; abse<-rana[rana$Occurrence==0]
plot(pres,col="red"); points(abse,col="yellow")


# Il pacchetto contiene anche altri dati, tra cui i predittori come: temperatura, altitudine, precipitazioni
# e vegetation cover. Dato che sono file .asc, sono raster data e dobbiamo usare una funzione diversa da 'vect'
elev<-system.file("external/elevation.asc", package="sdm"); elevmap<-rast(elev)
temp<-system.file("external/temperature.asc",package="sdm"); tempmap<-rast(temp)
prec<-system.file("external/precipitation.asc",package="sdm"); precmap<-rast(prec)
vege<-system.file("external/vegetation.asc",package="sdm"); vegemap<-rast(vege)

# A questo punto posso fare i grafici separati oppure:
preds<-c(elevmap, precmap, tempmap, vegemap)
cl<-colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl) 

# Se voglio sovrapporre le presenze
par(mfrow=c(2,2))
plot(elevmap, main="Elevation"); points(pres,cex=1,col="black")
plot(tempmap, main="Temperature"); points(pres,cex=1,col="black")
plot(precmap, main="Precipitations"); points(pres,cex=1,col="black")
plot(vegemap, main="Vegetation"); points(pres,cex=1,col="black")


###############################################################################################
###############################################################################################
# ADVANCED

# Per introdurre l'argomento: osservazioni di Bigfoot
if (!require("rspat")) remotes::install_github("rspatial/rspat")
if (!require("predicts")) install.packages("predicts")
if (!require("geodata")) install.packages("geodata")
library(terra)
library(rspat)
library(geodata)


# Assegnamo ad una variabile le osservazioni di bigfoot
bf <- spat_data("bigfoot")
head(bf)  ## 3 variabili: latitudine, longitudine e class

# Plottiamo le osservazioni sulla mappa del Nord America
wrld <- geodata::world(path=".")
bnds <- wrld[wrld$NAME_0 %in% c("Canada", "Mexico", "United States"), ]
plot(bf[,1:2], cex=0.5, col="red")
lines(bnds)

# PREDITTORI
# Solitamente si usano i dati climatici come predittori nei modelli. In questo caso usiamo "bioclimatic variables":
# https://www.worldclim.org/data/bioclim.html. 
wc <- geodata::worldclim_global("bio", res=10, ".")  ## Scegliamo la classe di predittori e la risoluzione in gradi
plot(wc[[c(1, 12)]], nr=2)  ## Plottiamo i predittori 1 e 12

# A questo punto estraiamo i dati climatici per le località che ci interessano. In questo modo possiamo trovare quali 
# sono le condizioni climatiche preferite dalle specie
bfc <- extract(wc, bf[,1:2]); bfc <- bfc[,-1]  ## Togliamo la colonna ID che non ci interessa

# Plottiamo la distribuzione delle specie nello spazio ambientale. In questo caso T vs Prec dei siti in cui bigfoot è 
# stato osservato
plot(bfc[ ,"wc2.1_10m_bio_1"], bfc[, "wc2.1_10m_bio_12"], col="red",
        xlab="Annual mean temperature (°C)", ylab="Annual precipitation (mm)")

# Solitamente, nei modelli vengono comparati i valori dei predittori dove le specie sono state osservate rispetto alle zone
# dove non sono state osservate. Se non è presente una revisione sistematica di assenze/presenze allora facciamo 
# presence vs background. Il background è la previsione random (o massima entropia). Otteniamo quello che si verificherebbe
# se la specie non avesse nessuna preferenza dei predittori.

# Nel caso specifico, calcoliamo l'estenzione di tutti i punti di osservazione (non c'è ragione di estendere il background
# anche in posti lontani):
ext_bf <- ext(vect(bf[, 1:2])) + 1  ;  ext_bf
# Poi prendiamo 5K campioni random da SpatExtent
set.seed(0)
window(wc) <- ext_bf
bg <- spatSample(wc, 5000, "random", na.rm=TRUE, xy=TRUE)
plot(bg[, c("x", "y")])

# A questo punto possiamo comparare le presenze con il background per T e Prec come nel grafico precedente
plot(bg[,1], bg[,12], xlab="Annual mean temperature (°C)",
          ylab="Annual precipitation (mm)", cex=.8)
points(bfc[,1], bfc[,12], col="red", cex=.6, pch="+")
legend("topleft", c("observed", "background"), col=c("red", "black"), pch=c("+", "o"), pt.cex=c(.6, .8))

# Una ulteriore analisi può essere quella di dividere i dati in est/ovest
bfe <- bfc[bf[,1] > -102, ]  ## East
bfw <- bfc[bf[,1] <= -102, ]  ## West

# A questo punto unisco le presenze ("1") con il background ("0")
dw <- rbind(cbind(pa=1, bfw), cbind(pa=0, bg))
de <- rbind(cbind(pa=1, bfe), cbind(pa=0, bg))
# Creo due dataframe rispettivamente con i dati Ovest ed Est
dw <- data.frame(dw)
de <- data.frame(na.omit(de))












