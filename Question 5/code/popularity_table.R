library(dplyr)
library(huxtable)
library(scales)



get_average_ratings_downloads <- function(data) {
    # Calculate the average rating and average downloads by category
    avg_ratings_downloads <- data %>%
        group_by(Category) %>%
        summarise(Average_Rating = mean(Rating, na.rm = TRUE),
                  Average_Downloads = mean(Installs))

    # Format the average downloads column as normal numbers
    avg_ratings_downloads <- avg_ratings_downloads %>%
        mutate(Average_Downloads = comma(Average_Downloads))

    # Sort the table by average downloads in descending order
    avg_ratings_downloads <- avg_ratings_downloads %>%
        arrange(desc(Average_Downloads))

    # Return the table as a data frame
    return(avg_ratings_downloads)
}

