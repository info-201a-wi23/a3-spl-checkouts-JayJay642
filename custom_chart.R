library(ggplot2)
library(scales)
library(dplyr)
file <- "/Users/jaylenjohnson/INFO-201/2017-2023-10-Checkouts-SPL-Data.csv"
checkout_data <- read.csv(file)
checkout_data_final_2 <- checkout_data %>% filter(MaterialType %in% c("AUDIOBOOK", "BOOK", "EBOOK", "MOVIE"))

ggplot(data = checkout_data_final_2) +
  geom_col(
    aes(
      x = MaterialType,
      y = Checkouts,
      fill = MaterialType
    )
  ) + 
  labs(
    title = "Number of Total Checkouts",
    subtitle = "Source: 2017-2023-10-Checkouts-SPL-Data.csv",
    x = "Checkouts by Type of Material",
    y = "Number of Checkouts",
    fill = "Material Type"
  ) +
  scale_y_continuous(
    labels = label_number_si()
  )