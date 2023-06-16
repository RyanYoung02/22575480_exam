

plot_daily_cloud_cover <- function(data) {
    london_weather_2020 <- data %>% filter(date >= "2020-01-01")

    a <- ggplot(london_weather_2020, aes(x = date, y = cloud_cover)) +
        geom_bar(stat = "identity", fill = "steelblue") +
        labs(title = "Daily Cloud Cover",
             x = "Days", y = "Cloud Cover") +
        theme_minimal()

    return(a)
}
