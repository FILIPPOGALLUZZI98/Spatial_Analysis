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
