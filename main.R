# setwd(RPROJ$PROJHOME)

# library(Geodesy)
# source("Geodesy/jd2mjd.R")
# source("Geodesy/mjd2jd.R")
# source("Geodesy/jd2yr2.R")
# source("Geodesy/yr2jd.R")
# source("Geodesy/jd2doy.R")
# source("Geodesy/doy2jd.R")
# source("Geodesy/jd2dow.R")
# source("Geodesy/gps2jd.R")
# source("Geodesy/jd2cal.R")
# source("Geodesy/cal2jd.R")
# source("Geodesy/getJulienDate.R")
# 
# # source("C:/Users/Garrett/Desktop/Shiny/Date_Utility/getJulienDate.R") 
# # source("C:/Users/Garrett/Desktop/Shiny/Date_Utility/convertAllSystems.R")
# source("getSP3andClkURL.R")
# 
# 
# 
# 
# # Input
# 
# yearSystemTime  = format(Sys.Date(), format="%Y")
# monthSystemTime = format(Sys.Date(), format="%m")
# daySystemTime   = format(Sys.Date(), format="%d")
# 
# 
# timeSystem   = 5
# outputString = paste("2015/06/17") 
# fileType     = "sp3"
# fileType     = "clk"
# AC           = "igs"
# 
# server       = "ftp://cddis.gsfc.nasa.gov"
# 
# #Calculate date parameters
# 
# 
# jd=getJulienDate(timeSystem,outputString)
# fileURL=getSP3andClkURL(server,AC,fileType,jd)
# print(fileURL) 


# 
# launch.browser = function(appUrl, browser.path=path) {
#   system(sprintf('"%s" --disable-gpu --app="data:text/html,<html>
#                  <head>
#                  <title>System Configuration</title>
#                  </head>
#                  <body>
#                  <script>window.resizeTo(830,675);window.location=\'%s\';</script>
#                  </body></html>" &', browser.path, appUrl))
# }


