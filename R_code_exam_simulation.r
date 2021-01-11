## First Register to the copernicus program to download data 
### when downloading images, make sure to take the "nc" extension

#R code for the exam
   #for nc data we need library ncdf4
   
setwd("/Users/Chloelee/Desktop/R_Lab")

#now upload and name the data in R
## data only has one band, so instead of using the "brick" function we use "raster" function

library(raster)

## Upload and plot the data from January 

tjan <- raster("c_gls_LST10-DC_202101010000_GLOBE_GEO_V1.2.1.nc")
plot(tjan)

#Excersise! Change the color ramp pallete 

cltjan <- colorRampPalette(c('black','grey','light grey'))(100) #
plot(tjan, col=cltjan)

# Now upload and plot the image from october

toct <- raster("c_gls_LST10-DC_202010010000_GLOBE_GEO_V1.2.1.nc")
plot(toct, col=cltjan)


if you want to know the difference between the two temperatures!

dif <- tjan - toct 
cldif <- colorRampPalette(c('blue','white','red'))(100) #
plot(dift, col=cldif)



## ANDDD Thats about it!

























































