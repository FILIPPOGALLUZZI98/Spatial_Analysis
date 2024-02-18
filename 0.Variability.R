## VARIABILITY
S18_sd3<-focal(S18, matrix(1/9,3,3), fun=sd)
S20_sd3<-focal(S20_8, matrix(1/9,3,3), fun=sd)
S23_sd3<-focal(S23_8, matrix(1/9,3,3), fun=sd)
par(mfrow=c(2,2))
cl<-colorRampPalette(viridis(7))(100)
plot(S18_sd3, col=cl)
plot(S20_sd3, col=cl)
plot(S23_sd3, col=cl)




## PCA
S18pc<-im.pca2(S18) 
S18_pc1<-S18pc$PC1
S20pc<-im.pca2(S20) 
S20_pc1<-S20pc$PC1
S23pc<-im.pca2(S23) 
S23_pc1<-S23pc$PC1

par(mfrow=c(2,2))
plot(S18_pc1,col=cl, range=c(-0.3,0.6))
plot(S20_pc1,col=cl, range=c(-0.3,0.6))
plot(S23_pc1,col=cl, range=c(-0.3,0.6))

dev.off()
S18_pc1sd3<-focal(S18_pc1, matrix(1/9, 3, 3), fun=sd)
S20_pc1sd3<-focal(S20_pc1, matrix(1/9, 3, 3), fun=sd)
S23_pc1sd3<-focal(S23_pc1, matrix(1/9, 3, 3), fun=sd)
par(mfrow=c(2,2))
plot(S18_pc1sd3, col=cl, range=c(0,0.02))
plot(S23_pc1sd3, col=cl, range=c(0,0.02))
plot(S20_pc1sd3, col=cl, range=c(0,0.02))















