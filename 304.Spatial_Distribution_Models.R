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

















