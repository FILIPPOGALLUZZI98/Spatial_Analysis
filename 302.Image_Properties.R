
# Spatial subset of a Landsat 8 scene collected on June 14, 2017. The subset covers the area between
# Concord and Stockton, in California, USA
# The product identifier of the data we will use is ‘LC08_044034_20170614’

# Per scaricare i dati che userò
dir.create("data", showWarnings = FALSE)
if (!file.exists("data/rs/samples.rds")) {
    download.file("https://biogeo.ucdavis.edu/data/rspatial/rs.zip", dest = "data/rs.zip")
    unzip("data/rs.zip", exdir="data")
}

# Posso quindi creare uno SpatRaster a partire da questi
b2 <- rast('data/rs/LC08_044034_20170614_B2.tif')  ## Blue
b3 <- rast('data/rs/LC08_044034_20170614_B3.tif')  ## Green
b4 <- rast('data/rs/LC08_044034_20170614_B4.tif')  ## Red
b5 <- rast('data/rs/LC08_044034_20170614_B5.tif')  ## NIR
