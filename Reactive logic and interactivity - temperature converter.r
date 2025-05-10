# Part 3: Reactive Logic and Interactivity
server <- function(input, output) {
  
  # Reactive expression for temperature conversion
  convert_temp <- reactive({
    req(input$input_temp)  # Ensure input is available
    temp <- input$input_temp
    unit <- input$input_unit
    
    # Convert input to Celsius as the base
    celsius <- switch(unit,
                      "Celsius" = temp,
                      "Fahrenheit" = (temp - 32) * 5/9,
                      "Kelvin" = temp - 273.15)
    
    # Convert from Celsius to all units
    fahrenheit <- (celsius * 9/5) + 32
    kelvin <- celsius + 273.15
    
    list(
      Celsius = round(celsius, 2),
      Fahrenheit = round(fahrenheit, 2),
      Kelvin = round(kelvin, 2)
    )
  })
  
  # Output the converted temperatures
  output$celsius <- renderText({
    paste("Celsius: ", convert_temp()$Celsius)
  })
  
  output$fahrenheit <- renderText({
    paste("Fahrenheit: ", convert_temp()$Fahrenheit)
  })
  
  output$kelvin <- renderText({
    paste("Kelvin: ", convert_temp()$Kelvin)
  })
}
