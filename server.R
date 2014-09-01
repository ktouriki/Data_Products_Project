
library(shiny)





inp <- read.csv("data.csv")

inp$Charges<-sub(",", ".", inp$Charges)

inp$Charges<-as.numeric(inp$Charges)

inp$Date<-as.Date(as.character(inp$Date), "%m/%d/%Y")

##i created a new var to plot per this
inp$new<-rep(1:4, len=dim(inp)[1])

months<-as.numeric(format(date, format="%m"))


# Define server logic required to plot various commodities
shinyServer(function(input, output) {

  sliderValues <- reactive({
    
    # Compose data frame
    data.frame(
      Name = c("Date", 
               "New.Sub.rs",
               "Daily.Cancelations",
               "Active.Sub.rs",
               "Charges"),
      Value = as.character(c(as.character(inp$Date[grep(input$date,inp$Date)]), 
                             inp$New.Sub.rs[grep(input$date,inp$Date)],
                             inp$Daily.Cancelations[grep(input$date,inp$Date)],
                             inp$Active.Sub.rs[grep(input$date,inp$Date)],
                             inp$Charges[grep(input$date,inp$Date)])), 
      stringsAsFactors=FALSE)
  }) 
  
 output$mytable<-renderDataTable({
   subset(inp, format.Date(Date, "%m")==paste("0", input$range, sep=""))
 })
  
  
  
  
  # Show the values using an HTML table
  output$values <- renderTable({
    sliderValues()
  })
 

   
 
    output$Plot <- renderPlot({         
      
      plot(inp$Date, inp$Charges, xlab = "Date",ylab = "Charges", main = "Charges per day", type="l")
      })
  
  output$plot2<- renderPlot({   
   
    monthdata<-subset(inp, format.Date(Date, "%m")==paste("0", input$range, sep=""))
    
    plot(monthdata$Date, monthdata$Charges, xlab = "Date",ylab = "Charges", main = "Charges per day", type="l")
  })

})