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

# ANOVA for CO2 Emissions by Cylinders
anova_cylinders <- aov(CO2_Emissions ~ Cylinders, data = vehicle_data)
summary(anova_cylinders)

# ANOVA for CO2 Emissions by Fuel Type
anova_fuel_type <- aov(CO2_Emissions ~ Fuel_Type, data = vehicle_data)
summary(anova_fuel_type)

# Two-way ANOVA for CO2 Emissions by Cylinders and Fuel Type
anova_two_way <- aov(CO2_Emissions ~ Cylinders * Fuel_Type, data = vehicle_data)
summary(anova_two_way)

# Diagnostic plots for ANOVA models
par(mfrow = c(2, 2)) # Set up the plotting area for multiple plots
plot(anova_cylinders)
plot(anova_fuel_type)
plot(anova_two_way)
par(mfrow = c(1, 1)) # Reset plotting area

library(ggplot2)

# Boxplots to visualize the differences
ggplot(vehicle_data, aes(x = Cylinders, y = CO2_Emissions)) + 
  geom_boxplot() +
  labs(title = "CO2 Emissions by Cylinders", x = "Cylinders", y = "CO2 Emissions")

ggplot(vehicle_data, aes(x = Fuel_Type, y = CO2_Emissions)) + 
  geom_boxplot() +
  labs(title = "CO2 Emissions by Fuel Type", x = "Fuel Type", y = "CO2 Emissions")

ggplot(vehicle_data, aes(x = Cylinders, y = CO2_Emissions, fill = Fuel_Type)) + 
  geom_boxplot() +
  labs(title = "CO2 Emissions by Cylinders and Fuel Type", x = "Cylinders", y = "CO2 Emissions")


# Univariate Plots

# Histograms
p1 <- ggplot(vehicle_data, aes(x = Engine_Size)) + 
  geom_histogram(binwidth = 0.5, fill = "blue", color = "black") + 
  labs(title = "Histogram of Engine Size", x = "Engine Size", y = "Frequency")

p2 <- ggplot(vehicle_data, aes(x = City_MPG)) + 
  geom_histogram(binwidth = 2, fill = "green", color = "black") + 
  labs(title = "Histogram of City MPG", x = "City MPG", y = "Frequency")

p3 <- ggplot(vehicle_data, aes(x = Highway_MPG)) + 
  geom_histogram(binwidth = 2, fill = "purple", color = "black") + 
  labs(title = "Histogram of Highway MPG", x = "Highway MPG", y = "Frequency")

p4 <- ggplot(vehicle_data, aes(x = CO2_Emissions)) + 
  geom_histogram(binwidth = 10, fill = "red", color = "black") + 
  labs(title = "Histogram of CO2 Emissions", x = "CO2 Emissions", y = "Frequency")

# Boxplots
p5 <- ggplot(vehicle_data, aes(y = Engine_Size)) + 
  geom_boxplot(fill = "blue", color = "black") + 
  labs(title = "Boxplot of Engine Size", y = "Engine Size")

p6 <- ggplot(vehicle_data, aes(y = City_MPG)) + 
  geom_boxplot(fill = "green", color = "black") + 
  labs(title = "Boxplot of City MPG", y = "City MPG")

p7 <- ggplot(vehicle_data, aes(y = Highway_MPG)) + 
  geom_boxplot(fill = "purple", color = "black") + 
  labs(title = "Boxplot of Highway MPG", y = "Highway MPG")

p8 <- ggplot(vehicle_data, aes(y = CO2_Emissions)) + 
  geom_boxplot(fill = "red", color = "black") + 
  labs(title = "Boxplot of CO2 Emissions", y = "CO2 Emissions")

library(gridExtra)
# Arrange histograms and boxplots
grid.arrange(p1, p2, p3, p4, nrow = 2, ncol = 2)
grid.arrange(p5, p6, p7, p8, nrow = 2, ncol = 2)

# Multivariate Plots

# Scatter plots
p9 <- ggplot(vehicle_data, aes(x = Engine_Size, y = CO2_Emissions)) + 
  geom_point(color = "blue") + 
  labs(title = "Scatter Plot of CO2 Emissions vs Engine Size", x = "Engine Size", y = "CO2 Emissions")

p10 <- ggplot(vehicle_data, aes(x = City_MPG, y = CO2_Emissions)) + 
  geom_point(color = "green") + 
  labs(title = "Scatter Plot of CO2 Emissions vs City MPG", x = "City MPG", y = "CO2 Emissions")

p11 <- ggplot(vehicle_data, aes(x = Highway_MPG, y = CO2_Emissions)) + 
  geom_point(color = "purple") + 
  labs(title = "Scatter Plot of CO2 Emissions vs Highway MPG", x = "Highway MPG", y = "CO2 Emissions")

# Interaction plots
p12 <- ggplot(vehicle_data, aes(x = Cylinders, y = CO2_Emissions, color = Fuel_Type)) + 
  geom_boxplot() + 
  labs(title = "Interaction Plot of CO2 Emissions by Cylinders and Fuel Type", x = "Cylinders", y = "CO2 Emissions")

library(GGally)
# Pair plots (scatterplot matrix)
pairs_data <- vehicle_data[, sapply(vehicle_data, is.numeric)]
p13 <- ggpairs(pairs_data)

# Arrange scatter plots and interaction plot
grid.arrange(p9, p10, p11, p12, nrow = 2, ncol = 2)

# Display pair plots
print(p13)
