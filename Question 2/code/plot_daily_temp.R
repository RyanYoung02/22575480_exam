
library(ggplot2)
library(dplyr)

plot_mean_temperature <- function(weather_data) {
    london_weather_2020 <- weather_data %>% filter(date >= "2020-01-01")

    ggplot(london_weather_2020, aes(x = date, y = mean_temp, fill = ifelse(mean_temp < 17.5, "steelblue", "red"))) +
        geom_bar(stat = "identity") +
        geom_hline(yintercept = 16, color = "red", linetype = "dashed") +
        labs(title = "Mean Temperature",
             x = "Days", y = "Mean Temperature") +
        scale_fill_identity() +
        theme_minimal()
}








