



library(ggplot2)

plot_live_vs_nonlive_tempo <- function(data) {
    # Create a new column to indicate if the song is sung live or not
    data$is_live <- grepl("Live", data$name)

    # Calculate the mean tempo for live and non-live songs
    mean_tempo_live <- mean(data$tempo[data$is_live])
    mean_tempo_non_live <- mean(data$tempo[!data$is_live])

    # Create the plot
    plot <- ggplot(data, aes(x = is_live, y = tempo, fill = is_live)) +
        geom_boxplot(outlier.colour = "gray20", outlier.shape = 16, outlier.size = 2) +
        scale_fill_manual(values = c("steelblue", "orange")) +
        labs(x = "Live or Not", y = "Tempo") +
        ggtitle("Comparison of Tempo: Live vs. Non-Live Songs") +
        theme_minimal() +
        theme(plot.title = element_text(face = "bold", size = 14),
              axis.title = element_text(face = "bold", size = 12),
              axis.text = element_text(size = 10),
              legend.title = element_blank(),
              legend.position = "bottom",
              panel.grid = element_blank(),
              plot.background = element_rect(fill = "white"),
              panel.background = element_rect(fill = "white"),
              legend.background = element_rect(fill = "white"),
              legend.text = element_text(color = "white"),
              legend.key = element_rect(color = "white"),
              axis.line = element_line(color = "white"),
              axis.ticks = element_line(color = "white")) +
        scale_x_discrete(labels = c("Not Live", "Live"))

    return(plot)
}


