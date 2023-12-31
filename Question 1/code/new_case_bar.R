


library(ggplot2)
library(dplyr)
library(scales)

plot_mean_cases_per_million <- function(covid_data) {
    # Aggregate data by location and keep only the latest observation
    aggregated_data <- covid_data %>%
        group_by(location) %>%
        slice(n())

    # Calculate the mean of total_cases_per_million by continent
    region_data <- aggregated_data %>%
        filter(!is.na(continent) & continent != "") %>%
        group_by(continent) %>%
        summarise(mean_total_cases_per_million = mean(total_cases_per_million, na.rm = TRUE))

    # Create the bar chart with different colors for each continent
    ggplot(region_data, aes(x = continent, y = mean_total_cases_per_million, fill = continent)) +
        geom_bar(stat = "identity") +
        labs(title = "Mean Total Cases per Million by Continent",
             x = "Continent", y = "Mean Total Cases per Million") +
        theme_minimal() +
        scale_y_continuous(labels = comma) +
        theme(axis.text.x = element_blank())
}

