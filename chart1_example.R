library(ggplot2)
library(scales)
library(dplyr)
file <- "/Users/jaylenjohnson/INFO-201/2017-2023-10-Checkouts-SPL-Data.csv"
checkout_data <- read.csv(file)
checkout_data_final <- checkout_data %>% filter(MaterialType %in% c("BOOK", "EBOOK"))

ggplot(data = checkout_data_final) +
  geom_col(
    aes(
      x = CheckoutYear,
      y = Checkouts,
      fill = MaterialType
    )
  ) + 
  labs(
    title = "Number of Checkouts Each Year",
    subtitle = "Source: 2017-2023-10-Checkouts-SPL-Data.csv",
    x = "Checkout Year",
    y = "Number of Checkouts",
    fill = "Checkout Type"
  ) +
  scale_y_continuous(
    labels = label_number_si()
  )
