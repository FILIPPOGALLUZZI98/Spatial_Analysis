# DETRENDED CORRESPONDENCE ANALYSIS AND BASIC RECIPROCAL AVERAGING
# Useremo il dataset 'dune'

library(vegan)
# Interno a 'vegan' c'è il dataset 'dune' 
?dune
##  Vegetation and Environment in Dutch Dune Meadows. The dune meadow vegetation data, dune,has
##  cover class values of 30 species on 20 sites. The species names are abbreviated to 4+4 letters
# Per usarlo
data(dune); dune

# Facciamo la detrended correspondence analysis and basic reciprocal averaging (or orthogonal correspondence analysis)
ord<-decorana(dune)

# Ciò che stiamo cercando è la lunghezza degli assi
ord
# Possiamo leggere axis lenghts delle 4 coordinate
# Assegnamo la lunghezza a 4 variabili
ldc1<-3.7004; ldc2<-3.1166; ldc3<-1.30055; ldc4<-1.47888
# Per calcolare la percentuale
total=ldc1+ldc2+ldc3+ldc4
pldc1=ldc1*100/total
pldc2=ldc2*100/total
pldc3=ldc3*100/total
pldc4=ldc4*100/total

# Dato che ldc1 e ldc2 hanno il 71 percento della explained variability possiamo plottare solo quelle
plot(ord)
# mostra soltanto i primi due assi ed i nomi delle specie








