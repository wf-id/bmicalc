
<!-- README.md is generated from README.Rmd. Please edit that file -->

# bmicalc

<!-- badges: start -->

[![Codecov test
coverage](https://codecov.io/gh/wf-id/bmicalc/branch/main/graph/badge.svg)](https://app.codecov.io/gh/wf-id/bmicalc?branch=main)
[![R-CMD-check](https://github.com/wf-id/bmicalc/workflows/R-CMD-check/badge.svg)](https://github.com/wf-id/bmicalc/actions)
<!-- badges: end -->

The goal of bmicalc is to facilitate the rapid assignment of growth
percentiles by key demographics. Currently only weight is implemented.

## Installation

You can install the development version of bmicalc from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("wf-id/bmicalc")
```

## Example

This is a basic example which shows you how to calculate the weight
percentile for an individual:

``` r
library(bmicalc)

generate_weight_percentile(sex = "Female", age = 2, weight = 12)
#> [1] 48.32495
```

If you are at the extremes, you will get a warning message:

``` r
generate_weight_percentile(sex = "Female", age = 2, weight = 2000)
#> Warning: The weight, age, and sex you have entered is above the threshold for
#> calculation and is left as 99.9
#> [1] 99.9
```

``` r
generate_weight_percentile(sex = "Female", age = 2, weight = 0.1)
#> Warning: The weight, age, and sex you have entered is below the threshold for
#> calculation and is left NA
#> [1] NA
```
