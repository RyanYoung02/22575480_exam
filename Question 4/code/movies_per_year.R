

plot_movies_released <- function(data) {
    netflix_year <- data %>% group_by(release_year)
    movie_counts <- netflix_year %>% count(release_year)

    # Create the bar plot
    ggplot(movie_counts, aes(x = release_year, y = n)) +
        geom_bar(stat = "identity", fill = "steelblue") +
        labs(x = "Year", y = "Number of Shows Released",
             title = "Number of Shows Released per Year") +
        theme_minimal()
}

