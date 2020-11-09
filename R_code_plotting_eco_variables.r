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
## Lets try plot(cadmium,zinc)
plot(cadmium,zinc)
##Error in h(simpleError(msg, call)) : 
  #error in evaluating the argument 'x' in selecting a method for function 'plot': object 'cadmium' not found

#We need to explain to R that cadmium is inclide a data set!
##   Us $ symbol to link parts of fucntion to a data set
plot(meuse$cadmium,meuse$zinc)
#       YAYYY

#lets simplify with the attach function!
## attach()
##     R knows that all variables we are using are attached to meuse dataset
# No long need the $ symbol
attach(meuse)
plot(cadmium,zinc)

#Lets see about lead and cadmium 
plot(cadmium,lead)

## How to impress your supervisor!
#   We want to see about all the possible relationships wihin the data set
#      Trivial way - go to excel and plot all the data :/ NO!!
#      Better way - pairs function 
# make a scatter plot matrix
#function pairs()
pairs(meuse)

#Question!!
#  Do pairs but pair only the elements parts of the data set!
### I looked it up, I did pairs funtion still but you can specify which variables(coloumns) you want!
#      pairs(~x1+x2+x3)
      # x1, x2, x3 etc are the particular variables SO
pairs(~cadmium+copper+lead+zinc) # ~ symbol means "equals" so the whole column
#this worked for me!
## to make it better put 
pairs(~cadmium+copper+lead+zinc,data=meuse,col="purple4",main="pairs plot of selected columns/elements"

#Duccio's answer!
# want from column 3 to column 6
pairs(meuse[,3:6]) ## the comma says to start from column 3 and go to column 6
pairs(meuse[,3:6],col="purple4",pch=19,main="pairs plot of elements") ## this gave a color to the points, the type of point, and the title of the figures

pairs(~cadmium+copper+lead+zinc,data=meuse,col=c("purple4","red","cornflowerblue")) ## this will change the color of each variable
 ##https://statisticsglobe.com/r-pairs-plot-example/     website for how to do these




































