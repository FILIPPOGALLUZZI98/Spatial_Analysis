# KERNEL DENSITY ANALYSIS
# Usiamo i dati del Kerinci-Seblat National Park in Sumatra, Indonesia (Ridout and Linkie, 2009)
# I dati si trovano all'interno del pacchetto 'overlap' e mostrano i dati temporali registrati sulle
# immagini delle trappole fotografiche che forniscono informazioni sul periodo della giornata in cui 
# una specie è più attiva

library(overlap)
# All times are measured in radians. If the original data use 0-24 hours or 0-1 days, convert to radians
data()
# Si vede che all'interno di 'overlap' c'è il dataset 'kerinci'

summary(kerinci)  
# Le variabili del dataset sono: (Zone, Sps, Time)
# A sua volta si trova che le specie osservate sono: (macaque,tiger,muntjac,tapir,...)
kerinci  ## Si vede l'elenco di tutte le osservazioni delle specie con relativa zona e tempo 

# Per regolare il formato del tempo, aggiungiamo una nuova variabile 'kerinci$TimeRad' a partire
# dalla variabile 'kerinci$Time':
kerinci$TimeRad<-kerinci$Time*2*pi
kerinci
# Da qui si vede l'elenco di tutte le variabili, con l'aggiunta di 'TimeRad'

# Vogliamo selezionare una specie (tigre)
tiger <- kerinci[kerinci$Sps=="tiger",]
tiger  ## Vediamo tutti i tempi e le zone in cui è stata osservata
# Per selezionare i tempi, e quindi fare una densità delle osservazioni nel tempo
timetig<-tiger$TimeRad
# A questo punto possiamo fare una mappa di densità (nel tempo)
densityPlot(timetig, rug=TRUE)
# Ed osserviamo quindi l'andamento nel tempo delle osservazioni

# Possiamo fare lo stesso anche per le altre specie, per esempio il 'tapir'
tapir<-kerinci[kerinci$Sps=="tapir",]
timetap<-tapir$TimeRad
densityPlot(timetap,rug=TRUE)

# A questo punto possiamo sovrapporre i grafici di tigre e tapiro e vedere se esiste una relazione
overlapPlot(timetig,timetap,linecol = c("black", "red"), olapcol = "yellow")
legend('topright',c("Tigers","Tapir"),lty=C(2,1),col=c("black","red"),bty='n')








