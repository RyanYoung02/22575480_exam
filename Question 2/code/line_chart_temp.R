

plot_daily_min_temperature <- function(data) {
    london_weather_2020 <- data %>% filter(date >= "2020-01-01")

    a <- ggplot(london_weather_2020, aes(x = date, y = min_temp)) +
        geom_smooth(method = "loess", se = FALSE, color = "steelblue", span = 0.1) +
        geom_hline(yintercept = 11.4, color = "red", linetype = "dashed") +
        labs(title = "Daily Minimum Temperature",
             x = "Days", y = "Daily Minimum Temperature") +
        theme_minimal()

    return(a)
}



