library("shiny")
library("dplyr")

shinyServer(function(input, output) {

  ## Functions to determine which trips operate on a given day
  
  ## Function for trips 1 and 3
  ## July 3 - August 23, except Monday and Thursday
  a <- function(date) {
    if (date >= as.Date("2015-07-03") & date <= as.Date("2015-08-23")) {
      if (!weekdays(date) %in% c("Monday", "Thursday")) {
        TRUE
      } else {
        FALSE
      }
    } else {
      FALSE
    }
  }

  ## Function for trip 2
  ## June 5 - July 1 except Monday and Thursday,
  ## August 24 - September 27 except Monday, Wednesday, and Thursday
  b <- function(date) {
    if (date >= as.Date("2015-06-05") & date <= as.Date("2015-07-01")) {
      if (!weekdays(date) %in% c("Monday", "Thursday")) {
        TRUE
      } else {
        FALSE
      }
    } else if (date >= as.Date("2015-08-24") & date <= as.Date("2015-09-27")) {
      if (!weekdays(date) %in% c("Monday", "Wednesday", "Thursday")) {
        TRUE
      } else {
        FALSE
      }
    } else {
      FALSE
    }
  }

  ## Generate schedule
  sched <- data_frame(date = c(seq(as.Date("2015-06-01"),
                                   as.Date("2015-09-30"),
                                   by = "day"))) %>%
    mutate(dow = weekdays(date)) %>%
    group_by(date) %>%
    mutate(trip1 = a(date),
           trip2 = b(date),
           trip3 = a(date))  

  ## Timetable
  tmtbl <- read.csv("timetable.csv")

  

})

