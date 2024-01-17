# Useremo come specie da studiare Bigfoot!!
# I seguenti pacchetti servono per fare l'analisi e per plottare le osservazioni nella
# mappa geografica
if (!require("rspat")) remotes::install_github("rspatial/rspat")
if (!require("predicts")) install.packages("predicts")
if (!require("geodata")) install.packages("geodata")
library(terra)
library(rspat)
library(geodata)

# PER PLOTTARE I CONFINI DEGLI STATI!!
wrld <- geodata::world(path=".")
plot(wrld)  ## Vediamo i confini degli stati
# Se vogliamo vedere solo un certo stato:
bnds <- wrld[wrld$NAME_0 %in% c("Stato da plottare", "Stato da Plottare 2"), ...]
plot(bnds)
# Altrimenti, se vogliamo sovrapporlo alle osservazioni:
lines(bnds)



# PER PLOTTARE LE OSSERVAZIONI DI BIGFOOT
bf <- spat_data("bigfoot")
plot(bf[,1:2], cex=0.5, col="red")
wrld <- geodata::world(path=".")
bnds <- wrld[wrld$NAME_0 %in% c("Canada", "Mexico", "United States"), ]
lines(bnds)


# PREDITTORI
# As is common in species distribution modeling, we use climate data as predictor variables
# https://www.worldclim.org/data/bioclim.html
wc <- geodata::worldclim_global("bio", res=10, ".")  ## "bio"->bioclimatic variables; 10->risoluzione in gradi
plot(wc[[c(1, 12)]], nr=2)  ## [c(1,12)]--> seleziono soltanto i predittori 1 e 12
# Adesso vogliamo estrarre i dati climatici per la zona che ci interessa
bfc <- extract(wc, bf[,1:2])  ## ????
bfc <- bfc[,-1]  ## To remove the first column with the ID that we don't need
plot(bfc[ ,"wc2.1_10m_bio_1"], bfc[, "wc2.1_10m_bio_12"], col="red",
        xlab="Annual mean temperature (°C)", ylab="Annual precipitation (mm)")

















