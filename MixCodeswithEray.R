data <- read.csv("~/Desktop/ErayCarbajoCompet.csv")

OMA <- data[which(str_detect(data$Architecure.Firm, "OMA")),]
Snohetta <- data[which(str_detect(data$Architecure.Firm, "Snohetta")),]
OleScheeren <- data[which(str_detect(data$Architecure.Firm, "Ole Scheeren")),]
Heatherwick <- data[which(str_detect(data$Architecure.Firm, "Heatherwick")),]
ZahaHadid <- data[which(str_detect(data$Architecure.Firm, "Zaha Hadid")),]
AsifKhan <- data[which(str_detect(data$Architecure.Firm, "Asif Khan")),]





OMApure <- OMAlocationFRAME[which(OMAlocationFRAME$OMAlocation > 0),]
#OMA horizontal geombar
library(ggplot2)
ggplot(OMApure, aes(x = rn,y = OMAlocation )) +
  geom_bar(stat="identity") +
  coord_flip() +
  xlab("Country") +
  ylab("Number of Projects") +
  ggtitle("Number of Projects OMA did over different countries") 
  
#for Snohetta horizontal geombar

ggplot(Snohettapure, aes(x = rn,y = SnohettaLocationFrame )) +
  geom_bar(stat="identity") +
  coord_flip() +
  xlab("Country") +
  ylab("Number of Projects") +
  ggtitle("Number of Projects Snohetta did over different countries") 



#FOR Zaha Hadid

ggplot(ZahaHadidpure, aes(x = rn,y = ZahaHadidLocationFrame )) +
  geom_bar(stat="identity") +
  coord_flip() +
  xlab("Country") +
  ylab("Number of Projects") +
  ggtitle("Number of Projects Zaha Hadid did over different countries") 


#For Heatherwick
ggplot(Heatherwickpure, aes(x = rn,y = HeatherwicklocationFrame )) +
  geom_bar(stat="identity") +
  coord_flip() +
  xlab("Country") +
  ylab("Number of Projects") +
  ggtitle("Number of Projects Heatherwick did over different countries") 

#For AsifKhan
ggplot(AsifKhanpure, aes(x = rn,y = AsifKhanFrame )) +
  geom_bar(stat="identity") +
  coord_flip() +
  xlab("Country") +
  ylab("Number of Projects") +
  ggtitle("Number of Projects Asif Khan did over different countries") 

#For OleScheeren

ggplot(Olepure, aes(x = rn,y = OleScheerenLocationFrame )) +
  geom_bar(stat="identity") +
  coord_flip() +
  xlab("Country") +
  ylab("Number of Projects") +
  ggtitle("Number of Projects Ole Scheeren did over different countries") 









#write in txt file
install.packages("Hmisc")
install.packages("e1071")
install.packages("tidyr")

sink("OMAlocationFrame.txt", append = TRUE)
OMAlocationFRAME
sink()


sink("AsifKhanLocationFrame.txt", append = TRUE)
AsifKhanFrame
sink()

sink("HeatherwickLocationFrame.txt", append = TRUE)
HeatherwicklocationFrame
sink()

sink("OleScheerenLocationFrame.txt", append = TRUE)
OleScheerenLocationFrame
sink()

sink("SnohettaLocationFrame.txt", append = TRUE)
SnohettaLocationFrame
sink()

sink("ZahaHadidLocationFrame.txt", append = TRUE)
ZahaHadidLocationFrame
sink()



#change row name to column
library(data.table)
setDT(ZahaHadidLocationFrame, keep.rownames = TRUE)[]
setDT(OMAlocationFRAME, keep.rownames = TRUE)[]
setDT(HeatherwicklocationFrame, keep.rownames = TRUE)[]
setDT(SnohettaLocationFrame, keep.rownames = TRUE)[]
setDT(OleScheerenLocationFrame, keep.rownames = TRUE)[]
setDT(AsifKhanFrame, keep.rownames = TRUE)[]



OMAzero <- OMAlocationFRAME[which(str_detect(OMAlocationFRAME$OMAlocation, "0")),]








#finds common rows
install.packages("plyr")
library(plyr)
allcommon <- join_all(list(OMAzero, Snohettazero,OleScheerenzero,Heatherwickzero, Asifzero),  type = "inner")



# make new data frame choosing one project category
archi <- data[which(data$Project.Category == "Architecture"),]
nrow(unique(archi)) #to check how many rows are uniqe
archiunique <- archi[!duplicated(archi),]



USA <- data[which(data$Location == "USA"),]
UK <- data[which(data$Location == UK),]
UK[duplicated(UK$Client.Company), ]












data <- read.csv("~/Desktop/ErayCarbajoCompet.csv")




sortloc <- data[order(as.character(data$Location)),]









#https://docs.google.com/spreadsheets/d/e/2PACX-1vSLG3yo_26M-eqoSY04UEIrqGya9gFspOGss2QW7HA62wgiAZG3MUqHEKXoFnJGMR1lIEz8p5K72L58/pub?gid=0&single=true&output=csv

myurl <- "https://docs.google.com/spreadsheets/d/e/2PACX-1vSsk9yEPYC5vO9uFYsQFcbzwIjGnHUuNvnw0UAGwMR2aavjTHityTJbFs7vb4sdhHv5xBZoOi33U0kN/pub?gid=1615106657&single=true&output=csv"
sheet <- read.csv(url(myurl))

sheet <- subset(sheet, select=c(1,2,3,5,4)) # reorder columns



ggplot(sheet, aes( x = Location, fill = factor(Client.Category))) +
  geom_histogram(stat = "count") +
  coord_flip()
  
ggplot(sheet, aes( x= Client.Category) + 
  geom_histogram(stat = "count") 
  
  











