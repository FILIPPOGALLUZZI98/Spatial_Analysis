##  Lavoriamo sui dati Sentinel
library(imageRy)
library(terra)

########################################################################################################
########################################################################################################
## NO2 over Europe during Covid

# Usiamo le immagini 'EN_xx', ovvero European Nitrogen (xx è il periodo)
jan<-im.import("EN_01.png")  ## It's a representation in RGB of NO2 over Europe in january
mar<-im.import("EN_13.png")  ## The same in march (last time-interval)
par(mfrow=c(2,1))
plot(jan); plot(mar)

# Usando le prime due bande delle due immagini
dev.off()
diff=jan[[1]]-mar[[1]]
diff
# In questo caso il gradiente di colore fa vedere in quale periodo si raggiunge il picco
cl <- colorRampPalette(c("blue","white","red"))(100)
plot(diff,col=cl) 
# Le parti rosse sono quelle in cui i valori sono alti in gennaio e quelle blu le zone in 
# cui i valori sono alti a marzo

########################################################################################################
########################################################################################################
##  Greenland

# Importiamo tutte le immagini delle temperature relative sulla Groenlandia per vari anni:
g2000<-im.import("greenland.2000.tif") 
g2005<-im.import("greenland.2005.tif")
g2010<-im.import("greenland.2010.tif")
g2015<-im.import("greenland.2015.tif")
stackg<-c(g2000,g2005,g2010,g2015) 

cl<-colorRampPalette(c("yellow","blue","white","red"))(100)
plot(stackg,col=cl) 
# Possiamo vedere dal confronto 2000 vs.2015 che le zone gialle (quelle più fredde) sono diminuite in estensione
# 2000/2005 si osserva una diminuzione di T molto elevata

# Fare differenza tra primo e ultimo elemento dello stack (tra 2000 e 2015)
diffg=stackg[[1]]-stackg[[4]]
cl2<-colorRampPalette(c("blue","white","red"))(100)
plot(diffg,col=cl2)
# In questa immagine si osserva la variazione di T tra il 2015 e il 2000

# Make an RGB plot using different years --> Per vedere come sono cambiate nel tempo le T
plotRGB(stackg,r=1,g=2,b=3)  ## In questo caso non sto plottando le bande ma le 
                             ## temperature degli anni differenti!!
# In base ai colori posso capire la differenza di T tra i vari periodi: nelle regioni scure le
# T più alte sono nel periodo finale e viceversa








