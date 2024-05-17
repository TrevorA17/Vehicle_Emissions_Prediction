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

# Display the structure of the dataset
str(vehicle_data)

# View the first few rows of the dataset
head(vehicle_data)

# View the dataset in a separate viewer window
View(vehicle_data)

# Measures of Frequency
cylinder_freq <- table(vehicle_data$Cylinders)
fuel_type_freq <- table(vehicle_data$Fuel_Type)

print("Frequency of Cylinders:")
print(cylinder_freq)

print("Frequency of Fuel Type:")
print(fuel_type_freq)

# Measures of Central Tendency
mean_engine_size <- mean(vehicle_data$Engine_Size)
median_engine_size <- median(vehicle_data$Engine_Size)

mean_city_mpg <- mean(vehicle_data$City_MPG)
median_city_mpg <- median(vehicle_data$City_MPG)

mean_highway_mpg <- mean(vehicle_data$Highway_MPG)
median_highway_mpg <- median(vehicle_data$Highway_MPG)

mean_co2_emissions <- mean(vehicle_data$CO2_Emissions)
median_co2_emissions <- median(vehicle_data$CO2_Emissions)

print(paste("Mean Engine Size:", mean_engine_size))
print(paste("Median Engine Size:", median_engine_size))

print(paste("Mean City MPG:", mean_city_mpg))
print(paste("Median City MPG:", median_city_mpg))

print(paste("Mean Highway MPG:", mean_highway_mpg))
print(paste("Median Highway MPG:", median_highway_mpg))

print(paste("Mean CO2 Emissions:", mean_co2_emissions))
print(paste("Median CO2 Emissions:", median_co2_emissions))

