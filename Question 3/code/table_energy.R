create_top_songs_table <- function(data, top_n) {
    library(knitr)
    # Sort the songs by energy in descending order
    sorted_data <- data[order(-data$energy), ]

    # Select the top N songs
    top_songs <- head(sorted_data, top_n)

    # Create a table with the top songs
    table <- kable(top_songs[, c("name", "artist", "energy")], col.names = c("Song", "Artist", "Energy"))

    # Return the table
    return(table)
}



