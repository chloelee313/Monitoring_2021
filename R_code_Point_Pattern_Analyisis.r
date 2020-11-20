# Point Pattern Analysis 

install.packages("spatstat")
library(spatstat)

## Look at point pattern analysis presentation!

## Lets remember how to set the working directory and import the data from there (the covid data)

######### IMPORT DATA FROM AN EXTERNAL SOURCE

 # setwd("/Users/yourname/lab/")
 
# NOW, lets see the density of the data
 # Lets make a planar point pattern in spatstat
  ## attach covid data set 
  
attach(covid)  ## don't have to use dollar sign or explain where things are
 
## CREATION OF PLANAR POINT PATTER below

covid_planar <- ppp(lon, lat, c(-180, 180), c(-90,90))
# x variable is called lon and y is called lat in covid data ,  c(-180, 180) is the range of lon, c(-90,90) is the range of lat
## make sure to name it!

Can make a density of the data 

density_map <- density(covid_planar)

then plot the density! 

plot(density_map)  ## can even put the points on the map 
points(covid_planar)

## change the color of the map!

cl <- colorRampPalette(c('yellow','orange','red'))(100) # 
lot(density_map,col=cl)
points(covid_planar)


Change the color yourself!

cl <- colorRampPalette(c('purple4','palegreen4','palevioletred4'))(100) # 






























































