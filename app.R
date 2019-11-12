# https://mastering-shiny.org/basic-app.html

# Question 1 from the end of Chapter 02 of Mastering Shiny by Hadley Wickham

library(shiny)
library(shinythemes)
library(rsconnect)

ui <- fluidPage(
  theme = shinytheme("lumen"),
  textInput("name", "What's your name?"),
  selectInput("style", "What type of greeting do you want?",
              choices = c("Loving", "Friendly", "Rude")),
  actionButton("go", "Get Greeted"),
  h3(" "),
  textOutput("greeting")
)

server <- function(input, output) {
  name <- eventReactive(input$go, {
    input$name
  })
  
  styl <- eventReactive(input$go, {
    input$style
  })
  
  output$greeting <- renderText({
    if(styl()=="Loving"){
      return(paste0("My dearest ", name()))
    } else if(styl() == "Friendly"){
      return(paste0("Hello, ", name()))
    } else {
      return(paste0("Forget you, ", name()))
    }
  })
}

shinyApp(ui = ui, server = server)