

# Calculate the mean of new_cases_per_million by continent
new_case_bar<-function(covid_data){region_data <- covid_data %>%
    group_by(continent) %>%
    slice(n())
    summarise(mean_new_cases_per_million = mean(new_cases_per_million, na.rm = TRUE))

# Create the bar chart
a<-ggplot(region_data, aes(x = continent, y = mean_new_cases_per_million)) +
    geom_bar(stat = "identity", fill = "steelblue") +
    labs(title = "Mean New Cases per Million by Continent",
         x = "Continent", y = "Mean New Cases per Million") +
    theme_minimal()
a
}