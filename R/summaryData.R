#' Generate summary statistics
#'
#' This function calculates the different summary statistics (eg.count, mean, median, and standard deviation) of numeric values
#' in the specified column of a data frame. In the case of non-numeric values, it would at least get counts.
#'
#' @param data A data frame containing the column to be summarized (e.g., gapminder dataset). I named this data because it seems to be a
#' very common name for the object even for other functions in other packages.
#' @param column_name The name of the column in the data frame to be summarized.
#' @return The count, mean, median, and standard deviation of numeric values.
#'
#' @import gapminder
#' @import tidyverse
#' @importFrom stats na.omit median sd
#'
#' @examples
#' library(gapminder)
#' numeric_summary(gapminder, "pop")
#' numeric_summary(gapminder, "gdpPercap")
#'
#' @export


numeric_summary <- function(data, column_name) {
  # Check if the input data is a data frame
  if (!is.data.frame(data)) {
    stop("Input must be a data frame.")
  }

  # Check if the input column exists in the data frame
  if (!column_name %in% names(data)) {
    stop("Specified column does not exist in the data frame.")
  }

  # Extract numeric values from the specified column, excluding NA values
  numeric_values <- na.omit(data[[column_name]])

  # Check if the column contains numeric data
  if (length(numeric_values) == 0) {
    stop("Specified column does not contain numeric data.")
  }

  # Calculate summary statistics with NA values removed
  summary_stats <- list(
    Count = length(numeric_values),
    Mean = mean(numeric_values, na.rm = TRUE),
    Median = median(numeric_values, na.rm = TRUE),
    Standard_Deviation = sd(numeric_values, na.rm = TRUE)
  )

  # Return the summary statistics
  return(summary_stats)
}
