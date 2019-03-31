fib_loop <- function(n, print_series = FALSE){
  if (round(n) != n){
    stop("Not an integer!")
  }
  if (n == 0){
    return(0)
  } else if (n == 1){
    return(1)
  }
  f_n_minus_1 <- 1
  f_n_minus_2 <- 0
  for (i in 1:(n-1)){
    f_n_new <- f_n_minus_1 + f_n_minus_2
    if (print_series){
      cat(
        paste0("f_n_minus_1=", f_n_minus_1, 
               "  f_n_minus_2=", f_n_minus_2, 
               " f_new=", f_n_new, "\n")) 
    }
    f_n_minus_2 <- f_n_minus_1
    f_n_minus_1 <- f_n_new
  }
  f_n_new
}