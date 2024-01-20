# UNSUPERVISED CLASSIFICATION

# In unsupervised classification, we use the reflectance data, but we don’t supply any
# response data (that is, we do not identify any pixel as belonging to a particular class).
# This may seem odd, but it can be useful when we don’t have much prior knowledge of a study area. 
# Or if you have broad knowledge of the distribution of land cover classes of interest, but no 
# specific ground data. The algorithm groups pixels with similar spectral characteristics into 
# groups. We will perform unsupervised classification on a spatial subset of the ndvi layer.
ndvi <- (b5-b4)/(b4+b5)
nr <- as.data.frame(ndvi, cell=TRUE)
str(nr)
set.seed(99)
kmncluster <- kmeans(nr[,-1], centers=10, iter.max = 500, nstart = 5, algorithm="Lloyd")
knr <- rast(ndvi, nlyr=1)
knr[nr$cell] <- kmncluster$cluster
knr
par(mfrow = c(1,2))
plot(ndvi, col = rev(terrain.colors(10)), main = "Landsat-NDVI")
plot(knr, main = 'Unsupervised classification', type="classes")

#####################################################################################
#####################################################################################
# SUPERVISED CLASSIFICATION

# In supervised classification, we have prior knowledge about some of the land-cover types through,
# for example, fieldwork, reference spatial data or interpretation of high resolution imagery (such
# as available on Google maps). Specific sites in the study area that represent homogeneous examples of
# these known land-cover types are identified. These areas are commonly referred to as training sites 
# because the spectral properties of these sites are used to train the classification algorithm.

# PER CONTINUARE
# https://rspatial.org/rs/5-supclassification.html








