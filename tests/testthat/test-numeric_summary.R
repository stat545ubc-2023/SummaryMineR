library(testthat)
library(SummaryMineR)
library(gapminder)  # Load the gapminder dataset

# Make a custom df with NA values to do the second test:
NA_df <- gapminder
set.seed(1) # Set seed for reproducibility
NA_df$gdpPercap[sample(1:nrow(NA_df), 10)] <- NA # Add NA values to 10 random rows

test_that("numeric_summary function works as expected", {
  # Test 1: Check if the function works with a numeric column without NA values
  expect_equal(numeric_summary(gapminder, "pop")$Count, 1704)

  # Test 2: Check if the function works with a numeric column with NA values
  expect_true(!is.na(numeric_summary(NA_df, "gdpPercap")$Mean))

  # Test 3: Check if the function handles non-numeric columns and throws an error
  expect_error(numeric_summary(gapminder, "country"))
})
