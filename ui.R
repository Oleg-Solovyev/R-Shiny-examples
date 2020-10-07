library(shiny)

# Define UI for application that plots random distributions

#shinyServer(
shinyUI(

  fluidPage(

   
  h1(textOutput("code"      )),
   
  h1(textOutput("date_from" )),
    
  h1(textOutput("date_to"   )),


 
  selectInput("1","label",output()$productCodes,selectize=TRUE,selected=NULL),

 fluidRow(
      splitLayout(cellWidths = c("33%", "33%", "33%"), plotOutput("plot"), plotOutput("plot2"), plotOutput("plot3"))
    )
  )
)



