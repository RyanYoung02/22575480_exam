

library(ggplot2)

plot_popularity_over_time <- function(data) {
    data$release_date <- as.Date(data$release_date)

    plot <- ggplot(data, aes(x = release_date, y = popularity)) +
        geom_smooth(method = "loess", se = FALSE, span = 0.50) +
        labs(x = "Release Date", y = "Popularity", title = "Popularity Over Time") +
        theme_minimal() +
        theme(plot.title = element_text(face = "bold", size = 14),
              axis.title = element_text(face = "bold", size = 12),
              axis.text = element_text(size = 10),
              axis.text.x = element_text(angle = 90, hjust = 1)) +
        scale_x_date(date_labels = "%Y-%m-%d") +
        scale_y_continuous(limits = c(0, 60))

    return(plot)
}


