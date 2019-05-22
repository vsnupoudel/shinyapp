library(shiny)


shinyUI(fluidPage(

  titlePanel("Run Linear models on mtcars "),

  # Sidebar with 3 inputs for wt( weight in 1000 lbs)
  # qsec (time for a quarter of a mile) and am (0=automatic, 1=manual)
  sidebarLayout(
    sidebarPanel(
       numericInput("wt","Weight in 1000 lbs", value=2.5),
       numericInput("qsec","Time for quarter of a mile", value=15),
       numericInput("am","Enter 0 for automatic and 1 for Manual", value=0),
       submitButton("Submit")
    ),

    mainPanel(
      h3("The resulting mpg from the stats model is "),
      textOutput("mpglm"),
      h3("The resulting mpg from the caret model is "),
      textOutput("mpgcaret"),
      h6("==================================================================================="),
      em("Plot with all the 3 variables against mpg "),
      h6("==================================================================================="),
       plotOutput("plot1")

    )
  )
))
