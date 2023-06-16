convert_date_column <- function(data, date_column) {
    data$date <- as.character(data[[date_column]])
    data$date <- as.Date(data[[date_column]], format = "%Y%m%d")
    return(data)
}
