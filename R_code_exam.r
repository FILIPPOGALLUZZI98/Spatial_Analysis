library(terra)
library(imageRy)
library(viridis)
setwd("D:R_Studio/Immagini_Progetto_Monitoring")  ## Setting the folder in which there are the images

# FOR cycle to assign names to the variables (Sxx_y: S is common to every variable
# xx --> year; y-->band)
nomi_var <- c()
for (i in 18:23) {
  for (j in c(2, 3, 4, 8)) {
    nomi_var <- c(nomi_var, paste("S", i, "_", j, sep=""))}}
nomi_file <- c()
for (i in 18:23) {
  for (j in c(2, 3, 4, 8)) {
    nomi_file <- c(nomi_file, paste("S", i, "_", j,".tiff", sep=""))}}  ## I need to add the extension
for (i in 1:length(nomi_var)) {
  assign(nomi_var[i], rast(nomi_file[i]))}
# I create a vector with the 4 bands for each eyar (R, G, B, NIR)
S18<-c(S18_4,S18_3,S18_2,S18_8); S19<-c(S19_4,S19_3,S19_2,S19_8)
S20<-c(S20_4,S20_3,S20_2,S20_8); S21<-c(S21_4,S21_3,S21_2,S21_8)
S22<-c(S22_4,S22_3,S22_2,S22_8); S23<-c(S23_4,S23_3,S23_2,S23_8)

# Plot of coordinates for April 2023
plotRGB(S23,1,2,3, axes=TRUE, mar=c(2,2,2,2))
# Plot of the images with real colors
par(mfrow=c(2,3))
plotRGB(S18, stretch="lin", main="2018")
plotRGB(S19, stretch="lin", main="2019")
plotRGB(S20, stretch="lin", main="2020")
plotRGB(S21, stretch="lin", main="2021")
plotRGB(S22, stretch="lin", main="2022")
plotRGB(S23, stretch="lin", main="2023")






## NDVI
# Create NDVI values for each year
ndvi18<-(S18_8-S18_4)/(S18_8+S18_4); ndvi19<-(S19_8-S19_4)/(S19_8+S19_4)
ndvi20<-(S20_8-S20_4)/(S20_8+S20_4); ndvi21<-(S21_8-S21_4)/(S21_8+S21_4)
ndvi22<-(S22_8-S22_4)/(S22_8+S22_4); ndvi23<-(S23_8-S23_4)/(S23_8+S23_4)
# Plot of ndvi for each year
par(mfrow=c(2,3))
cl<-colorRampPalette(magma(10, direction=-1))(255)  ## Reversed palette
# In this case, blue represents higher values and red represents smaller values
plot(ndvi18, col=cl, main = "2018", range=c(0,1), axes=FALSE)
plot(ndvi19, col=cl, main = "2019", range=c(0,1), axes=FALSE)
plot(ndvi20, col=cl, main = "2020", range=c(0,1), axes=FALSE)
plot(ndvi21, col=cl, main = "2021", range=c(0,1), axes=FALSE)
plot(ndvi22, col=cl, main = "2022", range=c(0,1), axes=FALSE)
plot(ndvi23, col=cl, main = "2023", range=c(0,1), axes=FALSE)

# Histograms for NDVI for each year, in order to see the distribution in frequency
par(mfrow=c(1,2))
h18<-hist(ndvi18, main = "2018", xlab = "NDVI", ylab= " ", 
     col = "wheat", xlim = c(0, 1), ylim = c(0, 70000),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(0, 1, 0.1), labels = seq(0, 1, 0.1))
h19<-hist(ndvi19, main = "2019", xlab = "NDVI", ylab= " ", 
     col = "wheat", xlim = c(0, 1), ylim = c(0, 70000),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(0, 1, 0.1), labels = seq(0, 1, 0.1))
par(mfrow=c(1,2))
h20<-hist(ndvi20, main = "2020", xlab = "NDVI", ylab= " ", 
     col = "wheat", xlim = c(0, 1), ylim = c(0, 70000),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(0, 1, 0.1), labels = seq(0, 1, 0.1))
h21<-hist(ndvi21, main = "2021", xlab = "NDVI", ylab= " ", 
     col = "wheat", xlim = c(0, 1), ylim = c(0, 70000),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(0, 1, 0.1), labels = seq(0, 1, 0.1))
par(mfrow=c(1,2))
h22<-hist(ndvi22, main = "2022", xlab = "NDVI", ylab= " ", 
     col = "wheat", xlim = c(0, 1), ylim = c(0, 70000),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(0, 1, 0.1), labels = seq(0, 1, 0.1))
h23<-hist(ndvi23, main = "2023", xlab = "NDVI", ylab= " ", 
     col = "wheat", xlim = c(0, 1), ylim = c(0, 70000),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(0, 1, 0.1), labels = seq(0, 1, 0.1))

# TREND OF NDVI
# The method is the same, but this time the intervals are smaller (only 4)
# in order to see better the trend of NDVI with time
par(mfrow=c(2,3))
h_1<-hist(ndvi18, main = "    2018     ", xlab = "", ylab= "", 
     col = "wheat", xlim = c(0, 1), ylim = c(0, 600000),  breaks = 6, xaxt = "n", axes=FALSE) 
axis(side=1, at = seq(0, 1, 0.5), labels = seq(0, 1, 0.5))
h_2<-hist(ndvi19, main = "    2019     ", xlab = "NDVI", ylab= " ", 
     col = "wheat", xlim = c(0, 1), ylim = c(0, 600000),  breaks = 6, xaxt = "n", axes=FALSE) 
axis(side=1, at = seq(0, 1, 0.5), labels = seq(0, 1, 0.5))
h_3<-hist(ndvi20, main = "    2020     ", xlab = "NDVI", ylab= " ", 
     col = "wheat", xlim = c(0, 1), ylim = c(0, 600000),  breaks = 6, xaxt = "n", axes=FALSE) 
axis(side=1, at = seq(0, 1, 0.5), labels = seq(0, 1, 0.5))
h_4<-hist(ndvi21, main = "    2021     ", xlab = "NDVI", ylab= " ", 
     col = "wheat", xlim = c(0, 1), ylim = c(0, 600000),  breaks = 6, xaxt = "n", axes=FALSE) 
axis(side=1, at = seq(0, 1, 0.5), labels = seq(0, 1, 0.5))
h_5<-hist(ndvi22, main = "    2022     ", xlab = "NDVI", ylab= " ", 
     col = "wheat", xlim = c(0, 1), ylim = c(0, 600000),  breaks = 6, xaxt = "n", axes=FALSE) 
axis(side=1, at = seq(0, 1, 0.5), labels = seq(0, 1, 0.5))
h_6<-hist(ndvi23, main = "    2023     ", xlab = "NDVI", ylab= " ", 
     col = "wheat", xlim = c(0, 1), ylim = c(0, 600000),  breaks = 6, xaxt = "n", axes=FALSE) 
axis(side=1, at = seq(0, 1, 0.5), labels = seq(0, 1, 0.5))

# VEGETATION
# Values of NDVI bigger than 0.4 are considered to be vegetation, then
# I cut values smaller than 0.4 and i create a new variable "veg"
veg18 <- clamp(ndvi18, 0.4, values=FALSE); veg19 <- clamp(ndvi19, 0.4, values=FALSE) 
veg20 <- clamp(ndvi20, 0.4, values=FALSE); veg21 <- clamp(ndvi21, 0.4, values=FALSE) 
veg22 <- clamp(ndvi22, 0.4, values=FALSE); veg23 <- clamp(ndvi23, 0.4, values=FALSE) 

# VEGETATION OVERLAPS
# I overlap the vegatation values over the real images to see the regions in which
# surely there is vegetation; Transparent regions are those with values of NDVI smaller than 0.4
cl <- colorRampPalette(viridis(10, direction=-1))(255)  ## I use the same reversed palette 
par(mfrow=c(2,3))
plotRGB(S18, axes=FALSE, stretch="lin", main="2018")
plot(veg18, col=cl, add=TRUE, legend=FALSE, axes=FALSE)
plotRGB(S19, axes=FALSE, stretch="lin", main="2019")
plot(veg19, col=cl, add=TRUE, legend=FALSE, axes=FALSE)
plotRGB(S20, axes=FALSE, stretch="lin", main="2020")
plot(veg20,col=cl, add=TRUE, legend=FALSE, axes=FALSE)
plotRGB(S21, axes=FALSE, stretch="lin", main="2021")
plot(veg21, col=cl, add=TRUE, legend=FALSE, axes=FALSE)
plotRGB(S22, axes=FALSE, stretch="lin", main="2022")
plot(veg22, col=cl, add=TRUE, legend=FALSE, axes=FALSE)
plotRGB(S23, axes=FALSE, stretch="lin", main="2023")  
plot(veg23, col=cl, add=TRUE, legend=FALSE, axes=FALSE)

# FALSE COMPOSITE
# False composite compared to vegetation, to see if there are similarity, since
# false composite is also used to evaluate agricultural regions
m<-c(0, 0, 0, 0)  ## To set the margin of the plot
par(mfrow=c(1,2))
im.plotRGB(S18,4,1,2)  ## NIR(4), R(1), G(2)
plot(veg18, legend=FALSE, axes=FALSE, col=cl, mar=m)
im.plotRGB(S20,4,1,2)
plot(veg20, legend=FALSE, axes=FALSE, col=cl, mar=m)
im.plotRGB(S22,4,1,2)
plot(veg22, legend=FALSE, axes=FALSE, col=cl, mar=m)

###  CLASSIFICATION FOR VEGETATION
# m <- c(0, 0.4, 0.6, 0.8, 1)  ## To set the intervals
# cll<-colorRampPalette(c("white","darkgoldenrod1","darkolivegreen1","darkgreen"))(4)
# cll2<-colorRampPalette(c("white","darkgoldenrod1","darkkhaki","darkolivegreen1","darkolivegreen3"))(5)
# par(mfrow=c(2,3))
# vegc18 <- classify(veg18, m) 
# plot(vegc18, col = cl, main = 'Vegetation 2018')
# vegc19 <- classify(veg19, m) 
# plot(vegc19, col = cl, main = 'Vegetation 2019')
# vegc20 <- classify(veg20, m) 
# plot(vegc20, col = cl, main = 'Vegetation 2020')
# vegc21 <- classify(veg21, m) 
# plot(vegc21, col = cl, main = 'Vegetation 2021')
# vegc22 <- classify(veg22, m) 
# plot(vegc22, col = cl, main = 'Vegetation 2022')
# vegc23 <- classify(veg23, m) 
# plot(vegc23, col = cl, main = 'Vegetation 2023')

# TREND OF VEGETATION
# I do the same thing as for NDVI to see the trend of vegetation through different years
par(mfrow=c(2,3))
h_1<-hist(veg18, main = "    2018     ", xlab = "", ylab= "", 
     col = "wheat", xlim = c(0.4, 1), ylim = c(0, 400000),  breaks = 6, xaxt = "n", axes=FALSE) 
axis(side=1, at = seq(0.4, 1, 0.1), labels = seq(0.4, 1, 0.1))
h_2<-hist(veg19, main = "    2019     ", xlab = "", ylab= "", 
     col = "wheat", xlim = c(0.4, 1), ylim = c(0, 400000),  breaks = 6, xaxt = "n", axes=FALSE) 
axis(side=1, at = seq(0.4, 1, 0.1), labels = seq(0.4, 1, 0.1))
h_3<-hist(veg20, main = "    2020      ", xlab = "", ylab= "", 
     col = "wheat", xlim = c(0.4, 1), ylim = c(0, 400000),  breaks = 6, xaxt = "n", axes=FALSE) 
axis(side=1, at = seq(0.4, 1, 0.1), labels = seq(0.4, 1, 0.1))
h_4<-hist(veg21, main = "    2021     ", xlab = "", ylab= "", 
     col = "wheat", xlim = c(0.4, 1), ylim = c(0, 400000),  breaks = 6, xaxt = "n", axes=FALSE) 
axis(side=1, at = seq(0.4, 1, 0.1), labels = seq(0.4, 1, 0.1))
h_5<-hist(veg22, main = "    2022     ", xlab = "", ylab= "", 
     col = "wheat", xlim = c(0.4, 1), ylim = c(0, 400000),  breaks =3, xaxt = "n", axes=FALSE) 
axis(side=1, at = seq(0.4, 1, 0.1), labels = seq(0.4, 1, 0.1))
h_6<-hist(veg23, main = "    2023     ", xlab = "", ylab= "", 
     col = "wheat", xlim = c(0.4, 1), ylim = c(0, 400000),  breaks = 6, xaxt = "n", axes=FALSE) 
axis(side=1, at = seq(0.4, 1, 0.1), labels = seq(0.4, 1, 0.1))

# This is the temporal variability analysis on the vegetation, to see if there are
# some patterns of variation with respect to the first year (2018)
stack2<-c(veg18, veg19, veg20, veg21, veg22, veg23)  # Create a vector with all values of vegetation
diff21=stack2[[2]]-stack2[[1]]
diff22=stack2[[3]]-stack2[[1]]
diff23=stack2[[4]]-stack2[[1]]
diff24=stack2[[5]]-stack2[[1]]
diff25=stack2[[6]]-stack2[[1]]
## Blue regions are those in which the variation in vegetation is positive
# par(mfrow=c(2,3))
plot(diff21,col=cl, range=c(-0.45,0.45), main="2019-2018", axes=FALSE)
plot(diff22,col=cl, range=c(-0.45,0.45), main="2020-2018", axes=FALSE)
plot(diff23,col=cl, range=c(-0.45,0.45), main="2021-2018", axes=FALSE)
plot(diff24,col=cl, range=c(-0.45,0.45), main="2022-2018", axes=FALSE)
plot(diff25,col=cl, range=c(-0.45,0.45), main="2023-2018", axes=FALSE)






## PCA AND VARIABILITY
# Measure the spatial variability of the region
m <- matrix(1/49,7,7)  ## Set the moving window with width of 7 pixels
cl<-colorRampPalette(viridis(7))(255)  ## This time it's not reversed

# Standard deviation on all years with the previous moving windows with respect to the NIR band
S18_sdm<-focal(S18_8, m, fun=sd)
# S19_sdm<-focal(S19_8, m, fun=sd)
S20_sdm<-focal(S20_8, m, fun=sd)
# S21_sdm<-focal(S21_8, m, fun=sd)
S22_sdm<-focal(S22_8, m, fun=sd)
# S23_sdm<-focal(S23_8, m, fun=sd)
# Plot of the standard deviation for 3 chosen years
par(mfrow=c(1,3))
plot(S18_sdm, col=cl, axis=NULL, range=c(0,0.003), axes=FALSE, main="2018")
plot(S20_sdm, col=cl, axis=NULL, range=c(0,0.003), axes=FALSE, main="2020")
plot(S22_sdm, col=cl, axis=NULL, range=c(0,0.003), axes=FALSE, main="2022")

## PCA
# Build of PCA for each year in order to better assess variability over a natural variable
S18pc<-im.pca2(S18); S18_pc1<-S18pc$PC1
S20pc<-im.pca2(S20); S20_pc1<-S20pc$PC1
S22pc<-im.pca2(S22); S22_pc1<-S22pc$PC1
# Plot of the first components for 3 selected years (2018-2020-2022)
par(mfrow=c(1,3))
plot(S18_pc1,col=cl, range=c(-0.3,0.6), axes=FALSE, main="2018")
plot(S20_pc1,col=cl, range=c(-0.3,0.6), axes=FALSE, main="2020")
plot(S22_pc1,col=cl, range=c(-0.3,0.6), axes=FALSE, main="2022")

# PCA variability
# I do the same thing for the variability with PCA1 instead of the NIR band
S18_pc1sdm<-focal(S18_pc1, m, fun=sd)
S20_pc1sdm<-focal(S20_pc1, m, fun=sd)
S22_pc1sdm<-focal(S22_pc1, m, fun=sd)
# Plot of the comparison with the NIR variability
par(mfrow=c(1,2))
plot(S18_pc1sdm, col=cl, range=c(0,0.003), axes=FALSE, main="PC1")
plot(S18_sdm, col=cl, axis=NULL, range=c(0,0.003), axes=FALSE, main="NIR")
par(mfrow=c(1,2))
plot(S20_pc1sdm, col=cl, range=c(0,0.003), axes=FALSE, main="PC1")
plot(S20_sdm, col=cl, axis=NULL, range=c(0,0.003), axes=FALSE, main="NIR")
par(mfrow=c(1,2))
plot(S22_pc1sdm, col=cl, range=c(0,0.003), axes=FALSE, main="PC1")
plot(S22_sdm, col=cl, axis=NULL, range=c(0,0.003), axes=FALSE, main="NIR")




## CLASSIFICATION
# I use the im.classify function to classify the regions into three clusters
# Then, compare the results with the real images and the vegetation regions
S18c <- im.classify(S18, seed=1, num_clusters=3, do_plot = FALSE)
S20c <- im.classify(S20, seed=1, num_clusters=3, do_plot = FALSE)
S22c <- im.classify(S22, seed=1, num_clusters=3, do_plot = FALSE)
mm=c(0,0.2,0,0)
par(mfrow=c(1,3))
plotRGB(S18, stretch="lin", main="Real Colors")
plot(S18c, main="Classification",col=cl, legend=FALSE, axes=FALSE, mar=mm)
plot(veg18, col="darkgreen", legend=FALSE, axes=FALSE, main="Vegetation", mar=mm)
par(mfrow=c(1,3))
plotRGB(S20, stretch="lin", main="Real Colors")
plot(S20c, main="Classification",col=cl, legend=FALSE, axes=FALSE, mar=mm)
plot(veg20, col="darkgreen", legend=FALSE, axes=FALSE, main="Vegetation", mar=mm)
par(mfrow=c(1,3))
plotRGB(S22, stretch="lin", main="Real Colors")
plot(S22c, main="Classification",col=cl, legend=FALSE, axes=FALSE, mar=mm)
plot(veg22, col="darkgreen", legend=FALSE, axes=FALSE, main="Vegetation", mar=mm)






# Since 2022 experienced a high variability in NDVI values in march, I thought
# it could be interesting to analyze the variability with respect 2021 for 6 selected months
# MONTHLY ANALYSIS 2022-2021
# from a to f --> 2022
# from g to n --> 2021
# The months are: Jan, March, May, July, Sept, Nov
# I do the same FOR cycle to assign variables
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

# I make vectors for each month with the four bands
Sa<-c(Sa_4,Sa_3,Sa_2,Sa_8); Sb<-c(Sb_4,Sb_3,Sb_2,Sb_8); Sc<-c(Sc_4,Sc_3,Sc_2,Sc_8)
Sd<-c(Sd_4,Sd_3,Sd_2,Sd_8); Se<-c(Se_4,Se_3,Se_2,Se_8); Sf<-c(Sf_4,Sf_3,Sf_2,Sf_8)
Sg<-c(Sg_4,Sg_3,Sg_2,Sg_8); Sh<-c(Sh_4,Sh_3,Sh_2,Sh_8); Si<-c(Si_4,Si_3,Si_2,Si_8)
Sl<-c(Sl_4,Sl_3,Sl_2,Sl_8); Sm<-c(Sm_4,Sm_3,Sm_2,Sm_8); Sn<-c(Sn_4,Sn_3,Sn_2,Sn_8)

# I plot the comparison among three months, just to see if there are major patterns  
par(mfrow=c(2,3))
plotRGB(Sa, stretch="lin", main="January 2022")
plotRGB(Sc, stretch="lin", main="May 2022")
plotRGB(Se, stretch="lin", main="September 2022")
plotRGB(Sg, stretch="lin", main="January 2021")
plotRGB(Si, stretch="lin", main="May 2021")
plotRGB(Sm, stretch="lin", main="September 2021")

# NDVI COMPARISON
# I make the NDVI and Vegetation values for each month
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

# I calculate the difference in vegetation among the two years
d1 <- vega-vegg; d2 <- vegb-vegh; d3 <- vegc-vegi
d4 <- vegd-vegl; d5 <- vege-vegm; d6 <-vegf-vegn

# Plot of the differences for each month
par(mfrow=c(2,3))
cl <- colorRampPalette(viridis(10, direction=-1))(255)  ## Reversed palette
# Blue regions --> vegetation growth
plot(d1, col=cl, main = "Jan", range=c(-0.4,0.4), axes=FALSE)
plot(d2, col=cl, main = "Mar", range=c(-0.4,0.4), axes=FALSE)
plot(d3, col=cl, main = "May", range=c(-0.4,0.4), axes=FALSE)
plot(d4, col=cl, main = "July", range=c(-0.4,0.4), axes=FALSE)
plot(d5, col=cl, main = "Sept", range=c(-0.4,0.4), axes=FALSE)
plot(d6, col=cl, main = "Nov", range=c(-0.4,0.4), axes=FALSE)

# TREND OF NDVI
# The same Histogram analysis, that considers the changes in quantity of vegetation
# It evaluates if the regions with positive differences are higher than those with negative
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
h_6<-hist(d6, main = "November", xlab = "", ylab= "Frequency", 
     col = "wheat", xlim = c(-0.5, 0.5),  breaks = 2, xaxt = "n") 
axis(side=1, at = seq(-1, 1, 1), labels = seq(-1, 1, 1))


























