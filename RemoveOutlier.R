library(mice)
library(rio)
file <- import("Desktop/Methods3/Exercices/Table5_10.xls")

#change to numeric type
file$noneqinv <- as.numeric(file$noneqinv) 

#create a simulation sample 
simulation <- mice(file)

#write your simulation sample over data
complete <- complete(simulation, action = 1)

file$equipinv <- as.numeric(file$equipinv)
simulation2 <- mice(complete)
complete <- complete(simulation2, action = 1)
densityplot(simulation) #look your new data is realiable or not 

#compute the quantiles of 25 and 75 percent
quantile <- quantile(complete$equipinv, probs = c(.25, .75))

#calculate range with the help of IQR
range <- 1.5 * IQR(complete$equipinv)

#Outliers are placing at (Q1 - range) and (Q3 + range)
#range = 1.5 * IQR
normalEquipinv <- subset(complete, 
  complete$equipinv > (quantile[1] - range) & complete$equipinv < (quantile[2] + range))
