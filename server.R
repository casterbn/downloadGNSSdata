closeAllConnections()
rm(list=ls())
 
source("Geodesy/jd2mjd.R")
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

library(shinyjs)
library(shiny)
source("getSP3andClkURL.R") 

 

shinyServer(function(input, output,session) { 

  
  getURLList<-function(dateRange,fileType) {
    
    NOD=abs(as.numeric(dateRange[2]-dateRange[1]))
    
    

    
    
    # Initilization
    urlList <- vector() 
    
    withProgress(message = paste(fileType, 'File : '), detail = paste("Date",dateRange[1]), value = 0, {
      for (dateIndex in 1:(NOD+1)){
        
        # Increment the progress bar, and update the detail text.
        incProgress((1/NOD), detail = paste("Date", dateRange[1]+dateIndex-1)) 
        
        year  = format(dateRange[1]+dateIndex-1, format="%Y")
        month = format(dateRange[1]+dateIndex-1, format="%m")
        day   = format(dateRange[1]+dateIndex-1, format="%d")
        
        jd    = cal2jd(as.numeric(year),as.numeric(month),as.numeric(day)); 
        
        AC           = "igs" 
        server       = "ftp://cddis.gsfc.nasa.gov"
        
        
        fileURL = getSP3andClkURL(server,AC,fileType,jd)
        
        print(paste(fileURL,dateRange[1]+dateIndex-1))  
        urlList[dateIndex+1]<-(as.character(fileURL))
        
            
      }
    })
    
   
    
    return(urlList)
    
  }
 
  
  

  observe({
    
   
     
    
    if (length(input$selectProduct)>0){
    
      withProgress(message = 'Loading products', value = 0.1, {
        
        
        
        for (productIndex in 1:length(input$selectProduct)){
          
          inputValue=input$selectProduct[productIndex]
          if (  (inputValue)==1){
            
            fileType     = "sp3"
            # urlListGPSclk=getURLList(input$dateRange,fileType) 
            sp3List=getURLList(input$dateRange,fileType) 
            session$sendCustomMessage(type='sp3Products', sp3List) 
            
          }
          
          if (  (inputValue)==2){
            fileType     = "clk"
            clkList=getURLList(input$dateRange,fileType) 
            session$sendCustomMessage(type='clkProducts', clkList) 
            
          }
        } 
      }) 
 
      
    }
    
    text2=""
  }) 
  
  
  
})
