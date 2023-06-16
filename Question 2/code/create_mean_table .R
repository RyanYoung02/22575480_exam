library(huxtable)

create_mean_table <- function(london_weather) {
    london_weather_2020.frame <- london_weather%>% filter(date >= "2020-01-01")
    # Calculate the mean values for each variable
    mean_values <- london_weather_2020.frame(
        Mean_Precipitation = mean(london_weather_2020$precipitation),
        Mean_Cloud_Cover = mean(london_weather_2020$cloud_cover),
        Mean_Sunshine = mean(london_weather_2020$sunshine),
        Mean_Temperature = mean(london_weather_2020$mean_temp)
    )

    # Create a huxtable object with the mean values
    ht <- hux(mean_values)

    return(ht)
}

# Usage:
mean_table <- create_mean_table(london_weather)
print(mean_table)