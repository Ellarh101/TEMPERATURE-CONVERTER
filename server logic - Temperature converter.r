# Part 2: Server Logic (Temperature Conversion)
library(shiny)

server <- function(input, output) {
  
  # Reactive expression for temperature conversion
  convert_temp <- reactive({
    req(input$input_temp)  # Ensure input is available
    
    # Retrieve input temperature and unit
    temp <- input$input_temp
    unit <- input$input_unit
    
    # Convert input to Celsius as the base
    celsius <- switch(unit,
                      "Celsius" = temp,
                      "Fahrenheit" = (temp - 32) * 5/9,
                      "Kelvin" = temp - 273.15)
    
    # Convert from Celsius to other units
    fahrenheit <- (celsius * 9/5) + 32
    kelvin <- celsius + 273.15
    
    # Print results to the console for testing and debugging
    print(paste("Input:", temp, unit))
    print(paste("Converted to Celsius:", round(celsius, 2)))
    print(paste("Converted to Fahrenheit:", round(fahrenheit, 2)))
    print(paste("Converted to Kelvin:", round(kelvin, 2)))
    
    # Return the results as a list for UI rendering
    list(
      Celsius = round(celsius, 2),
      Fahrenheit = round(fahrenheit, 2),
      Kelvin = round(kelvin, 2)
    )
  })
  
  # Output the converted temperatures to the UI
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


