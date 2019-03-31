library(tidyverse)

# Part one of the mini-exercise

wide_dataset <- tribble(
  ~merchant, ~day1, ~day2, ~day3, ~day4, ~day5,
  "fizzbizz",   9, 3, 5, 1, 6,
  "wizzmizzy",  5, 1, 7, 1, 8,
  "lollipoppy", 4, 9, 2, 7, 1
)

wide_dataset %>% 
  gather(key = "day", value = "frauds_detected")




# Part two of the mini-exercise

long_dataset <- expand.grid(merchant = c("fizzbizz", "wizzmizzy", "lollipoppy"),
                            day = paste0("day", 1:5)) %>% 
  mutate(frauds_detected = floor(runif(n = 15, min = 1, max = 10)))

# modify this using spread to bring it back to a wide form
long_dataset %>% 
  spread(???, ???)


# What would be the proper form to use as a basis of a ggplot2 graph? Why?
