## R code for Multivariate Analysis

install.packages("vegan")
library(vegan)

setwd("/Users/Chloelee/Desktop/R_Lab")

## Load the pertinant data needed 
load("biomes_multivar.RData")
ls()                              ## This lists the files 

##Lest look at the Biomes file 
head(biomes)

#DEtrended CORrespondence ANAlysis 
## Going to view how the spp are related to each other
         # higher the distance, less likely to be found in same plot space.... Don't like each other!

multivar <- decorana(biomes)         # name the analysis of "biomes" to store all the analysis 
multivar

#                  DCA1   DCA2    DCA3    DCA4
#Eigenvalues     0.5117 0.3036 0.12125 0.14267
#Decorana values 0.5360 0.2869 0.08136 0.04814
#Axis lengths    3.7004 3.1166 1.30055 1.47888

plot(multivar)

head(biomes_types)    ## with this table we can circle plots of biome types 

### put the biomes names in the graph 
attach(biomes_types)
ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3)

## To save the image 

pdf("multivar.pdf")
plot(multivar)
ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3)
ordispider(multivar, type, col=c("black","red","green","blue"), label = T)
dev.off()














































