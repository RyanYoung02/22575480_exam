filter_songs <- function(data) {
    refined_data <- data[!grepl("Live", data$name) & !grepl("Remastered", data$name), ]
    return(refined_data)
}

