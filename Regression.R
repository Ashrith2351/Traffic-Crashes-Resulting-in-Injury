library(ggplot2) 
library(dplyr)
library(tidyr) 
library(car)
library(lmtest)
df <- Traffic_Crashes_Resulting_in_Injury_Cleaned

# Convert Collision_Severity to a numerical variable (you might need a more meaningful conversion)
df$Collision_Severity_Num <- as.numeric(factor(df$Collision_Severity, levels = c("Fatal", "Injury (Complaint Of Pain)", "Injury (Other Visible)")))

# Summary statistics
summary(df)

# Box plot
ggplot(df, aes(x = Collision_Severity, y = Number_Injured)) +
  geom_boxplot(fill = "lightblue") +
  labs(title = "Box Plot of Number of Injuries by Collision Severity",
       x = "Collision Severity",
       y = "Number of Injuries")

# Linear regression model
model <- lm(Number_Injured ~ Collision_Severity_Num, data = df)

# Summary of the regression model
summary(model)

# Visualization
ggplot(df, aes(x = Collision_Severity_Num, y = Number_Injured)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "Regression Line for Number of Injuries",
       x = "Collision Severity (Numeric)",
       y = "Number of Injuries")


# scatter plot for linearity check
ggplot(df, aes(x = Collision_Severity_Num, y = Number_Injured)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "Scatter Plot for Linearity Check", x = "Collision_Severity", y = "Number_Injured")

# Predictions using the linear regression model
df$Predicted_Number_Injured <- predict(model, newdata = df)

# Display the first few rows of the dataset with predicted values
head(df[, c("Number_Injured", "Predicted_Number_Injured")])

# Scatter plot with actual and predicted values
ggplot(df, aes(x = Collision_Severity_Num, y = Number_Injured)) +
  geom_point(color = "black", alpha = 0.7) +
  geom_line(aes(y = Predicted_Number_Injured), color = "blue", size = 1) +
  labs(title = "Actual vs. Predicted Number of Injuries",
       x = "Collision Severity (Numeric)",
       y = "Number of Injuries") +
  theme_minimal()


}