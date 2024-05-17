# Load necessary libraries
library(caret)
library(randomForest)

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
