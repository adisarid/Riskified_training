map(iris, mean)
map_dbl(iris, mean)
# map reaches every vector and computes its mean.
# iris is a data frame which is actually a list in which each element is a different vector, e.g.:
iris[[1]]
# is the same as iris$Sepal.Length

# so map goes over all elements and returns the mean.
# we get a warning for Species since it's a character vector


# ==== Question 1: ====
# explain the differences between the following four code segments. Explain what happens in each.

# this code just measures the length of each column in iris (which are the same). The group_by has no meaning here.
iris %>% 
  group_by(Species) %>% 
  map_dbl(length)

# this code nests the iris df into a new column, each nested version is a different flower.
# than the length of the nested version is computed. Length returns the number of columns which is always 4.
iris %>% 
  group_by(Species) %>%
  nest() %>% 
  mutate(mean1 = map_int(data, length))

# similar to last time, only this time we're counting the number of rows.
iris %>% 
  group_by(Species) %>%
  nest() %>% 
  mutate(mean2 = map_int(data, NROW))

# calculates a linear model (lm) which is stored in new column lm. The linear model is computed per iris species
iris %>% 
  group_by(Species) %>%
  nest() %>% 
  mutate(lm = map(data, function(df) lm(data = df, Sepal.Length ~ .)))



# ==== Question 2: ====
# Using map, read all the files in file_list, and return their length (#rows and #columns).
# You should end up with a tibble containing the source url in one column the number of rows on the second, and the number of clumns on the third.

file_list <- c(
  "https://raw.githubusercontent.com/adisarid/Riskified_training/master/datasets/Medical_Appointments_No_Shows_KaggleV2-May-2016.csv",
  "https://raw.githubusercontent.com/adisarid/Riskified_training/master/datasets/SnP_stocks_5yr.csv",
  "https://raw.githubusercontent.com/adisarid/Riskified_training/master/datasets/WA_Fn-UseC_-Telco-Customer-Churn.csv",
  "https://raw.githubusercontent.com/adisarid/Riskified_training/master/datasets/googleplaystore.csv"
)

new_tib <- tibble(file_list,
                  all_data = map(file_list, ~ read_csv(.x))) %>% 
  mutate(n_rows = map_int(all_data, NROW),
         n_cols = map_int(all_data, NCOL))

# ==== Question 3: ====
# the function walk is used to get the side effect of functions, for example if we want to use a function that saves information to the hard disk.
# Using walk and a customized function, save three gglots that show the Sepal.Width versus Sepal.Length (each plot of a specific Species)

# Part 1: generate a function that creates the plot and saves it using ggsave
plot_species <- function(species_to_plot) {
  tmp1 <- ggplot(iris %>% 
           filter(Species == species_to_plot), 
           aes(x = Sepal.Length, y = Sepal.Width)) + 
    geom_point() + 
    stat_smooth()
  ggsave(filename = paste0(species_to_plot, ".png"),
         plot = tmp1)
}

# Part 2: use walk to run the function on all the species
iris %>% 
  pull(Species) %>% 
  unique() %>% 
  walk(plot_species)
