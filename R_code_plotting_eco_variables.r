#Today we are plotting ecological variables and making use of them (remember this is a comment!)

## R code for plotting the relationshipt between/among ecological variables 
##     Last time we invented our own code, today we will us data from a pre-existing data set (or package)
##       Package today is called SP

#Lets install the package!
## Function is install.packages
## argument is the package itself (sp)
install.packages("sp")
#  brackets needed to bring package into R

##to make use of the package use library() function 
##  Do not need quotations because the package is already in R
library(sp)

#Lets look at the data, specifically the Meuse data
## function is data()
#     used to recall datasets
data(meuse)

#Lets look inside the set!
## you can simply put meuse  (then you will see the whole data set)
meuse 

#when this happens, the data is a bit confusing to look at so lets sort it out
## use function View()            ##Remember R is case sensitive!!!
View(meuse)    ### Might not work for mac 

#Solve View error on mac for https://www.xquartz.org/


# Still a big data set

#Lets narrow it down!
#  Too look at just the top of the data set us funciton head()
head(meuse)

# Excersise: Find mean of all the variables!
#   Could potentially calcualte by hand but WAYYY too much data, so lets use an R funciton 

# Us summary function to see all the major mathematical stats of each column!
## summary()
summary(mease)

# LETS PLOT SOME THINGS!
## how about cadmium on x axis and the zinc in the y 

#Excersise: plot zinc against cadmium 






































