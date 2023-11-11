
# SummaryMineR

SummaryMineR is an R package designed to give relevant summary data from
a dataset. In particular, it gives the counts, mean, median, and
standard deviations (where applicable). SummaryMineR is designed to work
even if the data is not numeric. In this case, it would at least give a
count of the non-numeric data (eg. the amount of a non-numeric value in
the data set).

## Installation

You can install SummaryMineR from the UBC STAT545 github repository:

``` r
install.packages("devtools")
devtools::install_github("stat545ubc-2023/SummaryMineR")
```

## How to use this package

SummaryMineR currently only has one function: **numeric_summary()**

This function calculates the different summary statistics (eg.count,
mean, median, and standard deviation) of numeric values in the specified
column of a data frame. In the case of non-numeric values, it would at
least get counts.

``` r
# Load SummaryMineR
library(SummaryMineR)

# Load gapminder dataset
library(gapminder)
#> Warning: package 'gapminder' was built under R version 4.2.3

# Use function to determine the summary stats for the population column of the gapminder data set
populationStats <- numeric_summary(gapminder, "pop")

# View results
populationStats
#> $Count
#> [1] 1704
#> 
#> $Mean
#> [1] 29601212
#> 
#> $Median
#> [1] 7023596
#> 
#> $Standard_Deviation
#> [1] 106157897
```

As you can see, the numeric_summary function gives the count data, mean,
median and standard deviations for the population column of the
gapminder dataset.

Note that columns should ideally be numeric in order use the function at
its full potential.
