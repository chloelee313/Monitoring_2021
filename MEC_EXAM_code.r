
# Exam Code for Project 
## Toledo Bend Reservoir Temperature Change Over Time 

setwd("/Users/Chloelee/Desktop/R_Lab")
## This function tells R where to be pulling all the files from 

library(raster)
library(ncdf4)
# These are the libraries needed for my work. ncdf4 is needed for nc files which I pulled from copernicus
# the raster pakcage has functions to enable manipulation of geographic data 


## First I upload the data from 2002/2003 using raster()
   # 3 from the summer 
   # 3 from the winter 

jul02 <- raster("c_gls_LSWT_200207010000_GLOBE_AATSR_v1.0.2.nc")
aug02 <- raster("c_gls_LSWT_200208110000_GLOBE_AATSR_v1.0.2.nc")
sep02 <- raster("c_gls_LSWT_200209110000_GLOBE_AATSR_v1.0.2.nc")


# ( <-) this names the data
# ( "" ) quotations tell R to leave the workspace and bring the file back 

# Then I do the same for 2019/2020 year 

jul19 <- raster("c_gls_LSWT_201907010000_GLOBE_SLSTRA_v1.0.2.nc")
sep19 <- raster("c_gls_LSWT_201909010000_GLOBE_SLSTRA_v1.0.2.nc")
aug19 <- raster("c_gls_LSWT_201908010000_GLOBE_SLSTRA_v1.0.2.nc")


## Next Im going to crop all the data to surround just Toledo Bend Reservoir

## Lets go in detail with the July data from 2002

ext <- c(-94.6,-93.4,30.9,32)  #xmin, xmax, ymin, ymax
   #this set the name to the coordinates I want to use for each picture. Makes it simple and consitent throughoutthe pictures!
cl <- colorRampPalette(c('blue', 'yellow', 'red'))(100) #this sets the color ramp for my plots. I wanted red to be higher temperature because that is what we associate it with 

LSWTjul02 <- crop(jul02, ext) ## I am cropping the data from july 2002 using the ext data set!
plot(LSWTjul02, col=cl, main = "LSWT July 2002") #check the plot and make sure the data show up correctly,, main= sets the titles 

# This is done for all the other data 

LSWTaug02 <- crop(aug02, ext)### Data removed in computation of averaging due to error in figure produced 
plot(LSWTaug02)
LSWTsep02 <- crop(sep02, ext)
plot(LSWTsep02, col=cl)

LSWTjul19 <- crop(jul19, ext)
plot(LSWTjul19, col=cl, main="July 2019 LSWT" ) ## Only named these two figures now because I am using them in Presentation
LSWTaug19 <- crop(aug19, ext)
plot(LSWTaug19, col=cl)
LSWTsep19 <- crop(sep19, ext)
plot(LSWTsep19, col=cl)



## Next I want to get an "average" temperature for summer in 2002 and in 2019
# this is a simple arithmetic mean equation for each season 

#Summer 2002 

LSWTsum02 <- (LSWTjul02 + LSWTsep02)/2
plot(LSWTsum02, col=cl, main = "Average Summer LSWT in 2002") ## plot the average, change the color ramp pallete, title the figure!

#Summer 2019 

LSWTsum19 <- (LSWTjul19 + LSWTaug19 + LSWTsep19)/3
plot(LSWTsum19, col=cl, main = "Average LWST of Summer 2019") 

## Lets put some of the figures together!

## I want to put the first 3 figures from summer 2002 together with their average!

par(mfrow=c(2,2))  #2 rows, 2 column makes 4 avialible figures 
plot(LSWTjul02, col=cl, main="July 2002 LSWT")
plot(LSWTaug02, col=cl, main = "August 2002 LSWT")
plot(LSWTsep02, col=cl, main="September 2002 LSWT")
plot(LSWTsum02, col=cl, main="Avergae LSWT in Summer 2002")

#Now the same for Summer 2019

par(mfrow=c(2,2))
plot(LSWTjul19, col=cl, main = "July 2019 LSWT")
plot(LSWTaug19, col=cl, main = "August 2019 LSWT")
plot(LSWTsep19, col=cl, main = "September 2019 LSWT")
plot(LSWTsum19, col=cl, main = "Average LWST of Summer 2019")

# FINALLY I want to look at the change in Lake Surface water teperature from 2002 to 2019 
## Just calculating the difference!

LSWTdif <- LSWTsum19 - LSWTsum02 ## difference between avg LSWT in 2002 and average LSWT in 2019
plot(LSWTdif, col=cl, main = "LSWT Change from 2002 to 2019")

#Next I want to put the average figures together with the difference 

par(mfrow=c(2,2))
plot(LSWTsum02, col=cl, main="Avergae LSWT in Summer 2002")
plot(LSWTsum19, col=cl, main = "Average LWST of Summer 2019")
plot(LSWTdif, col=cl, main = "LSWT Change from 2002 to 2019")
























































