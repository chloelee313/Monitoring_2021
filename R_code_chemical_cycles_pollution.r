## R code for chemical cycling and pollution 
# the figures are measuring NO2

#Properly set working directory 

library(raster)

setwd("/Users/Chloelee/Desktop/R_Lab)

##Lets impprt the data 

EN01 <- raster("En_0001.png")
EN02 <- raster("EN_0002.png")
EN03 <- raster("EN_0003.png")
EN04 <- raster("EN_0004.png")
EN05 <- raster("EN_0005.png")
EN06 <- raster("EN_0006.png")
EN07 <- raster("EN_0007.png")
EN08 <- raster("EN_0008.png")
EN09 <- raster("EN_0009.png")
EN10 <- raster("EN_0010.png")
EN11 <- raster("EN_0011.png")
EN12 <- raster("EN_0012.png")
EN13 <- raster("EN_0013.png")

# Lets make a color ramp pallete for plotting
## Keep in mind that yellow should be at the max values 

cl <- colorRampPalette(c('red','orange','yellow'))(100) #

# Lets plot a multifram with the first image of january on the left, and the image of March on the right 
# EN01 is January EN13 is March 

par(mfrow = c(1,2))
plot(EN01, col=cl)
plot(EN13, col-cl)

## Now we can look at the difference between NO2 of each pixel from January and March 

difno2 <- EN01 - EN13
cldif <- colorRampPalette(c('blue','black','yellow'))(100)
plot(difno2, col=cldif)

## PLOT ALL THE DATA 
#can be video like 

plot(EN01, col=cl)
plot(EN02, col=cl)
plot(EN03, col=cl)
plot(EN04, col=cl)
plot(EN05, col=cl)
plot(EN06, col=cl)
plot(EN07, col=cl)
plot(EN08, col=cl)
plot(EN09, col=cl)
plot(EN10, col=cl)
plot(EN11, col=cl)
plot(EN12, col=cl)
plot(EN13, col=cl)

## Lets put them all in a multifram 

par(mfrow = c(4,4))
plot(EN01, col=cl)
plot(EN02, col=cl)
plot(EN03, col=cl)
plot(EN04, col=cl)
plot(EN05, col=cl)
plot(EN06, col=cl)
plot(EN07, col=cl)
plot(EN08, col=cl)
plot(EN09, col=cl)
plot(EN10, col=cl)
plot(EN11, col=cl)
plot(EN12, col=cl)
plot(EN13, col=cl)

## Lets make a stack 
# this will stack all the pixels of the 13 different images with one name!
# Once you have a stack, you can stop using par(mfrow = c())

EN <- stack(EN01,EN02,EN03,EN04,EN05,EN06,EN07,EN08,EN09,EN10,EN11,EN12,EN13)

plot(EN, col=cl)

# plotRGB()
## Can put different images for red blue and green 
## use the stack and then for each componentof red, gree, and blue put in EN01, EN07, and EN13

plotRGB(EN, red=EN13, green=EN07, blue=EN01, stretch="lin")

## Lets make a box plot
# making a plot of all the 13 images but want it horizontal 

boxplot(EN,horizontal=T,axes=T,outline=F)

#You can also label the axes 

boxplot(EN,horizontal=T,axes=T,outline=F, col="red",xlab="NO2 - 8bit", ylab="Period")



















































