library("shiny")

shinyUI(fluidPage(

  ## Application title
  titlePanel("Hydrofoil Schedule, Irkutsk to Bol'shie Koty, Summer 2015"),

  sidebarLayout(

    sidebarPanel(
      ## Input date
      dateInput("date", label = h3("Date input"), value = "2015-07-01"),

      ## Direction (to BK or to Irkutsk)		
      radioButtons("radio", label = h3("Direction"),		
                   choices = list("Irkutsk to Bol'shie Koty" = 1,		
                                  "Bol'shie Koty to Irkutsk" = 2), 		
                   selected = 1)
        
    ),

    mainPanel(tableOutput("schedule"))
    
  )
))
