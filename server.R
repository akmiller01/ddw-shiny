list.of.packages <- c("data.table","shiny")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
lapply(list.of.packages, require, character.only=T)

load("examples.RData")
Sys.setlocale('LC_ALL','C')

# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output) {
  # Return the requested dataset
  datasetInput <- reactive({
    switch(input$dataset,
           "crs" = crs,
           "pop" = pop,
           "p20" = p20)
  })
  
  # Show the first "n" observations
  output$view <- renderTable({
    head(datasetInput(), n = input$obs)
  })
})