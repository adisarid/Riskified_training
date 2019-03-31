fib_loop <- function(n){
  if (round(n) != n){
    stop("Not an integer!")
  }
  f_n_minus_1 <- 1
  f_n_minus_2 <- 0
  for (i in 1:n){
    f_n_new <- f_n_minus_1 + f_n_minus_2
    f_n_minus_1 <- f_n_minus_2
    f_n_minus_2 <- f_n_new
  }
  f_n_new
}
