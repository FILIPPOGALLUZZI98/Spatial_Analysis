library(terra)
library(imageRy)
library(viridis)
setwd("D:R_Studio/Immagini_Progetto_Monitoring")

# Le immagini sono prese da sentinel-2a e sono le immagini di aprile per ogni anno dal 2018 al 2023
# Faccio dei cicli for per assegnare le variabili alle immagini scaricate
nomi_var <- c()
for (i in 18:23) {
  for (j in c(2, 3, 4, 8, 11, 12)) {
    nomi_var <- c(nomi_var, paste("S", i, "_", j, sep=""))}}
nomi_file <- c()
for (i in 18:23) {
  for (j in c(2, 3, 4, 8, 11, 12)) {
    nomi_file <- c(nomi_file, paste("S", i, "_", j,".tiff", sep=""))}}
for (i in 1:length(nomi_var)) {
  assign(nomi_var[i], rast(nomi_file[i]))}







