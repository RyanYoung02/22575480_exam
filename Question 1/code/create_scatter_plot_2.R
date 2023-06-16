create_scatter_plot_2 <- function(covid_data) {
    # Aggregate the data
    aggregated_data <- covid_data %>%
        group_by(location) %>%
        slice(n())

    # Create the scatter plot
    d<-ggplot(aggregated_data, aes(x = total_deaths_per_million, y = aged_65_older)) +
        geom_point(size = 1) +
        geom_smooth(method = "lm", se = FALSE) +
        labs(x = "COVID Deaths per Million", y = "Percent of population over 65") +
        ggtitle("COVID Deaths by Percent of population over 65") +
        theme_minimal()
d

}