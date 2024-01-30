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

# Una ulteriore analisi può essere quella di dividere i dati in est/ovest
bfe <- bfc[bf[,1] > -102, ]  ## East
bfw <- bfc[bf[,1] <= -102, ]  ## West

# A questo punto unisco le presenze ("1") con il background ("0")
dw <- rbind(cbind(pa=1, bfw), cbind(pa=0, bg))
de <- rbind(cbind(pa=1, bfe), cbind(pa=0, bg))
# Creo due dataframe rispettivamente con i dati Ovest ed Est
dw <- data.frame(dw)
de <- data.frame(na.omit(de))




## CART (Classification and Regression Trees)
# Metodi tree-based per la classificazione e la regressione involvono la stratificazione o la segmentazione dello 
# spazio dei predittori in un numero di regioni semplici. Il tipo di questi approcci è conosciuto come decision tree method
# e può essere applciato sia a metodi di regressione che di classificazione
library(rpart)

# Mi concentro sui dati ad Ovest 'dw'
cart <- rpart(pa~., data=dw)  
printcp(cart)
plotcp(cart)

# Usiamo lo stesso modello con meno splits
cart <- rpart(pa~., data=dw, cp=0.02)
# And here is the tree
library(rpart.plot)
rpart.plot(cart, uniform=TRUE, main="Regression Tree")

# Ora possiamo usare il modello per mostrare quanto attrattivo è il clima per le specie
x <- predict(wc, cart)
x <- mask(x, wc[[1]])
x <- round(x, 2)
plot(x, type="class", plg=list(x="bottomleft"))
# Ci sono 6 valori, perché l'albero di regressione ha 6 valori


## Random Forest
# Selezioniamo alcuni punti per la validazione finale
set.seed(123)
i <- sample(nrow(dw), 0.2 * nrow(dw))
test <- dw[i,]
train <- dw[-i,]

# Ora facciamo la classificazione e usiamo il modello 'RandomForest'
fpa <- as.factor(train[, 'pa'])
library(randomForest)
crf <- randomForest(train[, 2:ncol(train)], fpa)  ;  crf
varImpPlot(crf)  ## Mostra quale variabile è più importante per spiegare il modello

# Per fare la regressione
trf <- tuneRF(train[, 2:ncol(train)], train[, "pa"])  ;  trf
mt <- trf[which.min(trf[,2]), 1]  ;  mt
rrf <- randomForest(train[, 2:ncol(train)], train[, "pa"], mtry=mt, ntree=250)  ;  rff
plot(rrf)












