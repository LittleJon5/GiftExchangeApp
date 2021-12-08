require(shiny)

pageWithSidebar(

  headerPanel("Nelson Gift Exchange"),

  sidebarPanel(

    textInput(inputId = "seed",
              label= "Enter Exchange ID",
              value = 1),

    selectInput("you",
                "Select Your Name:",
                c("Mooki", "Pooki", "Rizzo",
                  "Snuggle Pumpkin", "Jen",
                  "Tim", "GG")),

    actionButton(inputId="go",
                 label = "Go")


  ),

  mainPanel(

    textOutput(outputId = "yourPerson")

  )
)