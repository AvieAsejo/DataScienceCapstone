#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)

# Define UI for application that draws a histogram
shinyUI(fluidPage(theme = shinytheme("superhero"),
                  
  # Application title
  titlePanel("Data Science Specialization SwiftKey Capstone"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      h3("Instructions"),
      h5("Kindly type the words in the text box, and then click the 'Submit' button. 
          This will result to the top 3 predicted words of the model.
          For instances wherein there are less than three predictions, an 'NA' will be returned."),
      textInput("Word", "Please type your word", "testing"),
      submitButton("Submit")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h3("First Prediction:"),
      textOutput("pred1"),
      h3("Second Prediction:"),
      textOutput("pred2"),
      h3("Third Prediction:"),
      textOutput("pred3")
    )
  )
))