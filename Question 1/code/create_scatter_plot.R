


create_scatter_plot <- function(covid_data) {
    # Aggregate the data
    aggregated_data <- covid_data %>%
        group_by(location) %>%
        slice(n())

    # Create the scatter plot
    c<-ggplot(aggregated_data, aes(x = total_deaths_per_million, y =life_expectancy)) +
        geom_point(size = 1) +
        geom_smooth(method = "lm", se = FALSE) +
        labs(x = "COVID Deaths per Million", y = "Country's Life expectancy") +
        ggtitle("COVID Deaths by Life expectancy") +
        theme_minimal()
    c

}