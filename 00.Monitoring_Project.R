## NDMI
ndmi18<-(S18_8-S18_11)/(S18_8+S18_11)
ndmi19<-(S19_8-S19_11)/(S19_8+S19_11)
ndmi20<-(S20_8-S20_11)/(S20_8+S20_11)
ndmi21<-(S21_8-S21_11)/(S21_8+S21_11)
ndmi22<-(S22_8-S22_11)/(S22_8+S22_11)
ndmi23<-(S23_8-S23_11)/(S23_8+S23_11)
par(mfrow=c(2,3))
plot(ndmi18, col=rev(topo.colors(5)), main = "NDMI 2018")
plot(ndmi19, col=rev(topo.colors(5)), main = "NDMI 2019")
plot(ndmi20, col=rev(topo.colors(5)), main = "NDMI 2020")
plot(ndmi21, col=rev(topo.colors(5)), main = "NDMI 2021")
plot(ndmi22, col=rev(topo.colors(5)), main = "NDMI 2022")
plot(ndmi23, col=rev(topo.colors(5)), main = "NDMI 2023")

## HISTOGRAMS
par(mfrow=c(2,3))
h18<-hist(ndmi18, main = "2018 NDMI values", xlab = "NDMI", ylab= "Frequency", 
     col = "wheat", xlim = c(-1, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(-1, 1, 0.1), labels = seq(-1, 1, 0.1))
h19<-hist(ndmi19, main = "2019 NDMI values", xlab = "NDMI", ylab= "Frequency", 
     col = "wheat", xlim = c(-1, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(-1, 1, 0.1), labels = seq(-1, 1, 0.1))
h20<-hist(ndmi20, main = "2020 NDMI values", xlab = "NDMI", ylab= "Frequency", 
     col = "wheat", xlim = c(-1, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(-1, 1, 0.1), labels = seq(-1, 1, 0.1))
h21<-hist(ndmi21, main = "2021 NDMI values", xlab = "NDMI", ylab= "Frequency", 
     col = "wheat", xlim = c(-1, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(-1, 1, 0.1), labels = seq(-1, 1, 0.1))
h22<-hist(ndmi22, main = "2022 NDMI values", xlab = "NDMI", ylab= "Frequency", 
     col = "wheat", xlim = c(-1, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(-1, 1, 0.1), labels = seq(-1, 1, 0.1))
h23<-hist(ndmi23, main = "2023 NDMI values", xlab = "NDMI", ylab= "Frequency", 
     col = "wheat", xlim = c(-1, 1),  breaks = 50, xaxt = "n") 
axis(side=1, at = seq(-1, 1, 0.1), labels = seq(-1, 1, 0.1))

## MOISTURE
moist18 <- clamp(ndmi18, 0.4, values=FALSE) 
moist19 <- clamp(ndmi19, 0.4, values=FALSE) 
moist20 <- clamp(ndmi20, 0.4, values=FALSE) 
moist21 <- clamp(ndmi21, 0.4, values=FALSE) 
moist22 <- clamp(ndmi22, 0.4, values=FALSE) 
moist23 <- clamp(ndmi23, 0.4, values=FALSE) 
par(mfrow=c(2,3))
# MOISTURE OVERLAPS
par(mfrow=c(2,3))
plotRGB(S18, axes=TRUE, stretch="lin")
plot(moist18, col=rev(topo.colors(5)), add=TRUE, legend=TRUE)
plotRGB(S19, axes=TRUE, stretch="lin")
plot(moist19, col=rev(topo.colors(5)), add=TRUE, legend=TRUE)
plotRGB(S20, axes=TRUE, stretch="lin")
plot(moist20, col=rev(topo.colors(5)), add=TRUE, legend=TRUE)
plotRGB(S21, axes=TRUE, stretch="lin")
plot(moist21, col=rev(topo.colors(5)), add=TRUE, legend=TRUE)
plotRGB(S22, axes=TRUE, stretch="lin")
plot(moist22, col=rev(topo.colors(5)), add=TRUE, legend=TRUE)
plotRGB(S23, axes=TRUE, stretch="lin")
plot(moist23, col=rev(topo.colors(5)), add=TRUE, legend=TRUE)






## CLASSIFICATION
cl<-colorRampPalette(c("coral","white","darkgreen"))(100)
S18c <- im.classify(S18, seed=1, num_clusters=3, do_plot = FALSE)
par(mfrow=c(1,2))
plotRGB(S18, stretch="lin", main="April 2018")
plot(S18c, main="Classification 2018",col=cl, legend=FALSE)
par(mfrow=c(1,2))
S19c <- im.classify(S19, seed=1, num_clusters=3, do_plot = FALSE)
plotRGB(S19, stretch="lin", main="April 2019")
plot(S19c, main="Classification 2019",col=cl, legend=FALSE)
par(mfrow=c(1,2))
S20c <- im.classify(S20, seed=1, num_clusters=3, do_plot = FALSE)
plotRGB(S20, stretch="lin", main="April 2020")
plot(S20c, main="Classification 2020",col=cl, legend=FALSE)
par(mfrow=c(1,2))
S21c <- im.classify(S21, seed=1, num_clusters=3, do_plot = FALSE)
plotRGB(S21, stretch="lin", main="April 2021")
plot(S21c, main="Classification 2021",col=cl, legend=FALSE)
par(mfrow=c(1,2))
S22c <- im.classify(S22, seed=1, num_clusters=3, do_plot = FALSE)
plotRGB(S22, stretch="lin", main="April 2022")
plot(S22c, main="Classification 2022",col=cl, legend=FALSE)
par(mfrow=c(1,2))
S23c <- im.classify(S23, seed=1, num_clusters=3, do_plot = FALSE)
plotRGB(S23, stretch="lin", main="April 2023")
plot(S23c, main="Classification 2023",col=cl, legend=FALSE)


## CONFRONTO CON VEGETATION
par(mfrow=c(1,2))
plot(S18c, main="Classification 2018",col=cl, legend=FALSE)
plot(ndvi18)



