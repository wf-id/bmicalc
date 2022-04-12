## code to prepare `DATASET` dataset goes here

library(rvest)
library(tidyverse)
# 0 - 36 Months
wt_036 <- session("https://www.cdc.gov/growthcharts/html_charts/wtageinf.htm")
wt_3_20 <- session("https://www.cdc.gov/growthcharts/html_charts/wtage.htm")

o <- wt_036 %>%
  html_table(fill = TRUE) %>%
  set_names(c("Male", "Female")) %>%
  dplyr::bind_rows(.id = "SexDSC") %>%
  janitor::clean_names() %>%
  gather(metric, value, -sex_dsc, -age_in_months)

infants <- o %>%
  mutate(percentile = as.numeric(stringr::str_extract(string = metric, pattern = "\\d+")))

adolescent <- wt_3_20 %>%
  html_table(fill = TRUE) %>%
  set_names(c("Male", "Female")) %>%
  dplyr::bind_rows(.id = "SexDSC") %>%
  janitor::clean_names() %>%
  gather(metric, value, -sex_dsc, -age_in_months) %>%
  mutate(percentile = as.numeric(stringr::str_extract(string = metric, pattern = "\\d+")))

weight_percentiles <- infants %>%
  bind_rows(adolescent) %>%
  mutate(age_in_years = age_in_months/12) %>%
  unique()

usethis::use_data(weight_percentiles, overwrite = TRUE)
