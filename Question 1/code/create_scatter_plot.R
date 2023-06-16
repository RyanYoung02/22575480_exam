


create_scatter_plot <- function(data, x_var, y_var) {
    # Aggregate the data
    aggregated_data <- data %>%
        group_by(location) %>%
        summarize(mean_x = mean({{ x_var }}, na.rm = TRUE),
                  mean_y = mean({{ y_var }}, na.rm = TRUE))

    # Create the scatter plot
    c<-ggplot(aggregated_data, aes(x = mean_x, y = mean_y)) +
        geom_point(size = 1) +
        geom_smooth(method = "lm", se = FALSE) +
        labs(x = deparse(substitute(x_var)), y = deparse(substitute(y_var))) +
        ggtitle("COVID Deaths by Life Expectancy") +
        theme_minimal() +
        scale_x_continuous(limits = c(0, 3000)) +
        scale_y_continuous(limits = c(50, NA))
    c
}

