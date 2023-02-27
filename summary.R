library(dplyr)
file <- "/Users/jaylenjohnson/INFO-201/2017-2023-10-Checkouts-SPL-Data.csv"
checkout_data <- read.csv(file)

compute_summary_info <- function(checkout_data) {
  summary_info <- list()
  summary_info$largest_material <- checkout_data %>%
    filter(MaterialType == "BOOK") %>%
    summarize(num = sum(Checkouts)) %>%
    pull(num)
  
  summary_info$smallest_material <- checkout_data %>%
    filter(MaterialType == "MOVIE") %>%
    summarize(num = sum(Checkouts)) %>%
    pull(num)
  
  summary_info$largest_book_material_in_year <- checkout_data %>%
    filter(MaterialType == "BOOK") %>%
    group_by(CheckoutYear) %>%
    summarize(num = sum(Checkouts)) %>% 
    summarize(highest = max(num)) %>%
    pull(highest)
  
  summary_info$largest_ebook_material_in_year <- checkout_data %>%
    filter(MaterialType == "EBOOK") %>%
    group_by(CheckoutYear) %>%
    summarize(num = sum(Checkouts)) %>% 
    summarize(highest = max(num)) %>%
    pull(highest)
  
  summary_info$largest_digital_checkout_in_year <- checkout_data %>%
    filter(UsageClass == "Digital") %>%
    group_by(CheckoutYear) %>%
    summarize(num = sum(Checkouts)) %>% 
    summarize(highest = max(num)) %>%
    pull(highest)
  
  return(summary_info)
}

summary_info <- compute_summary_info(checkout_data)