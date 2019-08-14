#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinyjs)
library(dplyr)
library(quanteda)
DT1 <- readRDS("DT1.rds")
DT2 <- readRDS("DT2.rds")
DT3 <- readRDS("DT3.rds")
DT4 <- readRDS("DT4.rds")
DT5 <- readRDS("DT5.rds")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  
  output$pred1 <- renderText({
    PredictNext <- function(input){
      input <- tolower(input)
      input <- unlist(strsplit(as.character(input), ' '))
      n <- length(input)
      if(n >= 4 & nrow(DT5[base == paste(input[n-3], input[n-2], input[n-1], input[n], sep = " "),]) > 0){
        new <- DT5[.(paste(input[n-3], input[n-2], input[n-1], input[n], sep = " ")), head(.SD, 3), on = "base"]
        return(new[, predict])
      } else if(nrow(DT4[base == paste(input[n-2], input[n-1], input[n], sep = " "),]) > 0) {
        new <- DT4[.(paste(input[n-2], input[n-1], input[n], sep = " ")), head(.SD, 3), on = "base"]
        return(new[, predict])
      } else if(nrow(DT3[base == paste(input[n-1], input[n], sep = " "),]) > 0){
        new <- DT3[.(paste(input[n-1], input[n], sep = " ")), head(.SD, 3), on = "base"]
        return(new[, predict])
      } else if(nrow(DT2[base == paste(input[n], sep = ""),]) > 0){
        new <- DT2[.(paste(input[n], sep = "")), head(.SD, 3), on = "base"]
        return(new[, predict])
      } else if(n == 3 & nrow(DT4[base == paste(input[n-2], input[n-1], input[n], sep = " "),]) > 0){
        new <- DT4[.(paste(input[n-2], input[n-1], input[n], sep = " ")), head(.SD, 3), on = "base"]
        return(new[, predict])
      } else if(nrow(DT3[base == paste(input[n-1], input[n], sep = " "),]) > 0) {
        new <- DT3[.(paste(input[n-1], input[n], sep = " ")), head(.SD, 3), on = "base"]
        return(new[, predict])
      } else if(nrow(DT2[base == paste(input[n], sep = ""),]) > 0){
        new <- DT2[.(paste(input[n], sep = "")), head(.SD, 3), on = "base"]
        return(new[, predict])
      } else if(n == 2 & nrow(DT3[base == paste(input[n-1], input[n], sep = " "),]) > 0){
        new <- DT3[.(paste(input[n-1], input[n], sep = " ")), head(.SD, 3), on = "base"]
        return(new[, predict])
      } else if(nrow(DT2[base == paste(input[n], sep = ""),]) > 0) {
        new <- DT2[.(paste(input[n], sep = "")), head(.SD, 3), on = "base"]
        return(new[, predict])
      } else if(n == 1 & nrow(DT2[base == paste(input[n], sep = " "),]) > 0){
        new <- DT2[.(paste(input[n], sep = " ")), head(.SD, 3), on = "base"]
        return(new[, predict])
      } else{
        return("Unknown")
      }
    }
    PredictNext(input$Word)[1]
  })
  
  output$pred2 <- renderText({
    
    PredictNext <- function(input){
      input <- tolower(input)
      input <- unlist(strsplit(as.character(input), ' '))
      n <- length(input)
      if(n >= 4 & nrow(DT5[base == paste(input[n-3], input[n-2], input[n-1], input[n], sep = " "),]) > 0){
        new <- DT5[.(paste(input[n-3], input[n-2], input[n-1], input[n], sep = " ")), head(.SD, 3), on = "base"]
        return(new[, predict])
      } else if(nrow(DT4[base == paste(input[n-2], input[n-1], input[n], sep = " "),]) > 0) {
        new <- DT4[.(paste(input[n-2], input[n-1], input[n], sep = " ")), head(.SD, 3), on = "base"]
        return(new[, predict])
      } else if(nrow(DT3[base == paste(input[n-1], input[n], sep = " "),]) > 0){
        new <- DT3[.(paste(input[n-1], input[n], sep = " ")), head(.SD, 3), on = "base"]
        return(new[, predict])
      } else if(nrow(DT2[base == paste(input[n], sep = ""),]) > 0){
        new <- DT2[.(paste(input[n], sep = "")), head(.SD, 3), on = "base"]
        return(new[, predict])
      } else if(n == 3 & nrow(DT4[base == paste(input[n-2], input[n-1], input[n], sep = " "),]) > 0){
        new <- DT4[.(paste(input[n-2], input[n-1], input[n], sep = " ")), head(.SD, 3), on = "base"]
        return(new[, predict])
      } else if(nrow(DT3[base == paste(input[n-1], input[n], sep = " "),]) > 0) {
        new <- DT3[.(paste(input[n-1], input[n], sep = " ")), head(.SD, 3), on = "base"]
        return(new[, predict])
      } else if(nrow(DT2[base == paste(input[n], sep = ""),]) > 0){
        new <- DT2[.(paste(input[n], sep = "")), head(.SD, 3), on = "base"]
        return(new[, predict])
      } else if(n == 2 & nrow(DT3[base == paste(input[n-1], input[n], sep = " "),]) > 0){
        new <- DT3[.(paste(input[n-1], input[n], sep = " ")), head(.SD, 3), on = "base"]
        return(new[, predict])
      } else if(nrow(DT2[base == paste(input[n], sep = ""),]) > 0) {
        new <- DT2[.(paste(input[n], sep = "")), head(.SD, 3), on = "base"]
        return(new[, predict])
      } else if(n == 1 & nrow(DT2[base == paste(input[n], sep = " "),]) > 0){
        new <- DT2[.(paste(input[n], sep = " ")), head(.SD, 3), on = "base"]
        return(new[, predict])
      } else{
        return("Unknown")
      }
    }
    
    PredictNext(input$Word)[2]
    
  })
  
  output$pred3 <- renderText({
    
    PredictNext <- function(input){
      input <- tolower(input)
      input <- unlist(strsplit(as.character(input), ' '))
      n <- length(input)
      if(n >= 4 & nrow(DT5[base == paste(input[n-3], input[n-2], input[n-1], input[n], sep = " "),]) > 0){
        new <- DT5[.(paste(input[n-3], input[n-2], input[n-1], input[n], sep = " ")), head(.SD, 3), on = "base"]
        return(new[, predict])
      } else if(nrow(DT4[base == paste(input[n-2], input[n-1], input[n], sep = " "),]) > 0) {
        new <- DT4[.(paste(input[n-2], input[n-1], input[n], sep = " ")), head(.SD, 3), on = "base"]
        return(new[, predict])
      } else if(nrow(DT3[base == paste(input[n-1], input[n], sep = " "),]) > 0){
        new <- DT3[.(paste(input[n-1], input[n], sep = " ")), head(.SD, 3), on = "base"]
        return(new[, predict])
      } else if(nrow(DT2[base == paste(input[n], sep = ""),]) > 0){
        new <- DT2[.(paste(input[n], sep = "")), head(.SD, 3), on = "base"]
        return(new[, predict])
      } else if(n == 3 & nrow(DT4[base == paste(input[n-2], input[n-1], input[n], sep = " "),]) > 0){
        new <- DT4[.(paste(input[n-2], input[n-1], input[n], sep = " ")), head(.SD, 3), on = "base"]
        return(new[, predict])
      } else if(nrow(DT3[base == paste(input[n-1], input[n], sep = " "),]) > 0) {
        new <- DT3[.(paste(input[n-1], input[n], sep = " ")), head(.SD, 3), on = "base"]
        return(new[, predict])
      } else if(nrow(DT2[base == paste(input[n], sep = ""),]) > 0){
        new <- DT2[.(paste(input[n], sep = "")), head(.SD, 3), on = "base"]
        return(new[, predict])
      } else if(n == 2 & nrow(DT3[base == paste(input[n-1], input[n], sep = " "),]) > 0){
        new <- DT3[.(paste(input[n-1], input[n], sep = " ")), head(.SD, 3), on = "base"]
        return(new[, predict])
      } else if(nrow(DT2[base == paste(input[n], sep = ""),]) > 0) {
        new <- DT2[.(paste(input[n], sep = "")), head(.SD, 3), on = "base"]
        return(new[, predict])
      } else if(n == 1 & nrow(DT2[base == paste(input[n], sep = " "),]) > 0){
        new <- DT2[.(paste(input[n], sep = " ")), head(.SD, 3), on = "base"]
        return(new[, predict])
      } else{
        return("Unknown")
      }
    }
    
    PredictNext(input$Word)[3]
    
  })
  
})