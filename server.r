require(shiny)

function(input, output) {

  people_selector <-
    function(people, seed) {

      set.seed(seed)

      check <-  0

      while(check == 0) {

        Assignment <-
          cbind(people, people[sample(nrow(people)),])

        colnames(Assignment) <-
          c("people1", "people2")

        if(sum(Assignment$people1 == Assignment$people2) < 1) {
          check <- 1
        }

      }

      return(Assignment)

    }

  seed <-  reactive({set.seed(input$seed)})

  people <-
    data.frame(people = c("Mooki", "Pooki", "Rizzo",
                          "Snuggle Pumpkin", "Jen",
                          "Tim", "GG"))

  Assignment <- reactive({

    people_selector(people = people, seed = seed())

  })


  your_people <-
    eventReactive(input$go,{

      Assignment()$people2[Assignment()$people1 == input$you]

    })

  output$yourPerson <-
    renderText({


      your_people()

    })

}