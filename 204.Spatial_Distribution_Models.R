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
# Plot di T vs Rainfall dei siti in cui Bigfoot è stato osservato
plot(bfc[ ,"wc2.1_10m_bio_1"], bfc[, "wc2.1_10m_bio_12"], col="red",
        xlab="Annual mean temperature (°C)", ylab="Annual precipitation (mm)")

# Normally, one would build a model that would compare the values of the predictor variables at the locations 
# where something was observed, with those values at the locations where it was not observed. But we do not have
# data from a systematic survey that determined presence and absence. We have presence-only data. (And, determining
# absence is not that simple)
# The common approach to deal with these type of data is to not model presence versus absence, but presence versus 
# “background”. The “background” is the random (or maximum entropy) expectation; it is what you would get if the 
# species had no preference for any of the predictor variables (or to other variables that are not in the model, 
# but correlated with the predictor variables)
# There is not much point in taking absence data from very far away (tropical Africa or Antarctica). Typically they
# are taken from more or less the entire study area for which we have presences data
















