## VARIABILITY
m <- matrix(1/49,7,7)
cl<-colorRampPalette(viridis(7))(255)

S18_sdm<-focal(S18_8, m, fun=sd)
S19_sdm<-focal(S19_8, m, fun=sd)
S20_sdm<-focal(S20_8, m, fun=sd)
S21_sdm<-focal(S21_8, m, fun=sd)
S22_sdm<-focal(S22_8, m, fun=sd)
S23_sdm<-focal(S23_8, m, fun=sd)
par(mfrow=c(2,3))
plot(S18_sdm, col=cl, axis=NULL)
plot(S19_sdm, col=cl, axis=NULL)
plot(S20_sdm, col=cl, axis=NULL)
plot(S21_sdm, col=cl, axis=NULL)
plot(S22_sdm, col=cl, axis=NULL)
plot(S23_sdm, col=cl, axis=NULL)

## PCA
S18pc<-im.pca2(S18) 
S18_pc1<-S18pc$PC1
S19pc<-im.pca2(S19) 
S19_pc1<-S19pc$PC1
S20pc<-im.pca2(S20) 
S20_pc1<-S20pc$PC1
S21pc<-im.pca2(S21) 
S21_pc1<-S21pc$PC1
S22pc<-im.pca2(S22) 
S22_pc1<-S22pc$PC1
S23pc<-im.pca2(S23) 
S23_pc1<-S23pc$PC1
par(mfrow=c(2,3))
plot(S18_pc1,col=cl, range=c(-0.3,0.6), axis=NULL)
plot(S19_pc1,col=cl, range=c(-0.3,0.6), axis=NULL)
plot(S20_pc1,col=cl, range=c(-0.3,0.6), axis=NULL)
plot(S21_pc1,col=cl, range=c(-0.3,0.6), axis=NULL)
plot(S22_pc1,col=cl, range=c(-0.3,0.6), axis=NULL)
plot(S23_pc1,col=cl, range=c(-0.3,0.6), axis=NULL)

# PCA variability
S18_pc1sdm<-focal(S18_pc1, m, fun=sd)
S19_pc1sdm<-focal(S18_pc1, m, fun=sd)
S20_pc1sdm<-focal(S20_pc1, m, fun=sd)
S21_pc1sdm<-focal(S20_pc1, m, fun=sd)
S22_pc1sdm<-focal(S20_pc1, m, fun=sd)
S23_pc1sdm<-focal(S23_pc1, m, fun=sd)
par(mfrow=c(2,3))
plot(S18_pc1sdm, col=cl, range=c(0,0.005), axis=NULL)
plot(S19_pc1sdm, col=cl, range=c(0,0.005), axis=NULL)
plot(S20_pc1sdm, col=cl, range=c(0,0.005), axis=NULL)
plot(S21_pc1sdm, col=cl, range=c(0,0.005), axis=NULL)
plot(S22_pc1sdm, col=cl, range=c(0,0.005), axis=NULL)
plot(S23_pc1sdm, col=cl, range=c(0,0.005), axis=NULL)















