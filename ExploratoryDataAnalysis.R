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

# Measures of Distribution
range_engine_size <- range(vehicle_data$Engine_Size)
var_engine_size <- var(vehicle_data$Engine_Size)
sd_engine_size <- sd(vehicle_data$Engine_Size)

range_city_mpg <- range(vehicle_data$City_MPG)
var_city_mpg <- var(vehicle_data$City_MPG)
sd_city_mpg <- sd(vehicle_data$City_MPG)

range_highway_mpg <- range(vehicle_data$Highway_MPG)
var_highway_mpg <- var(vehicle_data$Highway_MPG)
sd_highway_mpg <- sd(vehicle_data$Highway_MPG)

range_co2_emissions <- range(vehicle_data$CO2_Emissions)
var_co2_emissions <- var(vehicle_data$CO2_Emissions)
sd_co2_emissions <- sd(vehicle_data$CO2_Emissions)

print(paste("Range Engine Size:", range_engine_size))
print(paste("Variance Engine Size:", var_engine_size))
print(paste("Standard Deviation Engine Size:", sd_engine_size))

print(paste("Range City MPG:", range_city_mpg))
print(paste("Variance City MPG:", var_city_mpg))
print(paste("Standard Deviation City MPG:", sd_city_mpg))

print(paste("Range Highway MPG:", range_highway_mpg))
print(paste("Variance Highway MPG:", var_highway_mpg))
print(paste("Standard Deviation Highway MPG:", sd_highway_mpg))

print(paste("Range CO2 Emissions:", range_co2_emissions))
print(paste("Variance CO2 Emissions:", var_co2_emissions))
print(paste("Standard Deviation CO2 Emissions:", sd_co2_emissions))

# Measures of Relationship
correlation_matrix <- cor(vehicle_data[, sapply(vehicle_data, is.numeric)])

print("Correlation Matrix:")
print(correlation_matrix)

# Scatter plot matrix
pairs(vehicle_data[, sapply(vehicle_data, is.numeric)], main = "Scatter Plot Matrix")

