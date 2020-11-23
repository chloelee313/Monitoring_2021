# Point Pattern Analysis 

install.packages("spatstat")
library(spatstat)

## Look at point pattern analysis presentation!

## Lets remember how to set the working directory and import the data from there (the covid data)

######### IMPORT DATA FROM AN EXTERNAL SOURCE

 # setwd("/Users/yourname/lab/")


setwd("/Users/Chloelee/Desktop/R_lab)
     ## You must do this before doing anything with the data

# NOW, lets see the density of the data
 # Lets make a planar point pattern in spatstat
  ## attach covid data set 

covid <- read.table("covid_agg.csv", header=TRUE)
# this is bringing in the data from the dataset # remember header=TRure means that the beginning of each column is the title, so no real data in row 1
  
attach(covid)  ## don't have to use dollar sign or explain where things are
 
## CREATION OF PLANAR POINT PATTER below

covid_planar <- ppp(lon, lat, c(-180, 180), c(-90,90))

# x variable is called lon and y is called lat in covid data ,  c(-180, 180) is the range of lon, c(-90,90) is the range of lat
## make sure to name it! 

## ppp says that these points are spatial points!

Can make a density map of the data 

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


## Now install rgdal = Geospatial data abstraction 

insatll.packages("rgdal")
library(rgdal)



## Download the coastline data files into R_lab folder and name it

coastlines <- readOGR("ne_10m_coastline.shp")

#    Do not need to give the whole location because we have set R_lab as the working directory 

# SO lets plot the coastlines with our spatial data


cl <- colorRampPalette(c('pink','purple','brown'))(100)
plot(density_map, col=cl)
points(covid_planar)
plot(coastlines, add=TRUE)       #add = true means that we want the coastline plotted on top of the density map! 

## lets change the points to filled in circles (instead of open)
     # pch() goes into the points argument 
     # cex() is for size 

plot(density_map, col=cl)
points(covid_planar, pch=19, cex=0.5)
plot(coastlines, add=TRUE) 



### FOR EXPORTING FIGURES

png("figure1.png")
cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100) #
plot(density_map, col = cl)
points(covid_planar, pch = 19, cex = 0.5)
plot(coastlines, add = TRUE)
dev.off()

## use png to title the figure and then underneath put the code you want as the picture and dev.off()

## or use pdg 

pdf("figure1.pdf)
cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100) #
plot(density_map, col = cl)
points(covid_planar, pch = 19, cex = 0.5)
plot(coastlines, add = TRUE)
dev.off()

#can also define the figure dimenstions

ggsave()


## NOW WE WILL INTERPOLATE THE CASE DATA!

marks(covid_planar) <- cases    #cases is the column where we take the data, arrow links the cases to the "marks"
     # every point has its own value 

## Smooth() interpolates the data from where we did not collect anything 

cases_map <- Smooth(covid_planar)

plot(cases_map, col=cl)
plot(coastlines, add=T)
points(covid_planar, pch = 19, cex = 0.25)

## map changed because the highest number of cases was in china whereas the last map had the highest number of points (which was just wehre the data were collected 












































