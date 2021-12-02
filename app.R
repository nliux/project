#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Project"),
    
    p("At time 0, this is the number of individuals we have are in each of the six categories."),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30),
            
            textInput("exposed",
                      "Number of Individuals Exposed to COVID",
                      "411"),
            
            textInput("infectives",
                      "Number of Individuals who are Infective",
                      "34"),
            
            textInput("quarantined",
                      "Number of Individuals in Quarantine",
                      "0"),
            
            textInput("diagnosed",
                      "Number of Individuals Diagnosed with COVID",
                      "0"),
            
            textInput("recovered",
                      "Number of Individuals Recovered from COVID",
                      "0"),
            
            # checkboxGroupInput("measures",
            #                    "Measures Taken",
            #                    c("1", "2", "3")),
            
            checkboxInput("exp",
                               "Exposed"),
            
            checkboxInput("inf",
                               "Infectives"),
            
            checkboxInput("diag",
                               "Diagnosed"),
            
            selectInput("timing",
                        "Time",
                        c("Start", "Middle"))
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)


# reactive actually returns something
# observe not returning anything but making something happen
