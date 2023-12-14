
#######################################################################################################
#######################################################################################################
##  BASIC EXAMPLE
#  Location (longitude and latitude) of 10 weather stations (A to J) and their annual precipitation.
name <- LETTERS[1:10]  ## Per fare un vettore di lettere da A a J
longitude <- c(-116.7, -120.4, -116.7, -113.5, -115.5,
               -120.8, -119.5, -113.7, -113.7, -110.7)
latitude <- c(45.3, 42.6, 38.9, 42.1, 35.7, 38.9,
              36.2, 39, 41.6, 36.9)
stations <- cbind(longitude, latitude)  ## Unisco i due vettori e formo un dataframe
# To simulate rainfall data
set.seed(0)  ## Per fare in modo che ad ogni run non vengano cambiati i numeri generati
# Vettore di lunghezza 10 (latitude points) contenente numeri random (0-1000) arrotondati
precip <- round((runif(length(latitude))*10)^3)  
# Plot that shows the location of the weather stations, and the size of the dots is proportional
# to the amount of precipitation
psize <- 1 + precip/500  ## In questo modo ottengo un vettore con la grandezza dei punti
plot(stations, cex=psize, pch=20, col='red', main='Precipitation')  ## Imposto cex=psize
# Add names to plot
text(stations, name, pos=4)
# add a legend
leg <- c(100, 250, 500, 1000)
legend.psize <- 1+leg/500
legend("topright", legend=leg, pch=20, pt.cex=legend.psize, col='red', bg='gray')



