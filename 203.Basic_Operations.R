# NDVI

# Gli indici 'k' e 'i' rappresentano i layer oer calcolare l'NDVI:
# In questto caso NIR=5; RED=4
ndvi<- (b5 - b4) / (b5 + b4)
plot(ndvi, col=rev(terrain.colors(10)), main = "NDVI")

# HISTOGRAM
# We can explore the distribution of values contained within our raster using hist to produces a histogram.
# Histograms are often useful in identifying outliers and bad data values in our raster data. 
hist(ndvi, main = "NDVI values", xlab = "NDVI", ylab= "Frequency", 
     col = "wheat", xlim = c(-0.5, 1),  breaks = 30, xaxt = "n") 
axis(side=1, at = seq(-0.6, 1, 0.2), labels = seq(-0.6, 1, 0.2))

# Cells with NDVI values greater than 0.4 are definitely vegetation. The following operation masks all
# cells that are perhaps not vegetation (NDVI < 0.4). 
veg <- clamp(ndvi, 0.4, values=FALSE) 
plot(veg, main='Vegetation')
# Let’s map the area that corresponds to the peak between 0.25 and 0.3 in the NDVI histogram. 
m <- c(-Inf, 0.25, NA,  0.25, 0.3, 1,  0.3, Inf, NA) 
rcl <- matrix(m, ncol = 3, byrow = TRUE) 
land <- classify(ndvi, rcl) 
plot(land)

# Se vogliamo sovrapporlo all'immagine
plotRGB(s, r=1, g=2, b=3, axes=TRUE, stretch="lin")
plot(land, add=TRUE, legend=FALSE)

# You can also create classes for different intensity of vegetation. 
m <- c(-1,0.25, 0.3, 0.4, 0.5, 1) 
vegc <- classify(ndvi, m) 
plot(vegc, col = rev(terrain.colors(4)), main = 'NDVI based thresholding')

######################################################################################
######################################################################################
# Principal Component Analysis

# Multi-spectral data are sometimes transformed to helps to reduce the dimensionality and noise in the data. 
# The PCs transform is a generic data reduction method that can be used to create a few uncorrelated bands from
# a larger set of correlated bands. You can calculate the same number of principal components as the number of input
# bands. The first principal component (PC) explains the largest percentage of variance and other PCs explain 
# additional the variance in decreasing order.
set.seed(1) 
sr <- spatSample(s, 10000)
# sr è una matrice di scatterplots
sr
# Per esempio, se vogliamo selezionare NIR-RED
plot(sr[,c(4,1)])

pca <- prcomp(sr, scale = TRUE)
pca
# We use a function to restrict prediction to the first two principal components
pca_predict2 <- function(model, data, ...) {
  predict(model, data, ...)[,1:2]
}
pci <- predict(s, pca, fun=pca_predict2)
plot(pci)














