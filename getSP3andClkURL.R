source("Geodesy/convertAllSystems.R")
getSP3andClkURL <- function(server,AC,fileType,jd){
  
  allSystemTimes = convertAllSystems(jd)
  GPSweek       = as.numeric(allSystemTimes[[1]])
  DOW           = as.numeric(allSystemTimes[[2]])
  
  directory=paste0("/gps/products/",GPSweek,"/")
  
  FileChar     = paste0(AC,GPSweek,DOW,".",fileType, ".Z");
  fileURL = paste0(server,directory,FileChar)
  return(fileURL)
}