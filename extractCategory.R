extractCategory <- function(Client.Company){
  Client.Company <- as.character(Client.Company)
  
  
  if(length(grep("City", Client.Company)) > 0 | length(grep("city", Client.Company)) > 0  ){
    
    return("Government (City)")
  }
  
  if(length(grep("Municipality", Client.Company)) > 0 | length(grep("municipality", Client.Company)) > 0  ){
    
    return("Government (Municipality)")
  }
  
  if(length(grep("Municipality", Client.Company)) > 0 | length(grep("municipality", Client.Company)) > 0  ){
    
    return("Public (Municipality)")
  }
  
  if(length(grep("Government", Client.Company)) > 0 | length(grep("government", Client.Company)) > 0  ){
    
    return("Government")
  }
  if(length(grep("University", Client.Company)) > 0 | length(grep("university", Client.Company)) > 0 | length(grep("College", Client.Company)) > 0 ){
    
    return("Educational")
  }
  
  if(length(grep("nstitut", Client.Company)) > 0 | length(grep("nstituut", Client.Company)) > 0  ){
    
    return("Institution")
  }
  if(length(grep("National", Client.Company)) > 0  ){
    
    return("Government")
  }
  if(length(grep("Minist", Client.Company)) > 0 | length(grep("Court", Client.Company)) > 0 ){
    
    return("Government")
  }
  if(length(grep("Central Bank", Client.Company)) > 0 | length(grep("irport", Client.Company)) > 0 ){
    
    return("Government")
  }
  if(length(grep("Public", Client.Company)) > 0 | length(grep("public", Client.Company)) > 0 ){
    
    return("Government")
  }
  if(length(grep("nation", Client.Company)) > 0  ){
    
    return("Government")
  }
  else{
    return("Private")
  }
}


Client.Category <- NULL
for(i in 1:nrow(sheet)){
  
  Client.Category <- c(Client.Category, extractCategory(sheet[i,"Client.Company"]))
  
}
sheet$Client.Category <- as.factor(Client.Category)

