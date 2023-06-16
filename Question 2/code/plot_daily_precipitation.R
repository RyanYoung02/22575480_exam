plot_daily_precipitation<-function(london_weather){
london_weather_2020 <- london_weather%>% filter(date >= "2020-01-01")

 b<-ggplot(london_weather_2020, aes(x = date, y = precipitation)) +
        geom_bar(stat = "identity", fill = "steelblue") +
        labs(title = "Daily Precipitation",
             x = "Days", y = "Precipitation") +
        theme_minimal() +
        scale_y_continuous(limits = c(0, 20))

b
}
