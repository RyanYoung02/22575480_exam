
get_movie_counts_by_age <- function(data) {
    # Filter out observations with missing age_certification
    netflix_clean <- data %>%
        filter(!is.na(age_certification) & age_certification != "")

    # Count the number of movies per age restriction
    age_counts <- netflix_clean %>%
        count(age_certification) %>%
        filter(!is.na(age_certification) & age_certification != "")

    # Create a huxtable object with the age counts
    ht <- hux(age_counts)

    # Set column names
    colnames(ht) <- c("Age Certification", "Number of Movies")

    # Return the table
    return(ht)
}


