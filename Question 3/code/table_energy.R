


  library(knitr)

  create_top_songs_table <- function(spotify_data, num_songs) {
      # Sort the songs by energy in descending order
      spotify_sorted <- spotify_data[order(-spotify_data$energy), ]

      # Select the top N songs
      top_songs <- head(spotify_sorted, num_songs)

      # Create a table with the top songs
      table <- kable(top_songs[, c("name", "artist", "energy")], col.names = c("Song", "Artist", "Energy"))

      return(table)
  }
