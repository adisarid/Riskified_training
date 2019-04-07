library(tidyverse)
# Some minor comments which should be noted following the last lesson.

# When using gather, you don't have to specify what *NOt* to gather, you can specify instead what to gather
# for example, using the diamonds data set
diamonds
diamonds %>% 
  gather(size_axis, size_value, x:z) 

# When using mutate_at or any other variation, instead of using funs(f(.)), use list(~f(.))
# instead of:
diamonds %>% 
  mutate_if(.predicate = is.numeric, .funs = funs(round(., 1)))

# use:
diamonds %>% 
  mutate_if(.predicate = is.numeric, .funs = list(~round(., 1)))

# to preserve the original values and add new use:
diamonds %>% 
  mutate_if(.predicate = is.numeric, .funs = list(rounded = ~round(., 1)))
