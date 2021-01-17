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
 

















































