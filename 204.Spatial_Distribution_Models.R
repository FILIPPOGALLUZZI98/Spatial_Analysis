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
bnds <- wrld[wrld$NAME_0 %in% c("Stato da plottare", "Stato da Plottare 2"), ...]
lines(bnds)

# PER PLOTTARE LE OSSERVAZIONI DI UNA SPECIE
plot(bf[,1:2], cex=0.5, col="red")
bf <- spat_data("bigfoot")
dim(bf)
bf

# Let's plot the locations

