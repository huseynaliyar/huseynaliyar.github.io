ibrary(mice)
library(rio)
library(mice.mids)


file <- import("Desktop/Methods3/Exercices/Table5_10.xls”). 
file$noneqinv <- as.numeric(file$noneqinv)       #one of the columns in the data

simulation <- mice(file, method = "pmm")
complete <- complete(simulation, action = 1)

file$equipinv <- as.numeric(file$equipinv)

simulation2 <- mice(complete, method = "pmm")
complete <- complete(simulation2, action = 1)
densityplot(simulation)
