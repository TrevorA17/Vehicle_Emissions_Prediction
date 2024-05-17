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
