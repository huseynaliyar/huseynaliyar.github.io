
for (i  in 1:nrow(file)) {
  
  file$Competitor.Annual.Revenue.with.Millions <- gsub("\\$","",file$Competitor.Annual.Revenue.with.Millions)
  
}

for (i  in 1:nrow(file)) {
  
  file$Competitor.Annual.Revenue.with.Millions <- gsub("\\,","",file$Competitor.Annual.Revenue.with.Millions)
  
}
