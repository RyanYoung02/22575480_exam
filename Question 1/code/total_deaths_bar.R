#Calculate the mean of total deaths per million by continent
total_deaths_bar<-function(covid_data){region_data <- covid_data %>%
    group_by(continent) %>%
    summarise(mean_total_deaths_per_million = mean(total_deaths_per_million, na.rm = TRUE))

# Create the bar chart
b<-ggplot(region_data, aes(x = continent, y = mean_total_deaths_per_million)) +
    geom_bar(stat = "identity", fill = "steelblue") +
    labs(title = "Mean Total Deaths per Million by Continent",
         x = "Continent", y = "Mean Total Deaths per Million") +
    theme_minimal()
b
}