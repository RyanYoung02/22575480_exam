coldplay$band <- "Coldplay"
metallica$band <- "Metallica"
coldplay_refined <- coldplay[!grepl("Live", coldplay$name), ]
metallica_refined <- metallica[!grepl("Live", metallica$name) & !grepl("Remastered", metallica$name), ]

coldplay$release_date <- as.Date(coldplay$release_date)

ggplot(coldplay, aes(x = release_date, y = popularity)) +

    geom_smooth(method = "loess", se = FALSE) +  # Add a smoother line using the loess method
    labs(x = "Release Date", y = "Popularity", title = "Popularity Over Time") +
    theme_minimal() +
    theme(plot.title = element_text(face = "bold", size = 14),
          axis.title = element_text(face = "bold", size = 12),
          axis.text = element_text(size = 10),
          axis.text.x = element_text(angle = 90, hjust = 1)) +
    scale_x_date(date_labels = "%Y-%m-%d")