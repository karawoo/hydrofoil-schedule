library("shiny")

shinyUI(fluidPage(

  includeCSS("styles.css"),
  
  ## Application title
  headerPanel("Hydrofoil Schedule, Irkutsk — Bol'shie Koty, Summer 2015"),

  sidebarLayout(

    sidebarPanel(
      p("Choose a date to view the hydrofoil schedule. Note that there are no trips on Mondays or Thursdays at any point in the season, or Wednesdays after 24 August."),
      p("Trips 1 and 3 run from 3 July to 23 August; Trip 2 runs from 5 June to 1 July and 24 August to 27 September)"),
      p("The full schedule can be found on the",
        shiny::a("hydrofoil website.",
                 href = "http://www.vsrp.ru/passengers/timetable/")),
      ## Input date
      dateInput("date", label = h3("Choose a date"), value = "2015-07-01"),

      ## Direction (to BK or to Irkutsk)		
      radioButtons("radio", label = h3("Direction"),		
                   choices = list("Irkutsk to Bol'shie Koty" = 1,		
                                  "Bol'shie Koty to Irkutsk" = 2), 		
                   selected = 1)
      
    ),

    mainPanel(
      tableOutput("schedule"),
      tags$head(tags$style("#schedule table {background-color: #f5f5f5; }", media="screen", type="text/css"))
      
    )
  )
))
