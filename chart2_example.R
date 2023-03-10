library(ggplot2)
library(scales)
library(dplyr)
file <- "/Users/jaylenjohnson/INFO-201/2017-2023-10-Checkouts-SPL-Data.csv"
checkout_data <- read.csv(file)

ggplot(data = checkout_data) +
  geom_col(
    aes(
      x = CheckoutYear,
      y = Checkouts,
      fill = UsageClass
    )
  ) +
  labs(
    title = "Mediums with the Most Checkouts",
    subtitle = "Source: 2017-2023-10-Checkouts-SPL-Data.csv",
    x = "Checkouts in a Year",
    y = "Number of Checkouts",
    fill = "Color by Medium Type"
  ) +
  scale_y_continuous(
    labels = label_number_si()
  )
