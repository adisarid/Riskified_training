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

simple_prop <- function(data, ...){
  prop_vars <- enquos(...)
  data %>% 
    count(!!!prop_vars) %>% 
    mutate(prop = n/sum(n)) %>% 
    return()
}

mtcars %>% simple_prop(cyl)

# ==== Question 1b, BONUS: Can you build this function without using `enquos`? (hint: focus on "passing the dots ...") ====

simple_prop_no_enquos <- function(data, ...){
  data %>% 
    count(...) %>% 
    mutate(prop = n/sum(n)) %>% 
    return()
}

mtcars %>% simple_prop_no_enquos(cyl)

# ==== Question 3: add_mean function ====

add_mean <- function(data, mean_col, ..., na.rm = F, name = "computed_mean"){
  mean_var <- enquo(mean_col)
  
  tmp_res <- data %>% 
    group_by(...) %>% 
    summarize(computed_mean = mean(!!mean_var, na.rm = na.rm)) %>% 
    ungroup()
  
  data %>% 
    left_join(tmp_res) %>% 
    rename_at(vars(computed_mean), ~return(name)) %>% 
    return()
}

mtcars %>% 
  add_mean(mpg, cyl, vs, name = "new_computed_mean")