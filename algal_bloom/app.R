#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(readr)
library(plotly)
library(ggplot2)
library(tidyverse)
library(Hmisc)
library(keras)
library(tensorflow)
library(reticulate)	
library(caret)
library(shiny)
py_path = "C:\\Users\\Tarri\\anaconda3\\" 
use_python(py_path, required = T)	

input <- read_csv("C:\\Users\\Tarri\\Desktop\\portfolio_projects\\algal_bloom_dashboard\\algal_bloom\\data\\input.csv")
output <- read_csv("C:\\Users\\Tarri\\Desktop\\portfolio_projects\\algal_bloom_dashboard\\algal_bloom\\data\\output.csv")
model = load_model_hdf5('C:/Users/Tarri/Desktop/portfolio_projects/algal_bloom_dashboard/code/nn_model.hdf5')


# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
          h3("Help Text"),
          helpText(""),
        
        
          fileInput("file", h3("Choose CSV file"))
          
          
          
          
          
          
          
        ),

        # Show a plot of the generated distribution
        mainPanel(

          
          tableOutput("contents")
          
          
          
          
                  )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

  output$contents <- renderTable({
    file <- input$file1
    ext <- tools::file_ext(file$datapath)
    
    req(file)
    validate(need(ext == "csv", "Please upload a csv file"))
    
    read.csv(file$datapath, header = input$header)
    normalize <- function(x) {
      return((x - min(x)) / (max(x) - min(x)))
    }
    
    
  ## Function to normalize all the columns in the dataset

  
  
})}

# Run the application 
shinyApp(ui = ui, server = server)
