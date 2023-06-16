library(ggplot2)
library(dplyr)

netflix_year<-netflix%>%
    group_by(release_year)
movie_counts <- netflix_year %>% count(release_year)
# Create the bar plot
ggplot(movie_counts, aes(x = release_year, y = n)) +
    geom_bar(stat = "identity", fill = "steelblue") +
    labs(x = "Year", y = "Number of Movies Released",
         title = "Number of Movies Released per Year") +
    theme_minimal()

library(ggplot2)

library(ggplot2)

library(ggplot2)

# Calculate the average rating per year
average_rating <- netflix_year %>%
    summarise(average_rating = mean(tmdb_popularity, na.rm = TRUE))

# Create the bar plot
ggplot(movie_counts, aes(x = release_year, y = n)) +
    geom_bar(stat = "identity", fill = "steelblue") +
    geom_line(data = average_rating, aes(x = release_year, y = average_rating), color = "red", size = 1.5) +
    labs(x = "Year", y = "Number of Movies Released",
         title = "Number of Movies Released per Year") +
    theme_minimal() +
    scale_y_continuous(sec.axis = sec_axis(trans = ~., name = "Average Rating", breaks = seq(0, 600, by = 100)))

