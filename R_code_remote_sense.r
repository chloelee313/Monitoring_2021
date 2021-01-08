## R code for Remote Sensing data Analysis in Ecosystem Monitoring 

library(raster)
library(RStoolbox)

   #as usual set the working directory 

setwd("/Users/ChoeLee/Desktop/RLab")

##To upload all the bands of colors (all the data)
# use function brick 

## in the uploaded file there are 2 different images with mulitple files 
  # 1988 and 2011 images 
  
### brick() uploads all the data for a picture!

p224r63_2011 <- brick("p224r63_2011_masked.grd")

### p is path and r is row (so basically a plot that makes up an area of land somewhere in the Amazon


## then just input the image name to look at demensions, info etc

c

# B1 is blue ; B2 is green ; B3 is red etc etc
# dimensions is number of rows and columns 4 million cells with 7 layers (colors) so huge amount of pixels

#can plot this image diretly 

plot(p224r63_2011)

#colors are being set by R through default so lets change the colorramp pallete 

cl <- colorRampPalette(c('black','grey','light grey'))(100) # 
plot(p224r63_2011, col=cl)

#This plot shows the all the bands(colors/wavelengths) individually 
  # lets plot just the first 4 bands together B1, b2, b3, b4 
    ##### us par(mfrow=) function!
    
par(mfrow=c(2,2))
 # 2 rows 2 columns
 
# also make a color ramp pallete for blue! and plot the first band 

par(mfrow=c(2,2))

clb <- colorRampPalette(c('dark blue','blue','light blue'))(100) # 
plot(p224r63_2011$B1_sre, col=clb) 

# now do it for green (band 2)

clg <- colorRampPalette(c('dark green','green','light green'))(100) # 
plot(p224r63_2011$B2_sre, col=clg)

## now do it for the Red band!

clr <- colorRampPalette(c('dark red','red','pink'))(100) #
plot(p224r63_2011$B3_sre, col=clr)

## now do it for band 4 near infrared 
 
clnr <- colorRampPalette(c('red','orange','yellow'))(100) #
plot(p224r63_2011$B4_sre, col=clnr)

## Then we are going to layer all plots of colors together!

dev.off()
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")

## can add the infrared but RGB only lets you layer red, blue, and green, Lets add band 4
## just have to shift the RGB down to plane 4 (removing blue component)

plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")

plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")

plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")

## lets look at these all together 

par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")




























































