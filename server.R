library(shiny)
library(DBI)
library(odbc)





shinyServer(
  function(input, output, session) {

output$code      <- renderText(substring(strsplit(session$clientData$url_search, "[?,]")[[1]][2],  6))
 
output$date_from <- renderText(substring(strsplit(session$clientData$url_search, "[?,]")[[1]][3], 11))
  
output$date_to   <- renderText(substring(strsplit(session$clientData$url_search, "[?,]")[[1]][4],  9))

 
#con<-dbConnect(odbc::odbc(),Driver = "SQL Server",Server="ALSERVER01\\SQLEXPRESS2014",database="AL_DB_ZydusQuality Alert System",UID="sa",PWD="Welcome1$")
#productCodes<-dbGetQuery(con,statement=paste("SELECT DISTINCT ProductCode  FROM Form_InprocessParameters ;"))


 
 library(qcc)

 
 # plot
  data(pistonrings)  
     # import data from the library
  attach(pistonrings)

  diameter <- qcc.groups(diameter, sample)
 # sample data

 
 # plot2
  q1 = qcc(diameter[1:25,], type="xbar", nsigmas=3, plot=FALSE)

 
 # plot3

  library(ggplot2)
  library(qqplotr)
 
 set.seed(0)
  
smp <- data.frame(norm = rnorm(100))

 
 output$plot <- renderPlot({
    qcc(diameter[1:25,], type="xbar")
  })

 
 output$plot2 <- renderPlot({
    process.capability(q1, spec.limits=c(73.95,74.05))
  })

  
output$plot3 <- renderPlot({
    ggplot(data = smp, mapping = aes(sample = norm)) +
    stat_qq_band() +
    stat_qq_line() +
    stat_qq_point() +
    labs(x = "Theoretical Quantiles", y = "Sample Quantiles")
  })

})


