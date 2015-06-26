library("shiny")

shinyUI(fluidPage(

  ## Application title
  titlePanel("Hydrofoil Schedule, Irkutsk to Bol'shie Koty, Summer 2015"),

  sidebarLayout(

    sidebarPanel(
      ## Input date
      dateInput("date", label = h3("Date input"), value = "2015-07-01")
        
    ),

    mainPanel(tableOutput("schedule"))
    
  )
))
