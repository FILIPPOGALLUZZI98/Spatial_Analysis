library(terra)
library(imageRy)
library(viridis)
setwd("D:R_Studio/Nuova_cartella")


# Faccio dei cicli for per assegnare le variabili alle immagini scaricate
nomi_var <- c()
lett <- c("a", "b", "c", "d", "e", "f")
for (i in lett) {
  for (j in c(2, 3, 4, 8)) {
    nomi_var <- c(nomi_var, paste("S", i, "_", j, sep=""))}}
nomi_file <- c()
for (i in lett) {
  for (j in c(2, 3, 4, 8)) {
    nomi_file <- c(nomi_file, paste("S", i, "_", j,".tiff", sep=""))}}
for (i in 1:length(nomi_var)) {
  assign(nomi_var[i], rast(nomi_file[i]))}


Sa<-c(Sa_4,Sa_3,Sa_2,Sa_8)
Sb<-c(Sb_4,Sb_3,Sb_2,Sb_8)
Sc<-c(Sc_4,Sc_3,Sc_2,Sc_8)
Sd<-c(Sd_4,Sd_3,Sd_2,Sd_8)
Se<-c(Se_4,Se_3,Se_2,Se_8)
Sf<-c(Sf_4,Sf_3,Sf_2,Sf_8)
par(mfrow=c(2,3))
plotRGB(Sa, stretch="lin", main="January 2022")
plotRGB(Sb, stretch="lin", main="March 2022")
plotRGB(Sc, stretch="lin", main="May 2022")
plotRGB(Sd, stretch="lin", main="July 2022")
plotRGB(Se, stretch="lin", main="September 2022")
plotRGB(Sf, stretch="lin", main="October 2022")


ndvia<-(Sa_8-Sa_4)/(Sa_8+Sa_4)
ndvib<-(Sb_8-Sb_4)/(Sb_8+Sb_4)
ndvic<-(Sc_8-Sc_4)/(Sc_8+Sc_4)
ndvid<-(Sd_8-Sd_4)/(Sd_8+Sd_4)
ndvie<-(Se_8-Se_4)/(Se_8+Se_4)
ndvif<-(Sf_8-Sf_4)/(Sf_8+Sf_4)
par(mfrow=c(2,3))
plot(ndvia, col=rev(terrain.colors(10)), main = "NDVI Jan", range=c(0,1))
plot(ndvib, col=rev(terrain.colors(10)), main = "NDVI Mar", range=c(0,1))
plot(ndvic, col=rev(terrain.colors(10)), main = "NDVI May", range=c(0,1))
plot(ndvid, col=rev(terrain.colors(10)), main = "NDVI July", range=c(0,1))
plot(ndvie, col=rev(terrain.colors(10)), main = "NDVI Sept", range=c(0,1))
plot(ndvif, col=rev(terrain.colors(10)), main = "NDVI Oct", range=c(0,1))

## HISTOGRAMS
par(mfrow=c(2,3))
ha<-hist(ndvia, main = "Jan NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(0, 1, 0.1), labels = seq(0, 1, 0.1))
hb<-hist(ndvib, main = "Mar NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(0, 1, 0.1), labels = seq(0, 1, 0.1))
hc<-hist(ndvic, main = "May NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(0, 1, 0.1), labels = seq(0, 1, 0.1))
hd<-hist(ndvid, main = "July NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(0, 1, 0.1), labels = seq(0, 1, 0.1))
he<-hist(ndvie, main = "Sept NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(0, 1, 0.1), labels = seq(0, 1, 0.1))
hf<-hist(ndvif, main = "Oct NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(0, 1, 0.1), labels = seq(0, 1, 0.1))

par(mfrow=c(2,3))
h_1<-hist(ndvia, main = "Jan", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 2, xaxt = "n") 
axis(side=1, at = seq(0, 1, 1), labels = seq(0, 1, 1))
h_2<-hist(ndvib, main = "March", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 2, xaxt = "n") 
axis(side=1, at = seq(0, 1, 1), labels = seq(0, 1, 1))
h_3<-hist(ndvic, main = "May", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 2, xaxt = "n") 
axis(side=1, at = seq(0, 1, 1), labels = seq(0, 1, 1))
h_4<-hist(ndvid, main = "July", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 2, xaxt = "n") 
axis(side=1, at = seq(0, 1, 1), labels = seq(0, 1, 1))
h_5<-hist(ndvie, main = "Sept", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 2, xaxt = "n") 
axis(side=1, at = seq(0, 1, 1), labels = seq(0, 1, 1))
h_6<-hist(ndvif, main = "Oct", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 2, xaxt = "n") 
axis(side=1, at = seq(0, 1, 1), labels = seq(0, 1, 1))



