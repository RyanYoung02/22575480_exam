
create_admissions_line_chart <- function(data) {
    # Convert the "date" column to a Date type
    data$date <- as.Date(data$date)

    patient_data <- data %>%
        filter(continent == "Asia") %>%
        group_by(continent, day = as.numeric(date - min(date) + 1)) %>%
        summarise(avg_daily_hosp_admissions_per_million = mean(weekly_hosp_admissions_per_million/7, na.rm = TRUE),
                  avg_daily_icu_admissions_per_million = mean(weekly_icu_admissions_per_million/7, na.rm = TRUE))

    # Create the line chart for Asia
    ggplot(patient_data, aes(x = day)) +
        geom_line(aes(y = avg_daily_hosp_admissions_per_million, color = "Hospital Admissions")) +
        geom_line(aes(y = avg_daily_icu_admissions_per_million, color = "ICU Admissions")) +
        labs(x = "", y = "Number of Daily Admissions per Million",
             title = "Daily Hospital and ICU Admissions per Million in Asia") +
        scale_x_continuous(breaks = NULL, labels = NULL) +
        scale_y_continuous(
            name = "Hospital Admissions",
            labels = comma,
            sec.axis = sec_axis(~ . / 2, name = "ICU Admissions", labels = comma)
        ) +
        theme_minimal() +
        scale_color_manual(values = c("Hospital Admissions" = "steelblue", "ICU Admissions" = "darkorange")) +
        theme(axis.text.x = element_blank(), axis.ticks.x = element_blank()) +
        annotate("text", x = max(patient_data$day), y = -Inf, label = "Days", hjust = 1, vjust = -1)
}


