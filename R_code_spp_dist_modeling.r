Species Distribution Modeling 

##2 aims of SDM 
  # prediction (where to look for and protect a species)
  # Understanding relationship btw that sp. and environmental variables


library(sdm)
library(raster)
library(rgdal)

file <- system.file("external/species.shp", package="sdm")

#ststem.file() will grab a file from the package and upload it, we then name the file 

species <- shapefile(file)
#this helps you look at the data

plot(species)

#change the point character to triangles 

plot(species, pch=17)

# In the spp data set the variable is Occurance 

species$Occurrence
# this shows you the data!

#Lets plot the data where occurrence is blue and the absence is red!

plot(species[species$Occurrence == 1,], col='blue', pch=17)
points(species[species$Occurrence == 0,], col='red', pch=17)

# the brackets [] make the subset, so every occurence value that equals one will be in the first subset
# since you plotted already the subset with 1 you want to use the points() function to add to the previous plot 
## these points are also a subset with occurances of values with 0 (absense data)

# predictors: lets look at the path (all variables we will use)
# the path is called "external" 

path <- system.file("external", package="sdm")

#List the predictors (shows the variables and the files theyre under)

lst <- list.files(path=path, pattern='asc$', full.names=T)
lst

      #there are 4 predictors: elevation, precipitation, temerature, vegetation

#then lets stack the files together 

preds <- stack(lst)

#Now lets pot the predictors (of course make a color ramp pallete)

cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl)

## NOW lets plot the predictors and the spc presence on top!

#try with elevation 

plot(preds$elevation, col=cl)
points(species[species$Occurrence == 1,], pch=17)

## Title it!

plot(preds$elevation, col=cl, main='elevation')
points(species[species$Occurrence == 1,], pch=17)

## Now do it for temperature!

plot(preds$temperature, col=cl, main='temperature')
points(species[species$Occurrence == 1,], pch=17)

## NOW do precipitation and vegetation!

plot(preds$precipitation, col=cl, main='precipitation')
points(species[species$Occurrence == 1,], pch=17)

plot(preds$vegetation, col=cl, main='vegetation')
points(species[species$Occurrence == 1,], pch=17)

### NOW WE ARE GOING TO MAKE THE MODEL

# first lets explain to the SDM package what the data are! sdmData()
  ## training set is the species presence absence data set 
  ## Predictors are the variables like temp, prec, veg, elevaiton
# then look at the data

datasdm <- sdmData(train=species, predictors=preds)
datasdm

# now build the model 

m1 <- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data=datasdm, methods = "glm")

#Now make the final prediction using the model (m1) and the data 
#making the raster output layer
  #with this prediction you can build a spatial map 
  
p1 <- predict(m1, newdata=preds)
plot(p1, col=cl)

points(species[species$Occurrence == 1,], pch=17)

## Now lets plot everything all together 

s1 <- stack(preds,p1)
plot(s1, col=cl)













































