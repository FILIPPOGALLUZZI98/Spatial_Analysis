# We will be working with temperature data for California, USA. 
# We need 'remotes' and 'rspat' package
if (!require("rspat")) remotes::install_github('rspatial/rspat')

library(rspat)
d <- spat_data('precipitation')
head(d)
mnts <- toupper(month.abb)
d$prec <- rowSums(d[, mnts])
plot(sort(d$prec), ylab="Annual precipitation (mm)", las=1, xlab="Stations")
dsp <- vect(d, c("LONG", "LAT"), crs="+proj=longlat +datum=NAD83")
CA <- spat_data("counties")
# define groups for mapping
cuts <- c(0,200,300,500,1000,3000)
# set up a palette of interpolated colors
blues <- colorRampPalette(c('yellow', 'orange', 'blue', 'dark blue'))
plot(CA, col="light gray", lwd=4, border="dark gray")
plot(dsp, "prec", type="interval", col=blues(10), legend=TRUE, cex=2,
    breaks=cuts, add=TRUE, plg=list(x=-117.27, y=41.54))
lines(CA)










