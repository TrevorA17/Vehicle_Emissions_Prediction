# Load necessary libraries
library(caret)

# Load dataset
vehicle_data <- read.csv("data/vehicle_data_large.csv", colClasses = c(
  Vehicle_ID = "integer",
  Engine_Size = "numeric",
  Cylinders = "factor",
  Fuel_Type = "factor",
  City_MPG = "numeric",
  Highway_MPG = "numeric",
  CO2_Emissions = "numeric"
))

# Split data into training and testing sets
set.seed(123) # for reproducibility
trainIndex <- createDataPartition(vehicle_data$CO2_Emissions, p = .7, 
                                  list = FALSE, 
                                  times = 1)
trainData <- vehicle_data[trainIndex, ]
testData <- vehicle_data[-trainIndex, ]

# Print the dimensions of the training and testing sets
print("Dimensions of Training Data:")
print(dim(trainData))
print("Dimensions of Testing Data:")
print(dim(testData))

# Bootstrapping
set.seed(123) # for reproducibility
boot_samples <- createResample(trainData$CO2_Emissions, times = 1000)

# Example of using bootstrap samples to calculate mean and its confidence interval
boot_means <- sapply(boot_samples, function(indices) {
  mean(trainData$CO2_Emissions[indices])
})

# Calculate the bootstrap confidence interval
boot_mean <- mean(boot_means)
boot_ci <- quantile(boot_means, c(0.025, 0.975))

print(paste("Bootstrap Mean:", boot_mean))
print(paste("Bootstrap 95% CI:", boot_ci))

# k-Fold Cross-Validation
set.seed(123) # for reproducibility
train_control <- trainControl(method = "cv", number = 10) # 10-fold cross-validation

# Train the model using k-fold cross-validation
model_cv <- train(CO2_Emissions ~ Engine_Size + Cylinders + Fuel_Type + City_MPG + Highway_MPG, 
                  data = trainData, 
                  method = "lm", 
                  trControl = train_control)

# Print cross-validation results
print(model_cv)

# Predict on the test data
predictions_cv <- predict(model_cv, testData)

# Evaluate model performance
rmse_cv <- sqrt(mean((testData$CO2_Emissions - predictions_cv)^2))
r_squared_cv <- cor(predictions_cv, testData$CO2_Emissions)^2

print(paste("RMSE:", rmse_cv))
print(paste("R-squared:", r_squared_cv))

