

library(shiny)

# Define UI 
shinyUI(navbarPage("App for Subscription Metrics!",
  
  tabPanel("Metrics per month",
           
    sidebarLayout(
  # Sidebar with controls to select the commodity
  sidebarPanel(
   
					 
#     sliderInput("range", "Choose the month:", 
#                 min=0, max=201, value=24),
# 
#     checkboxInput("decompose", "Decompose?", TRUE)
    
    dateInput('date', 
             label='Date input:yyyy-mm-dd',
             value=as.Date("2014-08-21", "%Y-%m-%d")
             )
  ),

    # Show the caption and plot of the requested variable
  mainPanel(
    
    h3("Summary"),
	
    tableOutput("values"),
    
    h3("Plot"),
	
    plotOutput("Plot")
  )
 )),
tabPanel("Metrics per day",
         
         sidebarLayout(
         sidebarPanel(
           
           
           
            sliderInput("range", "Choose the month:", 
             min=2, max=8, value=2)
           
           
         ),
         
         # Show the caption and plot of the requested variable
         mainPanel(
           
           h3("Summary"),
           
           dataTableOutput('mytable'),
           
           h3("Plot"),
           plotOutput("plot2")
           
           
         )
)
),
tabPanel("About",
         
         "This app shows some subscribtion metrics per day and per month.You can change the day or month and the results appear in chart and table."
         )
)
)
