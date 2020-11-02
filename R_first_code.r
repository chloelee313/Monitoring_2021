### This is the comment code so it does not read this line!

# This is an array, put a "c" before the array 
## arrow will assign name to the data set 
primates <- c(3, 5, 9, 15, 40)
### now you input the name into code and it will show the data set in R
primates

#new set:
crabs <- c(100, 70, 30, 10, 5)
crabs
#R gives data set

# First Plot in R
### generic plot funciton, plot(x-axis, y-axis).... "arguments" are what you put into the function
plot(primates, crabs)

#Lets change the color of the plot!
## add additional argument col=""
plot(primates, crabs, col="purple4")

#Lets change the simple 
## add another argument pch=code of symbol you want 
plot(primates, crabs, col="purple4", pch=19 )

#Lets add character exageration (size increase of points)
## add argument cex= 
plot(primates, crabs, col="purple4", pch=19, cex=2)

#Lets add a title to the graph
## input title argument main= 
plot(primates, crabs, col="purple4", pch=19, cex=2, main="My First Ecological Graph in R")

#Create a DataFrame (table)
## function is data.frame 
### then give it a name and run the name to see the table 
ecoset <- data.frame(primates,crabs)
ecoset

#Ecological numbers
## Mean number of individuals per site
(3+ 5+ 9+ 15+ 40)/5 ## most simple way!
# =14.4

#Make a summary of the dataframe 
## Use fucntion summary() for R
summary(ecoset)
   primates        crabs    
 Min.   : 3.0   Min.   :  5  
 1st Qu.: 5.0   1st Qu.: 10  
 Median : 9.0   Median : 30  
 Mean   :14.4   Mean   : 43  
 3rd Qu.:15.0   3rd Qu.: 70  
 Max.   :40.0   Max.   :100  
