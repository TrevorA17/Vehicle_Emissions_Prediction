# Create a directory named "models" if it doesn't exist
if (!file.exists("./models")) {
  dir.create("./models")
}

# Saving the linear regression model
saveRDS(model_lm, file = "./models/linear_regression_model.rds")

# Load the saved linear regression model
loaded_linear_regression_model <- readRDS("./models/linear_regression_model.rds")

# Prepare new data for prediction
new_data <- data.frame(
  Vehicle_ID = 1,
  Engine_Size = c(2.0, 2.5, 1.8),  # Example Engine_Size values
  Cylinders = c("4", "6", "4"),  # Example Cylinders values
  Fuel_Type = c("Gasoline", "Diesel", "Gasoline"),  # Example Fuel_Type values
  City_MPG = c(25, 20, 28),  # Example City_MPG values
  Highway_MPG = c(32, 28, 35)  # Example Highway_MPG values
)

# Use the loaded model to make predictions for new data
predictions_loaded_model <- predict(loaded_linear_regression_model, newdata = new_data)

# Print predictions
print(predictions_loaded_model)
