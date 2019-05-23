library(shiny)


shinyUI(fluidPage(

  titlePanel("Run Linear models on mtcars "),

  # Sidebar with 3 inputs for wt( weight in 1000 lbs)
  # qsec (time for a quarter of a mile) and am (0=automatic, 1=manual)
  sidebarLayout(
    sidebarPanel(
       numericInput("wt","Weight in 1000 lbs; range is normally 1-6", value=2.5),
       numericInput("qsec","Time for quarter of a mile, range is 15-25 (seconds)", value=15),
       numericInput("am","Enter 0 for automatic and 1 for Manual", value=0),
       submitButton("Submit")
    ),

    mainPanel(
      h3("Documentation for directions! The inputs are: "),
      h6(" 1. Weight of the car in 1000 pounds"),
      h6(" 2. Time for quarter of a mile in seconds"),
      h6(" 3. 0 for automatic transmission and 1 for manual transmission"),
      h6("==================================================================================="),
      h3("The resulting mpg from the stats model is: "),
      h2( textOutput("mpglm")),
      h6("==================================================================================="),
      h3("The resulting mpg from the caret model is: "),
      h2( textOutput("mpgcaret")),
      h6("==================================================================================="),
      em("Plot with all the 3 variables against mpg "),
      h6("==================================================================================="),
       plotOutput("plot1")

    )
  )
))
