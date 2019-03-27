# Spot the aesthetics interactive exercise (for slides)

ggplot(mtcars, aes(x = disp, y = mpg)) + 
  geom_point() + 
  ggtitle("Miles per galon\nas a function of engine displacement", subtitle = "Use ?mtcars for additional info")

ggplot(mtcars, aes(x = disp, y = mpg)) + 
  geom_point(aes(size = hp)) + 
  ggtitle("Miles per galon\nas a function of engine displacement", subtitle = "Use ?mtcars for additional info")

ggplot(mtcars, aes(x = disp, y = mpg)) + 
  geom_point(aes(size = hp, shape = factor(vs), color = factor(gear)), alpha = 0.65) + 
  ggtitle("Miles per galon\nas a function of engine displacement", subtitle = "Use ?mtcars for additional info")

ggplot(mtcars, aes(x = disp, y = mpg)) + 
  geom_point(aes(size = hp, shape = factor(vs), color = factor(gear)), alpha = 0.65) + 
  facet_wrap(~paste0("transmission=",am)) + 
  theme(legend.position = "bottom")

ggplot(mtcars, aes(x = disp, y = mpg)) + 
  geom_point(aes(size = hp, shape = factor(vs), color = factor(gear)), alpha = 0.65) + 
  facet_wrap(~paste0("transmission=",am)) + 
  theme(legend.position = "bottom") + 
  stat_smooth(method = "gam")
