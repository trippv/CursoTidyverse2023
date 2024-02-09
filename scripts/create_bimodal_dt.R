# Set seed for reproducibility
set.seed(123)

# Unimodal distribution
unimodal_data <- rnorm(50, mean = 10, sd = 1.5)

# Bimodal distribution
bimodal_data <- c(rnorm(35, mean = 8.5, sd = 0.5), rnorm(15, mean = 12, sd = 0.3))


# Create histograms
par(mfrow=c(1,2)) # Set up a 1x2 grid for side-by-side plots

hist(unimodal_data, main="Unimodal Distribution", xlab="Values", col="lightblue", border="black")
hist(bimodal_data, main="Bimodal Distribution", xlab="Values", col="lightgreen", border="black")



tidy_data <- data.frame(
  Value = c(unimodal_data, bimodal_data),
  Distribution = rep(c("Unimodal", "Bimodal"), each = 50)
)


ggplot(tidy_data, aes(x = Distribution, y = Value))+
  geom_point()


mean(bimodal_data)
mean(unimodal_data)

sd(bimodal_data)
sd(unimodal_data)


# Calculate mean and standard deviation for each distribution
summary_data <- data.frame(
  Distribution = c("Unimodal", "Bimodal"),
  Mean = c(mean(unimodal_data), mean(bimodal_data)),
  SD = c(sd(unimodal_data), sd(bimodal_data))
)

# Plot with ggplot2
ggplot(summary_data, aes(x = Distribution, y = Mean, fill = Distribution)) +
  geom_bar(stat = "identity", position = "dodge", color = "black", width = 0.6) +
  geom_errorbar(aes(ymin = Mean - SD, ymax = Mean + SD), position = position_dodge(width = 0.6), width = 0.2) +
  labs(title = "Mean and Standard Deviation Comparison",
       x = "Distribution",
       y = "Value") +
  theme_minimal()


# export data
write.table(tidy_data, file = "data/datos_demo.csv", sep = ",")
