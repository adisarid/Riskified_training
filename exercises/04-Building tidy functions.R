library(tidyverse)

# ==== Basic example for quasiquotation, adopted from Advanced R by Hadley Wickam (https://adv-r.hadley.nz/quasiquotation.html) ====

paste("good", "morning", "riskified!")


cement <- function(...){
  args <- ensyms(...)
  paste(purrr::map(args, as.character), collapse = " ")
}

cement(good, morning, riskified)
cement(good, morning, "riskified!")

company <- "riskified!"

cement(good, morning, company)
cement(good, morning, !!company) # the bang-bang operator ("unquote")


# ==== Example for prop function ====
# The function computes the proportions of ... relative to the grouping variable `group_by_var`.

prop <- function(data, group_by_var, ...){
  grouping_var <- enquo(group_by_var)
  data %>% 
    count(!!grouping_var, ...) %>%
    group_by(!!grouping_var) %>%
    mutate(prop_col = n/sum(n))
}


prop(mtcars, cyl, vs, am)
prop(diamonds, color, clarity) %>% View



# ==== Question 1: simple prop function ====
# Use command+shift+c (or ctrl+shift+c on windows) to uncomment (remove the hash) and start building your function.

# simple_prop <- function(data, ???){
#   prop_vars <- enquos(???)
#   data %>% 
#     count(!!!???) %>% 
#     mutate(prop = n/???) %>% 
#     return()
# }

# mtcars %>% 
#   simple_prop(cyl)

# ==== Question 1b, BONUS: Can you build this function without using `enquos`? (hint: focus on "passing the dots ...") ====
# simple_prop_no_enquos <- function(???){
#   ???
# }


# ==== Question 2: add_mean function ====
# The function should get as an input the data set, the column on which to perform the mean copmutation, 
# and the grouping variables by which to compute the mean
# BONUS: Also pass the na.rm argument to mean, and have an argument for the user to set the name of the added variable

# add_mean <- function(data, mean_col, ...){
#   ??? <- enquo(???)
# 
#   tmp_res <- data %>%
#     group_by(???) %>%
#     summarize(computed_mean = mean(!!mean_var)) %>%
#     ungroup()
# 
#   data %>%
#     left_join(???) %>%
#     return()
# }

# # Example run
# mtcars %>%
#   add_mean(mpg, cyl, vs)