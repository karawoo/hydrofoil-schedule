library("shiny")

shinyUI(fluidPage(

  ## Application title
  titlePanel("Hydrofoil Schedule, Irkutsk to Bol'shie Koty, Summer 2015"),

  sidebarLayout(

    sidebarPanel(
      ## Input date
      dateInput("date", label = h3("Date input"), value = "2016-08-01"),
      
      ## Direction (to BK or to Irkutsk)
      radioButtons("radio", label = h3("Direction"),
                   choices = list("To Bol'shie Koty" = 1,
                                  "To Irkutsk" = 2), 
                   selected = 1)
      
    ),

    mainPanel()
    
  )
))
