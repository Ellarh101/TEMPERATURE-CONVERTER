#  1 project on Data Science 

library(shiny)

# Define UI

ui <- fluidPage(
titlePanel("Temperature Converter: °C ↔ °F ↔ K"),

sidebarLayout(
sidebarPanel(
numericInput("temp\_input", "Enter Temperature:", value = 0),
selectInput("from\_unit", "From:", choices = c("Celsius", "Fahrenheit", "Kelvin")),
selectInput("to\_unit", "To:", choices = c("Celsius", "Fahrenheit", "Kelvin"))
),

```
mainPanel(
  h3("Converted Temperature:"),
  verbatimTextOutput("result")
)
```

)
)

# Define Server Logic

server <- function(input, output) {

convert\_temp <- reactive({
temp <- input\$temp\_input
from <- input\$from\_unit
to <- input\$to\_unit

```
# Convert input temperature to Celsius
temp_celsius <- switch(from,
  "Celsius" = temp,
  "Fahrenheit" = (temp - 32) * 5/9,
  "Kelvin" = temp - 273.15
)

# Convert Celsius to target unit
converted <- switch(to,
  "Celsius" = temp_celsius,
  "Fahrenheit" = temp_celsius * 9/5 + 32,
  "Kelvin" = temp_celsius + 273.15
)

round(converted, 2)
```

})

output\$result <- renderText({
paste(convert\_temp(), input\$to\_unit)
})
}

# Run App

shinyApp(ui = ui, server = server)                                                                                                                                  please explain
ECS
