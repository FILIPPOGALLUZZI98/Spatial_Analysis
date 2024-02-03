# This document is based on an analysis of the distribution of wild potato species 
# The data we will use is available in the rspatial package
if (!require("rspat")) remotes::install_github('rspatial/rspat')
suppressPackageStartupMessages({
  library(rspat)
  library(terra)
})

# Estraiamo i dati che hanno come estenzione '.csv'
f <- system.file("wildpot.csv", package="rspat")
basename(f)  ;  v <- read.csv(f)











