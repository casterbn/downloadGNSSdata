source("Geodesy/jd2mjd.R")
 
 
source("Geodesy/jd2gps.R")


source("Geodesy/mjd2jd.R")
source("Geodesy/jd2yr2.R")
source("Geodesy/yr2jd.R")
source("Geodesy/jd2doy.R")
source("Geodesy/doy2jd.R")
source("Geodesy/jd2dow.R")
source("Geodesy/gps2jd.R")
source("Geodesy/jd2cal.R")
source("Geodesy/cal2jd.R")
source("Geodesy/getJulienDate.R")


convertAllSystems <- function(jd){
 
  #Calculate date parameters
  calculatedGPSweek       = jd2gps(jd)[1]   #1
  calculatedDOW           = jd2dow(jd)      #2
  calculatedYear          = jd2doy(jd)[1]   #3
  calculatedDOY           = jd2doy(jd)[2]   #4
  calculatedMJD           = jd2mjd(jd)      #5
  calculatedDecimalYear   = jd2yr2(jd)      #6
  calculatedYYYYMMDD      = jd2cal(jd)      #7
  
  outputAllSystems <- list(calculatedGPSweek,calculatedDOW,calculatedYear,calculatedDOY,calculatedMJD,calculatedDecimalYear,calculatedYYYYMMDD)
  return(outputAllSystems)
  
}