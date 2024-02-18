library(terra)
library(imageRy)
library(viridis)
setwd("D:R_Studio/Immagini_Progetto_Monitoring")

## Commenta immagini,mesi, come ho fatto il ciclo for
nomi_var <- c()
for (i in 18:23) {
  for (j in c(2, 3, 4, 8, 11)) {
    nomi_var <- c(nomi_var, paste("S", i, "_", j, sep=""))}}
nomi_file <- c()
for (i in 18:23) {
  for (j in c(2, 3, 4, 8, 11)) {
    nomi_file <- c(nomi_file, paste("S", i, "_", j,".tiff", sep=""))}}
for (i in 1:length(nomi_var)) {
  assign(nomi_var[i], rast(nomi_file[i]))}

# Commento immagini colori reali (come ho fatto)
S18<-c(S18_4,S18_3,S18_2,S18_8)
S19<-c(S19_4,S19_3,S19_2,S19_8)
S20<-c(S20_4,S20_3,S20_2,S20_8)
S21<-c(S21_4,S21_3,S21_2,S21_8)
S22<-c(S22_4,S22_3,S22_2,S22_8)
S23<-c(S23_4,S23_3,S23_2,S23_8)
par(mfrow=c(2,3))
plotRGB(S18, stretch="lin", main="April 2018")
plotRGB(S19, stretch="lin", main="April 2019")
plotRGB(S20, stretch="lin", main="April 2020")
plotRGB(S21, stretch="lin", main="April 2021")
plotRGB(S22, stretch="lin", main="April 2022")
plotRGB(S23, stretch="lin", main="April 2023")






## NDVI
ndvi18<-(S18_8-S18_4)/(S18_8+S18_4)
ndvi19<-(S19_8-S19_4)/(S19_8+S19_4)
ndvi20<-(S20_8-S20_4)/(S20_8+S20_4)
ndvi21<-(S21_8-S21_4)/(S21_8+S21_4)
ndvi22<-(S22_8-S22_4)/(S22_8+S22_4)
ndvi23<-(S23_8-S23_4)/(S23_8+S23_4)
par(mfrow=c(2,3))
plot(ndvi18, col=rev(terrain.colors(10)), main = "NDVI 2019", range=c(0,1))
plot(ndvi19, col=rev(terrain.colors(10)), main = "NDVI 2019", range=c(0,1))
plot(ndvi20, col=rev(terrain.colors(10)), main = "NDVI 2020", range=c(0,1))
plot(ndvi21, col=rev(terrain.colors(10)), main = "NDVI 2021", range=c(0,1))
plot(ndvi22, col=rev(terrain.colors(10)), main = "NDVI 2022", range=c(0,1))
plot(ndvi23, col=rev(terrain.colors(10)), main = "NDVI 2023", range=c(0,1))

par(mfrow=c(2,3))
h18<-hist(ndvi18, main = "2018 NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(0, 1, 0.1), labels = seq(0, 1, 0.1))
h19<-hist(ndvi19, main = "2019 NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(0, 1, 0.1), labels = seq(0, 1, 0.1))
h20<-hist(ndvi20, main = "2020 NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(0, 1, 0.1), labels = seq(0, 1, 0.1))
h21<-hist(ndvi21, main = "2021 NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(0, 1, 0.1), labels = seq(0, 1, 0.1))
h22<-hist(ndvi22, main = "2022 NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(0, 1, 0.1), labels = seq(0, 1, 0.1))
h23<-hist(ndvi23, main = "2023 NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(0, 1, 0.1), labels = seq(0, 1, 0.1))

# TREND OF NDVI
par(mfrow=c(2,3))
h_1<-hist(ndvi18, main = "2018 NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 2, xaxt = "n") 
axis(side=1, at = seq(0, 1, 1), labels = seq(0, 1, 1))
h_2<-hist(ndvi19, main = "2019 NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 2, xaxt = "n") 
axis(side=1, at = seq(0, 1, 1), labels = seq(0, 1, 1))
h_3<-hist(ndvi20, main = "2020 NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 2, xaxt = "n") 
axis(side=1, at = seq(0, 1, 1), labels = seq(0, 1, 1))
h_4<-hist(ndvi21, main = "2021 NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 2, xaxt = "n") 
axis(side=1, at = seq(0, 1, 1), labels = seq(0, 1, 1))
h_5<-hist(ndvi22, main = "2022 NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 2, xaxt = "n") 
axis(side=1, at = seq(0, 1, 1), labels = seq(0, 1, 1))
h_6<-hist(ndvi23, main = "2023 NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0, 1),  breaks = 2, xaxt = "n") 
axis(side=1, at = seq(0, 1, 1), labels = seq(0, 1, 1))

# VEGETATION
veg18 <- clamp(ndvi18, 0.4, values=FALSE); veg19 <- clamp(ndvi19, 0.4, values=FALSE) 
veg20 <- clamp(ndvi20, 0.4, values=FALSE); veg21 <- clamp(ndvi21, 0.4, values=FALSE) 
veg22 <- clamp(ndvi22, 0.4, values=FALSE); veg23 <- clamp(ndvi23, 0.4, values=FALSE) 

# VEGETATION OVERLAPS
# Tutto quello che non è vegetazione è bianco, cioè è fuori scala:
par(mfrow=c(2,3))
plotRGB(S18, axes=TRUE, stretch="lin")
plot(veg18, add=TRUE, legend=TRUE)
plotRGB(S19, axes=TRUE, stretch="lin")
plot(veg19, add=TRUE, legend=TRUE)
plotRGB(S20, axes=TRUE, stretch="lin")
plot(veg20, add=TRUE, legend=TRUE)
plotRGB(S21, axes=TRUE, stretch="lin")
plot(veg21, add=TRUE, legend=TRUE)
plotRGB(S22, axes=TRUE, stretch="lin")
plot(veg22, add=TRUE, legend=TRUE)
plotRGB(S23, axes=TRUE, stretch="lin")  
plot(veg23, add=TRUE, legend=TRUE)

# FALSE COMPOSITE
par(mfrow=c(1,2))
im.plotRGB(S18,4,1,2)
plot(veg18, legend=FALSE, axes=FALSE)
title(main="Titolo comune per entrambi i grafici")
im.plotRGB(S19,4,1,2)
plot(veg19, legend=FALSE, axes=FALSE)
im.plotRGB(S20,4,1,2)
plot(veg20, legend=FALSE, axes=FALSE)
im.plotRGB(S21,4,1,2)
plot(veg21, legend=FALSE, axes=FALSE)
im.plotRGB(S22,4,1,2)
plot(veg22, legend=FALSE, axes=FALSE)
im.plotRGB(S23,4,1,2)
plot(veg23, legend=FALSE, axes=FALSE)

# CLASSIFICATION FOR VEGETATION
m <- c(0, 0.4, 0.6, 0.8, 1)
cl<-colorRampPalette(c("white","darkgoldenrod1","darkolivegreen1","darkgreen"))(4)
cl2<-colorRampPalette(c("white","darkgoldenrod1","darkkhaki","darkolivegreen1","darkolivegreen3"))(5)
par(mfrow=c(2,3))
vegc18 <- classify(veg18, m) 
plot(vegc18, col = cl, main = 'Vegetation 2018')
vegc19 <- classify(veg19, m) 
plot(vegc19, col = cl, main = 'Vegetation 2019')
vegc20 <- classify(veg20, m) 
plot(vegc20, col = cl, main = 'Vegetation 2020')
vegc21 <- classify(veg21, m) 
plot(vegc21, col = cl, main = 'Vegetation 2021')
vegc22 <- classify(veg22, m) 
plot(vegc22, col = cl, main = 'Vegetation 2022')
vegc23 <- classify(veg23, m) 
plot(vegc23, col = cl, main = 'Vegetation 2023')

# TREND OF VEGETATION
par(mfrow=c(2,3))
h_1<-hist(veg18, main = "2018 VEG values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0.4, 1), ylim = c(0, 350000),  breaks = 5, xaxt = "n") 
axis(side=1, at = seq(0.4, 1, 0.1), labels = seq(0.4, 1, 0.1))
h_2<-hist(veg19, main = "2019 VEG values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0.4, 1), ylim = c(0, 350000),  breaks = 5, xaxt = "n") 
axis(side=1, at = seq(0.4, 1, 0.1), labels = seq(0.4, 1, 0.1))
h_3<-hist(veg20, main = "2020 VEG values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0.4, 1), ylim = c(0, 350000),  breaks = 5, xaxt = "n") 
axis(side=1, at = seq(0.4, 1, 0.1), labels = seq(0.4, 1, 0.1))
h_4<-hist(veg21, main = "2021 VEG values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0.4, 1), ylim = c(0, 350000),  breaks = 5, xaxt = "n") 
axis(side=1, at = seq(0.4, 1, 0.1), labels = seq(0.4, 1, 0.1))
h_5<-hist(veg22, main = "2022 VEG values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0.4, 1), ylim = c(0, 350000),  breaks = 5, xaxt = "n") 
axis(side=1, at = seq(0.4, 1, 0.1), labels = seq(0.4, 1, 0.1))
h_6<-hist(veg23, main = "2023 VEG values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(0.4, 1), ylim = c(0, 350000),  breaks = 5, xaxt = "n") 
axis(side=1, at = seq(0.4, 1, 0.1), labels = seq(0.4, 1, 0.1))

# Per la vegetazione
stack2<-c(veg18, veg19, veg20, veg21, veg22, veg23)
cl<-rev(terrain.colors(10))
# plot(stack2,col=cl, range=c(0,1))
diff21=stack2[[2]]-stack2[[1]]
diff22=stack2[[3]]-stack2[[1]]
diff23=stack2[[4]]-stack2[[1]]
diff24=stack2[[5]]-stack2[[1]]
diff25=stack2[[6]]-stack2[[1]]
cl2<-colorRampPalette(c("blue","white","red"))(100)
## Le zone rosse sono quelle con veg aumentata, viceversa con il blu
par(mfrow=c(2,3))
plot(diff21,col=cl2, range=c(-0.45,0.45), main="Comparison 2019-2018")
plot(diff22,col=cl2, range=c(-0.45,0.45), main="Comparison 2020-2018")
plot(diff23,col=cl2, range=c(-0.45,0.45), main="Comparison 2021-2018")
plot(diff24,col=cl2, range=c(-0.45,0.45), main="Comparison 2022-2018")
plot(diff25,col=cl2, range=c(-0.45,0.45), main="Comparison 2023-2018")






## NDMI DA FARE
#############################################################
#############################################################
#############################################################
#############################################################






## PCA AND VARIABILITY
m <- matrix(1/49,7,7)
cl<-colorRampPalette(viridis(7))(255)

S18_sdm<-focal(S18_8, m, fun=sd)
S19_sdm<-focal(S19_8, m, fun=sd)
S20_sdm<-focal(S20_8, m, fun=sd)
S21_sdm<-focal(S21_8, m, fun=sd)
S22_sdm<-focal(S22_8, m, fun=sd)
S23_sdm<-focal(S23_8, m, fun=sd)
par(mfrow=c(2,3))
plot(S18_sdm, col=cl, axis=NULL, range=c(0,0.003))
plot(S19_sdm, col=cl, axis=NULL, range=c(0,0.003))
plot(S20_sdm, col=cl, axis=NULL, range=c(0,0.003))
plot(S21_sdm, col=cl, axis=NULL, range=c(0,0.003))
plot(S22_sdm, col=cl, axis=NULL, range=c(0,0.003))
plot(S23_sdm, col=cl, axis=NULL, range=c(0,0.003))

## PCA
S18pc<-im.pca2(S18) 
S18_pc1<-S18pc$PC1
S19pc<-im.pca2(S19) 
S19_pc1<-S19pc$PC1
S20pc<-im.pca2(S20) 
S20_pc1<-S20pc$PC1
S21pc<-im.pca2(S21) 
S21_pc1<-S21pc$PC1
S22pc<-im.pca2(S22) 
S22_pc1<-S22pc$PC1
S23pc<-im.pca2(S23) 
S23_pc1<-S23pc$PC1
par(mfrow=c(2,3))
plot(S18_pc1,col=cl, range=c(-0.3,0.6), axis=NULL)
plot(S19_pc1,col=cl, range=c(-0.3,0.6), axis=NULL)
plot(S20_pc1,col=cl, range=c(-0.3,0.6), axis=NULL)
plot(S21_pc1,col=cl, range=c(-0.3,0.6), axis=NULL)
plot(S22_pc1,col=cl, range=c(-0.3,0.6), axis=NULL)
plot(S23_pc1,col=cl, range=c(-0.3,0.6), axis=NULL)

# PCA variability
S18_pc1sdm<-focal(S18_pc1, m, fun=sd)
S19_pc1sdm<-focal(S18_pc1, m, fun=sd)
S20_pc1sdm<-focal(S20_pc1, m, fun=sd)
S21_pc1sdm<-focal(S20_pc1, m, fun=sd)
S22_pc1sdm<-focal(S20_pc1, m, fun=sd)
S23_pc1sdm<-focal(S23_pc1, m, fun=sd)
par(mfrow=c(2,3))
plot(S18_pc1sdm, col=cl, range=c(0,0.005), axis=NULL)
plot(S19_pc1sdm, col=cl, range=c(0,0.005), axis=NULL)
plot(S20_pc1sdm, col=cl, range=c(0,0.005), axis=NULL)
plot(S21_pc1sdm, col=cl, range=c(0,0.005), axis=NULL)
plot(S22_pc1sdm, col=cl, range=c(0,0.005), axis=NULL)
plot(S23_pc1sdm, col=cl, range=c(0,0.005), axis=NULL)






## CLASSIFICATION
cl<-colorRampPalette(c("coral","white","darkgreen"))(100)
S18c <- im.classify(S18, seed=1, num_clusters=3, do_plot = FALSE)
par(mfrow=c(1,3))
plotRGB(S18, stretch="lin", main="April 2018")
plot(S18c, main="Classification 2018",col=cl, legend=FALSE, axes=FALSE)
plot(veg18, col="darkgreen", legend=FALSE, axes=FALSE)
S19c <- im.classify(S19, seed=1, num_clusters=3, do_plot = FALSE)
par(mfrow=c(1,3))
plotRGB(S19, stretch="lin", main="April 2019")
plot(S19c, main="Classification 2019",col=cl, legend=FALSE, axes=FALSE)
plot(veg19, col="darkgreen", legend=FALSE, axes=FALSE)
S20c <- im.classify(S20, seed=1, num_clusters=3, do_plot = FALSE)
par(mfrow=c(1,3))
plotRGB(S20, stretch="lin", main="April 2020")
plot(S20c, main="Classification 2020",col=cl, legend=FALSE, axes=FALSE)
plot(veg20, col="darkgreen", legend=FALSE, axes=FALSE)
S21c <- im.classify(S21, seed=1, num_clusters=3, do_plot = FALSE)
par(mfrow=c(1,3))
plotRGB(S21, stretch="lin", main="April 2021")
plot(S21c, main="Classification 2021",col=cl, legend=FALSE, axes=FALSE)
plot(veg21, col="darkgreen", legend=FALSE, axes=FALSE)
S22c <- im.classify(S22, seed=1, num_clusters=3, do_plot = FALSE)
par(mfrow=c(1,3))
plotRGB(S22, stretch="lin", main="April 2022")
plot(S22c, main="Classification 2022",col=cl, legend=FALSE, axes=FALSE)
plot(veg22, col="darkgreen", legend=FALSE, axes=FALSE)
S23c <- im.classify(S23, seed=1, num_clusters=3, do_plot = FALSE)
par(mfrow=c(1,3))
plotRGB(S23, stretch="lin", main="April 2023")
plot(S23c, main="Classification 2023",col=cl, legend=FALSE, axes=FALSE)
plot(veg23, col="darkgreen", legend=FALSE, axes=FALSE)





# MONTHLY ANALYSIS 2022-2021
# da a-f --> 2022
# da g a n --> 2021
# Faccio dei cicli for per assegnare le variabili alle immagini scaricate
nomi_var <- c()
lett <- c("a", "b", "c", "d", "e", "f","g","h","i","l","m","n")
for (i in lett) {
  for (j in c(2, 3, 4, 8)) {
    nomi_var <- c(nomi_var, paste("S", i, "_", j, sep=""))}}
nomi_file <- c()
for (i in lett) {
  for (j in c(2, 3, 4, 8)) {
    nomi_file <- c(nomi_file, paste("S", i, "_", j,".tiff", sep=""))}}
for (i in 1:length(nomi_var)) {
  assign(nomi_var[i], rast(nomi_file[i]))}

Sa<-c(Sa_4,Sa_3,Sa_2,Sa_8); Sb<-c(Sb_4,Sb_3,Sb_2,Sb_8); Sc<-c(Sc_4,Sc_3,Sc_2,Sc_8)
Sd<-c(Sd_4,Sd_3,Sd_2,Sd_8); Se<-c(Se_4,Se_3,Se_2,Se_8); Sf<-c(Sf_4,Sf_3,Sf_2,Sf_8)
Sg<-c(Sg_4,Sg_3,Sg_2,Sg_8); Sh<-c(Sh_4,Sh_3,Sh_2,Sh_8); Si<-c(Si_4,Si_3,Si_2,Si_8)
Sl<-c(Sl_4,Sl_3,Sl_2,Sl_8); Sm<-c(Sm_4,Sm_3,Sm_2,Sm_8); Sn<-c(Sn_4,Sn_3,Sn_2,Sn_8)

par(mfrow=c(2,3))
plotRGB(Sa, stretch="lin", main="January 2022")
plotRGB(Sc, stretch="lin", main="May 2022")
plotRGB(Se, stretch="lin", main="September 2022")
plotRGB(Sg, stretch="lin", main="January 2021")
plotRGB(Si, stretch="lin", main="May 2021")
plotRGB(Sm, stretch="lin", main="September 2021")

# NDVI COMPARISON
ndvia<-(Sa_8-Sa_4)/(Sa_8+Sa_4); ndvib<-(Sb_8-Sb_4)/(Sb_8+Sb_4)
ndvic<-(Sc_8-Sc_4)/(Sc_8+Sc_4); ndvid<-(Sd_8-Sd_4)/(Sd_8+Sd_4)
ndvie<-(Se_8-Se_4)/(Se_8+Se_4); ndvif<-(Sf_8-Sf_4)/(Sf_8+Sf_4)
ndvig<-(Sg_8-Sg_4)/(Sg_8+Sg_4); ndvih<-(Sh_8-Sh_4)/(Sh_8+Sh_4)
ndvii<-(Si_8-Si_4)/(Si_8+Si_4); ndvil<-(Sl_8-Sl_4)/(Sl_8+Sl_4)
ndvim<-(Sm_8-Sm_4)/(Sm_8+Sm_4); ndvin<-(Sn_8-Sn_4)/(Sn_8+Sn_4)

vega <- clamp(ndvia, 0.4, values=FALSE); vegb <- clamp(ndvib, 0.4, values=FALSE) 
vegc <- clamp(ndvic, 0.4, values=FALSE); vegd <- clamp(ndvid, 0.4, values=FALSE) 
vege <- clamp(ndvie, 0.4, values=FALSE); vegf <- clamp(ndvif, 0.4, values=FALSE) 
vegg <- clamp(ndvig, 0.4, values=FALSE); vegh <- clamp(ndvih, 0.4, values=FALSE) 
vegi <- clamp(ndvii, 0.4, values=FALSE); vegl <- clamp(ndvil, 0.4, values=FALSE) 
vegm <- clamp(ndvim, 0.4, values=FALSE); vegn <- clamp(ndvin, 0.4, values=FALSE) 

d1 <- vega-vegg; d2 <- vegb-vegh; d3 <- vegc-vegi
d4 <- vegd-vegl; d5 <- vege-vegm; d6 <-vegf-vegn

par(mfrow=c(2,3))
cl<-colorRampPalette(c("blue","white","red"))(100)
# Valori rossi = vegetazione aumentata
plot(d1, col=cl, main = "NDVI Jan", range=c(-0.4,0.4))
plot(d2, col=cl, main = "NDVI Mar", range=c(-0.4,0.4))
plot(d3, col=cl, main = "NDVI May", range=c(-0.4,0.4))
plot(d4, col=cl, main = "NDVI July", range=c(-0.4,0.4))
plot(d5, col=cl, main = "NDVI Sept", range=c(-0.4,0.4))
plot(d6, col=cl, main = "NDVI Nov", range=c(-0.4,0.4))

# TREND OF NDVI
# Questo non considera l'intensità, ma solo se le regioni in cui ci sono state variazioni
# negative sono di più o di meno di quelle con variazioni positive
par(mfrow=c(2,3))
h_1<-hist(d1, main = "January", xlab = "", ylab= "Frequency", 
     col = "wheat", xlim = c(-0.5, 0.5),  breaks = 2, xaxt = "n") 
axis(side=1, at = seq(-1, 1, 1), labels = seq(-1, 1, 1))
h_2<-hist(d2, main = "March", xlab = "", ylab= "Frequency", 
     col = "wheat", xlim = c(-0.5, 0.5),  breaks = 2, xaxt = "n") 
axis(side=1, at = seq(-1, 1, 1), labels = seq(-1, 1, 1))
h_3<-hist(d3, main = "May", xlab = "", ylab= "Frequency", 
     col = "wheat", xlim = c(-0.5, 0.5),  breaks = 2, xaxt = "n") 
axis(side=1, at = seq(-1, 1, 1), labels = seq(-1, 1, 1))
h_4<-hist(d4, main = "July", xlab = "", ylab= "Frequency", 
     col = "wheat", xlim = c(-0.5, 0.5),  breaks = 2, xaxt = "n") 
axis(side=1, at = seq(-1, 1, 1), labels = seq(-1, 1, 1))
h_5<-hist(d5, main = "September", xlab = "", ylab= "Frequency", 
     col = "wheat", xlim = c(-0.5, 0.5),  breaks = 2, xaxt = "n") 
axis(side=1, at = seq(-1, 1, 1), labels = seq(-1, 1, 1))
h_6<-hist(d6, main = "October", xlab = "", ylab= "Frequency", 
     col = "wheat", xlim = c(-0.5, 0.5),  breaks = 2, xaxt = "n") 
axis(side=1, at = seq(-1, 1, 1), labels = seq(-1, 1, 1))


























