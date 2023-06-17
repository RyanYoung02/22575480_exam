library(ggplot2)

create_bubble_chart <- function(data) {
    # Convert "Installs" column to numeric
    data$installs <- as.numeric(gsub("[+,]", "", data$Installs))
    # Convert "Size" column to numeric
    data$size <- as.numeric(gsub("[M,]", "", data$Size))


    gg<-ggplot(data(), aes(x = Rating, y = size, size = Installs)) +
        geom_point(alpha = 0.1) +
        scale_x_continuous(labels = scales::comma, limits = c(0, 5)) +  # Adjust the x-axis limits
        labs(x = "Rating", y = "Size (MB)", title = "App Downloads vs Size") +
        theme_minimal() +
        scale_size(guide = guide_legend(override.aes = list(size = 3)))  # Adjust the size of example bubbles in the legend


    return(gg)
}


