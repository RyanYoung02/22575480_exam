
plot_average_scores <- function(data) {
    # Filter the data for movies released after 2000
    data_filtered <- data %>%
        filter(release_year > 2000)

    # Calculate the average IMDb score per year
    imdb_scores <- data_filtered %>%
        group_by(release_year) %>%
        summarise(average_imdb_score = mean(imdb_score, na.rm = TRUE))

    # Calculate the average TMDB score per year
    tmdb_scores <- data_filtered %>%
        group_by(release_year) %>%
        summarise(average_tmdb_score = mean(tmdb_score, na.rm = TRUE))

    # Create the line chart for both scores
    ggplot() +
        geom_line(data = imdb_scores, aes(x = release_year, y = average_imdb_score, color = "IMDB"), size = 1) +
        geom_line(data = tmdb_scores, aes(x = release_year, y = average_tmdb_score, color = "TMDB"), size = 1) +
        labs(x = "Year", y = "Average Score",
             title = "Average IMDB and TMDB Scores per Year (After 2000)",
             color = "Score Type") +
        theme_minimal()
}
