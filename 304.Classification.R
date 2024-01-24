# UNSUPERVISED CLASSIFICATION

# In unsupervised classification, we use the reflectance data, but we don’t supply any  response data (that is, we
# do not identify any pixel as belonging to a particular class). This may seem odd, but it can be useful when we don’t
# have much prior knowledge of a study area. Or if you have broad knowledge of the distribution of land cover classes of
# interest, but no specific ground data. The algorithm groups pixels with similar spectral characteristics into groups. 

# Supponiamo di avere un'immagine satellitare e voglio capire quali zone sono coltivate, quali acqua
# quali vegetazione etc.
# Costruisco un grafico con assi X=RED e y=NIR; poi proietto ogni pixel dell'immagine originale nel 
# nuovo grafico, in base ai valori di riflessione del pixel stesso. Ottengo quindi dei gruppi nel nuovo 
# grafico, in base a come i pixel riflettono NIR e RED. Per esempio, la vegetazione riflette più NIR che RED,
# quindi le regioni dove è presente la vegetazione saranno proiettate verso valori bassi di RED ed alti di NIR.
# A questo punto, per capire nell'immagine originale quali zone sono vegetazione, acqua, coltivazioni prendo ogni
# pixel dell'immagine originale, calcolo la distanza tra questo pixel e i vari cluster e, in base a quale cluster
# è piu vicino, lo assegno al cluster specifico. Per esempio posso classificare tre tipi di cluster ed assegnargli 
# tre colori diversi: l'immagine originale sarà colorata con questi tre colori in base alla classificazione fatta.

# La funzione su 'imageRy' si chiama 'im.classify(nome_immagine, num_clusters=?)'
# The algorithm divides the pixels in clusters based on their similarities creating the number 
# of classes specified by the user.
# Quindi, usando questa funzione, posso vedere l'immagine satellitare con i colori alterati, in base
# al numero di classi specificate e posso vedere quali zone sono coltivate, vegetazione, acqua, ...


library(terra)
library(imageRy)
library(ggplot2)
library(patchwork)

m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")
m1992c <- im.classify(m1992, num_clusters=2)  ## Assegno quanti cluster voglio considerare
m2006c <- im.classify(m2006, num_clusters=2)
# Le classi sono: agricultural areas=2 e forest=1
par(mfrow=c(1,2))
plot(m1992c); plot(m2006c)

# Voglio costruire la frequency table dei valori dello SpatRaster che conta quanti pixel sono nei vari cluster
freq2006 <- freq(m2006c); freq2006
freq1992 <- freq(m1992c); freq1992

# A questo punto, per calcolare le percentuali dei due cluster:
tot1992 = ncell(m1992)  ## 'ncell' restituisce il numero di celle dell'immagine 
perc1992 = freq1992 * 100 / tot1992; perc1992
# 83% cluster 1 --> forest; 17% cluster 2 --> agricultural
tot2006 = ncell(m2006)
perc2006 = freq2006 * 100 / tot2006; perc2006
# 55% cluster 1; 45% cluster 2

# Faccio la tabella finale con le varie percentuali
class <- c("forest", "human") 
y1992 <- c(83.08, 16.91)
y2006 <- c(45.31, 54.69)
tab <- data.frame(class, y1992, y2006); tab

# Tabella finale
p1 <- ggplot(tab, aes(x=class, y=y1992, color=class)) + geom_bar(stat="identity", fill="white")
p2 <- ggplot(tab, aes(x=class, y=y2006, color=class)) + geom_bar(stat="identity", fill="white")
p1+p2

#####################################################################################
#####################################################################################
# UNSUPERVISED CLASSIFICATION (K-Means)
# Il seguente è un algoritmo per il caso dell'NDVI

ndvi <- (b5-b4)/(b4+b5)  ## b4 e b5 sono RED e NIR rispettivamente
nr <- as.data.frame(ndvi, cell=TRUE)
str(nr)
set.seed(99)
kmncluster <- kmeans(nr[,-1], centers=10, iter.max = 500, nstart = 5, algorithm="Lloyd")
# Create 10 clusters, allow 500 iterations, start with 5 random sets using "Lloyd" method.
knr <- rast(ndvi, nlyr=1)
knr[nr$cell] <- kmncluster$cluster
knr
par(mfrow = c(1,2))
plot(ndvi, col = rev(terrain.colors(10)), main = "Landsat-NDVI")
plot(knr, main = 'Unsupervised classification', type="classes")


# Provando ad usare questo procedimento su 'matogrosso', con due classi, restituisce lo stesso risultato 
# del caso precedente, cioè usando la funzione di imageRy

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








