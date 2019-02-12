list.of.packages <- c("data.table","shiny")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
lapply(list.of.packages, require, character.only=T)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("DDW Analyst Interface"),
  
  # Sidebar with controls to select a dataset and specify the number
  # of observations to view
  sidebarPanel(
    selectInput("dataset", "Choose a dataset:", 
                choices = c("pop","p20","crs")),
    
    numericInput("obs", "Number of observations to view:", 10)
  ),
  
  # Show names of the dataset and an HTML table with the requested
  # number of observations
  mainPanel(
    div(style = 'overflow-x: scroll', tableOutput('view'))
  )
))