library(shiny)
library(shinyjs)

shinyUI(fluidPage(
 
  wellPanel(
           dateRangeInput('dateRange',
                          label = paste('Input Date Range :'),
                          start = Sys.Date() - 21, end = Sys.Date() - 21,
                          # start = Sys.Date() - 25, end = Sys.Date() - 21,
                          min = "1992/6/19", max = Sys.Date()  - 21,
                          separator = " - ", format = "yyyy/mm/dd",
                          startview = 'year',  weekstart = 0
           ), 
           
           br(), 
           
           selectizeInput("selectProduct", "Products:",
                          multiple = TRUE,
                          c("GPS orbits" = "1",
                            "GPS clocks" = "2" 
                          )   
           ),
           
           
           br(),  
         
           textOutput("text2"),    
             tags$script(HTML('            
                  Shiny.addCustomMessageHandler("sp3Products",     
                      function(sp3List) {   
                          for (var i = 1; i < sp3List.length; i++) { 
                           window.open(sp3List[i]);
                           }
                      } 
               );
            ')),
           
           tags$script(HTML('            
                  Shiny.addCustomMessageHandler("clkProducts",     
                      function(clkList) {   
                          for (var i = 1; i < clkList.length; i++) { 
                           window.open(clkList[i]);
                           }
                      } 
               );
            ')),
           textOutput("errorMessage"),
           submitButton("Submit"),
           
           br(),  
      
          
            HTML("<strong>Limitations :</strong> 
                 <br>Date range is limited to availability of IGS final products
                 <br>Utility triggers download by opening a new tab, please allow pop ups
                 <br>Utility limited to GPS Final orbit and clocks, depending on demand, functionaility can be expanded
                 ")
           
 
 
  )
  
)
)
