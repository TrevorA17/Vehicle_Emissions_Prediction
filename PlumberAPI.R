# Load necessary libraries
library(plumber)

# Load the saved linear regression model
loaded_linear_regression_model <- readRDS("./models/linear_regression_model.rds")

#* @apiTitle CO2 Emissions Prediction Model API
#* @apiDescription Used to predict CO2 emissions using linear regression.

#* @post /predict_CO2_emissions
#* @param Engine_Size Numeric: Engine size
#* @param Cylinders Numeric: Number of cylinders
#* @param Fuel_Type Factor: Type of fuel (e.g., "Gasoline", "Diesel")
#* @param City_MPG Numeric: City MPG
#* @param Highway_MPG Numeric: Highway MPG
#* @serializer unboxedJSON
predict_CO2_emissions <- function(Engine_Size, Cylinders, Fuel_Type, City_MPG, Highway_MPG) {
  # Prepare the input data
  new_data <- data.frame(
    Engine_Size = as.numeric(Engine_Size),
    Cylinders = as.numeric(Cylinders),
    Fuel_Type = as.factor(Fuel_Type),
    City_MPG = as.numeric(City_MPG),
    Highway_MPG = as.numeric(Highway_MPG)
  )
  
  # Use the loaded model to make predictions
  prediction <- predict(loaded_linear_regression_model, newdata = new_data)
  
  # Return the prediction
  return(as.character(prediction))
}


