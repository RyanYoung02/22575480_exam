plot_daily_sunshine<-function(london_weather){
london_weather_2020 <- london_weather%>% filter(date >= "2020-01-01")

c<-ggplot(london_weather_2020, aes(x = date, y = sunshine)) +
    geom_bar(stat = "identity", fill = "steelblue") +
    geom_hline(yintercept = 9, color = "red", linetype = "dashed") +
    labs(title = "Daily Sunshine",
         x = "Days", y = " Hours of Sun Shine") +
    theme_minimal()

c

}
