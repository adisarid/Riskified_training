# Question 1:
# explain the differences between the following four code segments. Explain what happens in each.

iris %>% 
  group_by(Species) %>% 
  map_dbl(length)

iris %>% 
  group_by(Species) %>%
  nest() %>% 
  mutate(mean1 = map_int(data, length))

iris %>% 
  group_by(Species) %>%
  nest() %>% 
  mutate(mean2 = map_int(data, NROW))

iris %>% 
  group_by(Species) %>%
  nest() %>% 
  mutate(lm = map(data, function(df) lm(data = df, Sepal.Length ~ .)))



# Question 2:
# Using map, read all the files in file_list, and return their length (#rows and #columns).
# You should end up with a tibble containing the source url in one column the number of rows on the second, and the number of clumns on the third.

file_list <- c(
  "https://raw.githubusercontent.com/adisarid/Riskified_training/master/datasets/Medical_Appointments_No_Shows_KaggleV2-May-2016.csv",
  "https://raw.githubusercontent.com/adisarid/Riskified_training/master/datasets/SnP_stocks_5yr.csv",
  "https://raw.githubusercontent.com/adisarid/Riskified_training/master/datasets/WA_Fn-UseC_-Telco-Customer-Churn.csv",
  "https://raw.githubusercontent.com/adisarid/Riskified_training/master/datasets/googleplaystore.csv"
)

# e.g. your final result should look like this:
# file_url | n_rows | n_cols
# url1...  | xxx    | yyy
# url2...  | xxx    | yyy
# ...


# ==== Question 3: ====
# the function walk is used to get the side effect of functions, for example if we want to use a function that saves information to the hard disk.
# Using walk and a customized function, save three gglots that show the Sepal.Width versus Sepal.Length (each plot of a specific Species).

# Part 1: generate a function that creates the plot and saves it using ggsave

# plot_and_save <- function(XXX){
#   ggplot(XXX) + ...
#   ggsave(XXX)
# }

# Part 2: use walk to run the function on all the species

# walk(XXX, plot_and_save)