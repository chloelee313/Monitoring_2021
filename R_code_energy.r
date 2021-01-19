# R_code_energy.r

#R code to view biomass over the world and calculate changes in ecosystem functions 
  # energy, chemical cycling, porxies

library(rasterdiv)
library(raster)

#lets load the data and plot it 

data(copNDVI)
plot(copNDVI)

# to remove the blue part of the plot we reanalyze 
## overwrite previous file with the same name 

copNDVI <- reclassify(copNDVI, cbind(253:255, NA))

plot(copNDVI)

## Lets level the plot by averaging the values and plotting them 

library(rasterVis)

levelplot(copNDVI)

## This map tells us lots of things 
# mean value for each row of pixels 

## NOW we can zoom into a certain part of the planet!


#First lets change the color ramp pallete 

clymin <- colorRampPalette(c('yellow','red','blue'))(100) #
plot(copNDVI, col=clymin)

# Can switch the colors around to put the color yellow in the medium part 

clymed <- colorRampPalette(c('red','yellow','blue'))(100) # 
plot(copNDVI, col=clymed)

#This is how we can lie with maps! Because our eyes are drawn to yellow but in this case the blue is at maximum value 
# but we dont see the blue first 

## LET TELL THE TRUTH WITH MAP and put yellow as the maximum values 

clymax <- colorRampPalette(c('red','blue','yellow'))(100) #
plot(copNDVI, col=clymax)

# this looks a bit odd because blue is now in the medium values 
# Okay lets now put blue as min, red as med, and yellow as max 

clymax <- colorRampPalette(c('blue','red','yellow'))(100) #
plot(copNDVI, col=clymax)

## LEts compare and contrast them!

par(mfrow=c(1,2))
clymed <- colorRampPalette(c('red','yellow','blue'))(100) #
plot(copNDVI, col=clymed)
clymax <- colorRampPalette(c('blue','red','yellow'))(100) #
plot(copNDVI, col=clymax)

## Best map is on the right 

### NOW.... LETS ZOOM ONTO A CERTAIN PART OF THE MAP 
## we can crop it by putting in the lat and lon we want 

#crop the stack to the extenct of italy 

ext <- c(0,20,35,55)  # xmin xmax ymin ymax

#then crop the NDVI, name it and plot it with the correct col combo (col = clyax)

copNDVI_Italy <- crop(copNDVI, ext)
plot(copNDVI_Italy, col=clymax)
 

## Deforestation Example 

library(raster)
library(RStoolbox)

### make sure to set the working directory if you have closed R

setwd("/Users/Chloelee/Desktop/R_Lab")

# Lets download the images/data and name them  
# if you only have one layer use raster()
# if you have mulitple layer like now you ue brick()

defor1 <- brick("defor1_.jpg")

defor2 <- brick("defor2_.jpg")

# look how the data is structured 

defor1
defor2  

## This data set is 8 bit meaning 2^8 different colors per each band! (256)
# color values ranging from 0-255 

## Now plot the image to see in the past (defor1)
# plotRGB funciton 

plotRGB(defor1, r=1, g=2, b=3, stretch= "Lin" )

## how RGB works 
## First band is Nearinfrared, second band is red, 3rd band is green 
## Then you put every band in a certain component
## then use a stretch for the different colors 

## Now try to change the colors 

## Then plot the second image to look at it 

plotRGB(defor2, r=1, g=2, b=3, stretch= "Lin" )

#Now lets look at them together! By putting in rows and columns 

par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")

### Some information for next excersise
# NIR is mostly reflected so value may range to 250
# Red is moslty absorbed so maybe the value will be 10 

## DVI you can NIR - RED values 
## 250-10 = 240 
## If the amount of vegetation is lower, the value for DIR will decrease and the RED will increase 
# SO.... DVI number will also decrease 



# Lets DVI the first image 
# Need to see the names of the NIR and REd band 

defor1

# name for NIR is defor1_.1 
# for the RED is defor1_.2

# then for every single pixel we need to take the image, link the band with $ and then subract 
# the red band linked by $ with the name 

dvi1 <- defor1$defor1_.1 - defor1$defor1_.2
plot(dvi1)

#Change the colorRapme Pallete 

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi1, col=cl)

# Now calculate DVI for second image 

dvi2 <- defor2$defor2_.1 - defor2$defor2_.2
plot(dvi2, col=cl)

#NOW lets look at them together!

par(mfrow=c(2,1))
plot(dvi1, col=cl)
plot(dvi2, col=cl)

#Lets label the images 

par(mfrow=c(2,1))
plot(dvi1, col=cl, main="DVI before cut")
plot(dvi2, col=cl, main="DVI after cut")

# NOw lets look at the DVI difference between imagaes (before and after cut)

difdvi <- dvi1 -dvi2

#plot it 
    
cldif <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi, col=cldif)

#label the plot 

plot(difdvi, col=cldif, main="amount of energy lost!")

## Lets check out the histogram of energy lost!

hist(difdvi, col="red")

## Now lets look at all the plots together!

par(mfrow=c(3,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")
plot(dvi1, col=cl, main="biomass before cut")
plot(dvi2, col=cl, main="biomass after cut")
plot(difdvi, col=cldif, main="amount of energy lost!")

#Lets add the histogram 

par(mfrow=c(3,3))
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")
plot(dvi1, col=cl, main="biomass before cut")
plot(dvi2, col=cl, main="biomass after cut")
plot(difdvi, col=cldif, main="amount of energy lost!")
hist(difdvi, col="red")























